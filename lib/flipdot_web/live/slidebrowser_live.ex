defmodule FlipdotWeb.SlidebrowserLive do
  use FlipdotWeb, :live_view
  alias Flipdot.Bitmap
  alias Flipdot.Display
  alias FlipdotWeb.VirtualDisplay
  import FlipdotWeb.VirtualDisplayComponent

  require Logger

  @images_path "priv/static/symbols"

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket) do
      VirtualDisplay.subscribe()
    end

    # Get all .txt files from priv/static/images and its subfolders
    image_files =
      Path.join([Application.app_dir(:flipdot), @images_path, "**", "*.txt"])
      |> Path.wildcard()
      |> Enum.map(fn path ->
        relative_path = Path.relative_to(path, Application.app_dir(:flipdot, @images_path))
        # Split the path into directory parts and filename
        parts = Path.split(relative_path)
        filename = Path.rootname(List.last(parts))
        folder_name = parts |> Enum.drop(-1) |> Path.join()
        {folder_name, filename, path}
      end)
      |> Enum.sort()

    initial_bitmap = Display.get()
    VirtualDisplay.update_bitmap(initial_bitmap)

    socket =
      socket
      |> assign(page_title: "Flipdot Slide Browser")
      |> assign(:bitmap, initial_bitmap)
      |> assign(:virtual_bitmap, initial_bitmap)
      |> assign(:image_files, image_files)
      |> assign(:delay_enabled, VirtualDisplay.get_delay_enabled())
      |> assign(:editing_file, nil)
      |> assign(:selected_file, nil)

    {:ok, socket}
  end

  @impl true
  def handle_event("load_image", %{"path" => path}, socket) do
    bitmap = Bitmap.from_file(path)
    VirtualDisplay.update_bitmap(bitmap)
    {:noreply, assign(socket, :virtual_bitmap, bitmap) |> assign(:selected_file, path)}
  end

  @impl true
  def handle_event("edit_filename", %{"path" => path}, socket) do
    # Load the image if it's not already selected
    socket =
      if socket.assigns.selected_file != path do
        bitmap = Bitmap.from_file(path)
        VirtualDisplay.update_bitmap(bitmap)
        assign(socket, :virtual_bitmap, bitmap) |> assign(:selected_file, path)
      else
        socket
      end

    {:noreply, assign(socket, :editing_file, path)}
  end

  @impl true
  def handle_event("rename_file", params, socket) do
    old_path = socket.assigns.editing_file
    new_name = params["value"]

    socket =
      if old_path && new_name do
        # Convert _build path to source path
        source_dir = Path.join(File.cwd!(), @images_path)
        build_dir = Application.app_dir(:flipdot, @images_path)
        relative_path = Path.relative_to(old_path, build_dir)
        old_source_path = Path.join(source_dir, relative_path)

        # Create the new path with the new name (keeping the .txt extension)
        new_source_path = Path.join(Path.dirname(old_source_path), new_name <> ".txt")
        new_build_path = Path.join(Path.dirname(old_path), new_name <> ".txt")

        # Only rename if the name actually changed
        if old_path != new_build_path do
          # First copy the file content before any operations
          file_content = File.read!(old_source_path)

          # Use git mv to rename the file in the source directory
          System.cmd("git", ["mv", old_source_path, new_source_path], cd: File.cwd!())

          # Create the build directory and write the file content
          File.mkdir_p!(Path.dirname(new_build_path))
          File.write!(new_build_path, file_content)

          # Clean up old build file if it exists
          if File.exists?(old_path), do: File.rm!(old_path)

          # Update the image_files list
          image_files =
            socket.assigns.image_files
            |> Enum.map(fn {folder, filename, path} ->
              if path == old_path do
                {folder, new_name, new_build_path}
              else
                {folder, filename, path}
              end
            end)

          socket
          |> assign(:image_files, image_files)
          |> assign(
            :selected_file,
            if(socket.assigns.selected_file == old_path, do: new_build_path, else: socket.assigns.selected_file)
          )
        else
          socket
        end
      else
        socket
      end

    {:noreply, assign(socket, :editing_file, nil)}
  end

  @impl true
  def handle_event("toggle-delay", params, socket) do
    # When checkbox is checked, we get the value. When unchecked, the param is not present
    enabled = Map.has_key?(params, "delay-enabled")
    VirtualDisplay.set_delay_enabled(enabled)
    {:noreply, assign(socket, :delay_enabled, enabled)}
  end

  @impl true
  def handle_info({:virtual_display_updated, bitmap}, socket) do
    {:noreply, assign(socket, :virtual_bitmap, bitmap)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="min-h-screen bg-gray-900 text-gray-100 flex flex-col">
      <div class="max-w-7xl w-full mx-auto flex-none">
        <div class="flex justify-between items-center mb-8 p-4">
          <h1 class="text-3xl font-bold">Flipdot Slide Browser</h1>
          <div class="flex items-center gap-2">
            <form phx-change="toggle-delay" class="flex items-center gap-2">
              <input
                type="checkbox"
                id="delay-enabled"
                name="delay-enabled"
                checked={@delay_enabled}
                class="w-4 h-4 text-indigo-600 bg-gray-700 border-gray-600 rounded focus:ring-indigo-500"
                value="true"
              />
              <label for="delay-enabled" class="text-sm text-gray-300">Enable Delay</label>
            </form>
          </div>
        </div>

        <div class="flex flex-col items-center mb-8">
          <.display bitmap={@virtual_bitmap} width={Display.width()} height={Display.height()} />
        </div>
      </div>

      <div class="flex-1 overflow-hidden">
        <div class="max-w-7xl mx-auto">
          <div class="bg-gray-800 rounded-lg p-4 h-full">
            <h2 class="text-xl font-bold mb-4 sticky top-0 bg-gray-800 py-2">Available Slides</h2>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4 overflow-y-auto max-h-[calc(100vh-24rem)]">
              <%= for {folder, filename, path} <- @image_files do %>
                <%= if @editing_file == path do %>
                  <div class={[
                    "p-4 rounded-lg transition-colors duration-200",
                    if(@selected_file == path, do: "bg-indigo-600", else: "bg-gray-700")
                  ]}>
                    <div class="flex items-center">
                      <span class="text-gray-400 text-sm"><%= folder %>/</span>
                      <form phx-submit="rename_file" class="flex-1" phx-click="stop_propagation">
                        <input
                          type="text"
                          name="value"
                          value={filename}
                          class="w-full bg-gray-800 text-gray-100 px-2 py-1 rounded focus:outline-none focus:ring-2 focus:ring-indigo-500"
                          autofocus
                          phx-blur="rename_file"
                          phx-click="stop_propagation"
                        />
                      </form>
                    </div>
                  </div>
                <% else %>
                  <div
                    class={[
                      "w-full p-4 rounded-lg transition-colors duration-200 text-left",
                      if(@selected_file == path, do: "bg-indigo-600", else: "bg-gray-700 hover:bg-gray-600")
                    ]}
                    phx-click="load_image"
                    phx-value-path={path}
                  >
                    <span class="text-gray-400 text-sm"><%= folder %>/</span>
                    <span
                      class="text-gray-100 cursor-pointer hover:underline"
                      phx-click="edit_filename"
                      phx-value-path={path}
                    >
                      <%= filename %>
                    </span>
                  </div>
                <% end %>
              <% end %>
            </div>
          </div>
        </div>
      </div>
    </div>
    """
  end

  @impl true
  def handle_event("stop_propagation", _params, socket) do
    {:noreply, socket}
  end
end
