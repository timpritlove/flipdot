defmodule Flipdot.Font.Fonts.Letterbox do
  import Bitmap
  alias Flipdot.Font

  @font %Font{
    name: "letterbox",
    properties: %{
      copyright: "Public domain font. Share and enjoy.",
      family_name: "Blinkenlights",
      foundry: "BBB",
      weight_name: "Bold",
      slant: "R",
      pixel_size: 7
    },
    characters: %{
      0 => %{
        encoding: 0,
        name: "defaultchar",
        bitmap:
          defbitmap([
            " XXXXXX ",
            " XX  XX ",
            " XX  XX ",
            " XX  XX ",
            " XX  XX ",
            " XX  XX ",
            " XXXXXX "
          ])
      },
      ?\s => %{
        encoding: ?\s,
        bitmap:
          defbitmap([
            "        ",
            "        ",
            "        ",
            "        ",
            "        ",
            "        ",
            "        "
          ])
      },
      ?! => %{
        encoding: ?!,
        bitmap:
          defbitmap([
            "   XX   ",
            "   XX   ",
            "   XX   ",
            "   XX   ",
            "   XX   ",
            "        ",
            "   XX   "
          ])
      },
      ?" => %{
        encoding: ?",
        bitmap:
          defbitmap([
            " XX  XX ",
            " XX  XX ",
            "        ",
            "        ",
            "        ",
            "        ",
            "        "
          ])
      },
      ?# => %{
        encoding: ?#,
        bitmap:
          defbitmap([
            " XX  XX ",
            " XX  XX ",
            "XXXXXXXX",
            " XX  XX ",
            "XXXXXXXX",
            " XX  XX ",
            " XX  XX "
          ])
      },
      ?$ => %{
        encoding: ?$,
        bitmap:
          defbitmap([
            "   XX   ",
            " XXXXXX ",
            "XX XX   ",
            " XXXXXX ",
            "   XX XX",
            " XXXXXX ",
            "   XX   "
          ])
      },
      ?% => %{
        encoding: ?%,
        bitmap:
          defbitmap([
            " XX  XX ",
            " XX  XX ",
            "    XX  ",
            "   XX   ",
            "  XX    ",
            " XX  XX ",
            " XX  XX "
          ])
      },
      ?& => %{
        encoding: ?&,
        bitmap:
          defbitmap([
            " XXXX   ",
            "XX  XX  ",
            "XX  XX  ",
            " XXXX   ",
            "XX XX XX",
            "XX  XX  ",
            " XXX XX "
          ])
      },
      ?' => %{
        encoding: ?',
        bitmap:
          defbitmap([
            "   XX   ",
            "   XX   ",
            "        ",
            "        ",
            "        ",
            "        ",
            "        "
          ])
      },
      ?( => %{
        encoding: ?(,
        bitmap:
          defbitmap([
            "    XX  ",
            "   XX   ",
            "  XX    ",
            "  XX    ",
            "  XX    ",
            "   XX   ",
            "    XX  "
          ])
      },
      ?) => %{
        encoding: ?),
        bitmap:
          defbitmap([
            "  XX    ",
            "   XX   ",
            "    XX  ",
            "    XX  ",
            "    XX  ",
            "   XX   ",
            "  XX    "
          ])
      },
      ?* => %{
        encoding: ?*,
        bitmap:
          defbitmap([
            "   XX   ",
            "XX XX XX",
            " XXXXXX ",
            "XXXXXXXX",
            " XXXXXX ",
            "XX XX XX",
            "   XX   "
          ])
      },
      ?+ => %{
        encoding: ?1,
        bitmap:
          defbitmap([
            "        ",
            "   XX   ",
            "   XX   ",
            " XXXXXX ",
            " XXXXXX ",
            "   XX   ",
            "   XX   "
          ])
      },
      ?, => %{
        encoding: ?,,
        bitmap:
          defbitmap([
            " X",
            "X "
          ], baseline_y: -1)
      },
      ?- => %{
        encoding: ?-,
        bitmap:
          defbitmap([
            "        ",
            "        ",
            "        ",
            " XXXXXX ",
            " XXXXXX ",
            "        ",
            "        "
          ])
      },
      ?. => %{
        encoding: ?.,
        bitmap:
          defbitmap([
            "   XX   ",
            "   XX   "
          ])
      },
      ?/ => %{
        encoding: ?/,
        bitmap:
          defbitmap([
            "     XX ",
            "     XX ",
            "    XX  ",
            "   XX   ",
            "  XX    ",
            " XX     ",
            " XX     "
          ])
      },
      ?0 => %{
        encoding: ?0,
        bitmap:
          defbitmap([
            "  XXXX  ",
            " XX  XX ",
            " XX  XX ",
            " XX  XX ",
            " XX  XX ",
            " XX  XX ",
            "  XXXX  "
          ])
      },
      ?1 => %{
        encoding: ?1,
        bitmap:
          defbitmap([
            "   XX   ",
            "  XXX   ",
            "   XX   ",
            "   XX   ",
            "   XX   ",
            "   XX   ",
            "  XXXX  "
          ])
      },
      ?2 => %{
        encoding: ?2,
        bitmap:
          defbitmap([
            "  XXXX  ",
            " XX  XX ",
            "    XX  ",
            "   XX   ",
            "  XX    ",
            " XX     ",
            " XXXXXX "
          ])
      },
      ?3 => %{
        encoding: ?3,
        bitmap:
          defbitmap([
            "  XXXX  ",
            " XX  XX ",
            "     XX ",
            "    XX  ",
            "     XX ",
            " XX  XX ",
            "  XXXX  "
          ])
      },
      ?4 => %{
        encoding: ?4,
        bitmap:
          defbitmap([
            " XX     ",
            " XX  XX ",
            " XX  XX ",
            " XXXXXX ",
            "     XX ",
            "     XX ",
            "     XX "
          ])
      },
      ?5 => %{
        encoding: ?5,
        bitmap:
          defbitmap([
            " XXXXXX ",
            " XX     ",
            " XXXXX  ",
            "     XX ",
            "     XX ",
            " XX  XX ",
            "  XXXX  "
          ])
      },
      ?6 => %{
        encoding: ?6,
        bitmap:
          defbitmap([
            "  XXXX  ",
            " XX  XX ",
            " XX     ",
            " XXXXX  ",
            " XX  XX ",
            " XX  XX ",
            "  XXXX  "
          ])
      },
      ?7 => %{
        encoding: ?7,
        bitmap:
          defbitmap([
            " XXXXXX ",
            "     XX ",
            "    XX  ",
            "   XX   ",
            "   XX   ",
            "   XX   ",
            "   XX   "
          ])
      },
      ?8 => %{
        encoding: ?8,
        bitmap:
          defbitmap([
            "  XXXX  ",
            " XX  XX ",
            " XX  XX ",
            "  XXXX  ",
            " XX  XX ",
            " XX  XX ",
            "  XXXX  "
          ])
      },
      ?9 => %{
        encoding: ?9,
        bitmap:
          defbitmap([
            "  XXXX  ",
            " XX  XX ",
            " XX  XX ",
            "  XXXXX ",
            "     XX ",
            " XX  XX ",
            "  XXXX  "
          ])
      },
      ?: => %{
        encoding: ?:,
        bitmap:
          defbitmap([
            "   XX   ",
            "   XX   ",
            "        ",
            "   XX   ",
            "   XX   ",
            "        "
          ])
      },
      ?; => %{
        encoding: ?;,
        bitmap:
          defbitmap([
            "   XX   ",
            "   XX   ",
            "        ",
            "   XX   ",
            "   XX   ",
            "  XX    "
          ])
      },
      ?< => %{
        encoding: ?<,
        name: "less-than sign",
        bitmap:
          defbitmap([
            "        ",
            "    XX  ",
            "   XX   ",
            "  XX    ",
            "   XX   ",
            "    XX  ",
            "        "
          ])
      },
      ?= => %{
        encoding: ?=,
        bitmap:
          defbitmap([
            " XXXXXX ",
            "        ",
            " XXXXXX ",
            "        ",
            "        "
          ])
      },
      ?> => %{
        encoding: ?>,
        bitmap:
          defbitmap([
            "        ",
            "  XX    ",
            "   XX   ",
            "    XX  ",
            "   XX   ",
            "  XX    ",
            "        "
          ])
      },
      ?? => %{
        encoding: ??,
        bitmap:
          defbitmap([
            "  XXXX  ",
            " XX  XX ",
            "    XX  ",
            "   XX   ",
            "   XX   ",
            "        ",
            "   XX   "
          ])
      },
      ?@ => %{
        encoding: ?@,
        bitmap:
          defbitmap([
            " XXXXXX ",
            "XX    XX",
            "XX  X XX",
            "XX XX XX",
            "XX  XXX ",
            " XX     ",
            "  XXXXX "
          ])
      },
      ?A => %{
        encoding: ?A,
        bitmap:
          defbitmap([
            "  XXXX  ",
            " XX  XX ",
            " XX  XX ",
            " XXXXXX ",
            " XX  XX ",
            " XX  XX ",
            " XX  XX "
          ])
      },
      ?B => %{
        encoding: ?B,
        bitmap:
          defbitmap([
            " XXXXX  ",
            " XX  XX ",
            " XX  XX ",
            " XXXXX  ",
            " XX  XX ",
            " XX  XX ",
            " XXXXX  "
          ])
      },
      ?C => %{
        encoding: ?C,
        bitmap:
          defbitmap([
            "  XXXXX ",
            " XX     ",
            " XX     ",
            " XX     ",
            " XX     ",
            " XX     ",
            "  XXXXX "
          ])
      },
      ?D => %{
        encoding: ?D,
        bitmap:
          defbitmap([
            " XXXXX  ",
            " XX  XX ",
            " XX  XX ",
            " XX  XX ",
            " XX  XX ",
            " XX  XX ",
            " XXXXX  "
          ])
      },
      ?E => %{
        encoding: ?E,
        bitmap:
          defbitmap([
            " XXXXXX ",
            " XX     ",
            " XX     ",
            " XXXX   ",
            " XX     ",
            " XX     ",
            " XXXXXX "
          ])
      },
      ?F => %{
        encoding: ?F,
        bitmap:
          defbitmap([
            " XXXXXX ",
            " XX     ",
            " XX     ",
            " XXXX   ",
            " XX     ",
            " XX     ",
            " XX     "
          ])
      },
      ?G => %{
        encoding: ?G,
        bitmap:
          defbitmap([
            "  XXXX  ",
            " XX  XX ",
            " XX     ",
            " XX XXX ",
            " XX  XX ",
            " XX  XX ",
            "  XXXX  "
          ])
      },
      ?H => %{
        encoding: ?H,
        bitmap:
          defbitmap([
            " XX  XX ",
            " XX  XX ",
            " XX  XX ",
            " XXXXXX ",
            " XX  XX ",
            " XX  XX ",
            " XX  XX "
          ])
      },
      ?I => %{
        encoding: ?I,
        bitmap:
          defbitmap([
            "  XXXX  ",
            "   XX   ",
            "   XX   ",
            "   XX   ",
            "   XX   ",
            "   XX   ",
            "  XXXX  "
          ])
      },
      ?J => %{
        encoding: ?J,
        bitmap:
          defbitmap([
            "     XX ",
            "     XX ",
            "     XX ",
            "     XX ",
            "     XX ",
            " XX  XX ",
            "  XXXX  "
          ])
      },
      ?K => %{
        encoding: ?K,
        bitmap:
          defbitmap([
            " XX   XX ",
            " XX  XX  ",
            " XX XX   ",
            " XXXX    ",
            " XX XX   ",
            " XX  XX  ",
            " XX   XX "
          ])
      },
      ?L => %{
        encoding: ?L,
        bitmap:
          defbitmap([
            " XX     ",
            " XX     ",
            " XX     ",
            " XX     ",
            " XX     ",
            " XX     ",
            " XXXXXX "
          ])
      },
      ?M => %{
        encoding: ?M,
        bitmap:
          defbitmap([
            " XX   XX ",
            " XXX XXX ",
            " XXXXXXX ",
            " XX X XX ",
            " XX   XX ",
            " XX   XX ",
            " XX   XX "
          ])
      },
      ?N => %{
        encoding: ?N,
        bitmap:
          defbitmap([
            " XX   XX ",
            " XXX  XX ",
            " XXXX XX ",
            " XX XXXX ",
            " XX  XXX ",
            " XX   XX ",
            " XX   XX "
          ])
      },
      ?O => %{
        encoding: ?O,
        bitmap:
          defbitmap([
            "  XXXX  ",
            " XX  XX ",
            " XX  XX ",
            " XX  XX ",
            " XX  XX ",
            " XX  XX ",
            "  XXXX  "
          ])
      },
      ?P => %{
        encoding: ?P,
        bitmap:
          defbitmap([
            " XXXXX  ",
            " XX  XX ",
            " XX  XX ",
            " XXXXX  ",
            " XX     ",
            " XX     ",
            " XX     "
          ])
      },
      ?Q => %{
        encoding: ?Q,
        bitmap:
          defbitmap([
            "  XXXX  ",
            " XX  XX ",
            " XX  XX ",
            " XX  XX ",
            " XX  XX ",
            " XX XX  ",
            "  XX XX "
          ])
      },
      ?R => %{
        encoding: ?R,
        bitmap:
          defbitmap([
            " XXXXX  ",
            " XX  XX ",
            " XX  XX ",
            " XXXXX  ",
            " XX XX  ",
            " XX  XX ",
            " XX  XX "
          ])
      },
      ?S => %{
        encoding: ?S,
        bitmap:
          defbitmap([
            "  XXXX  ",
            " XX  XX ",
            " XX     ",
            "  XXXX  ",
            "     XX ",
            " XX  XX ",
            "  XXXX  "
          ])
      },
      ?T => %{
        encoding: ?T,
        bitmap:
          defbitmap([
            " XXXXXX ",
            "   XX   ",
            "   XX   ",
            "   XX   ",
            "   XX   ",
            "   XX   ",
            "   XX   "
          ])
      },
      ?U => %{
        encoding: ?U,
        bitmap:
          defbitmap([
            " XX  XX ",
            " XX  XX ",
            " XX  XX ",
            " XX  XX ",
            " XX  XX ",
            " XX  XX ",
            "  XXXX  "
          ])
      },
      ?V => %{
        encoding: ?V,
        bitmap:
          defbitmap([
            " XX  XX ",
            " XX  XX ",
            " XX  XX ",
            " XX  XX ",
            " XX  XX ",
            "  XXXX  ",
            "   XX   "
          ])
      },
      ?W => %{
        encoding: ?W,
        bitmap:
          defbitmap([
            "XX    XX",
            "XX    XX",
            "XX    XX",
            "XX    XX",
            "XX XX XX",
            "XXX  XXX",
            "XX    XX"
          ])
      },
      ?X => %{
        encoding: ?X,
        bitmap:
          defbitmap([
            "XX    XX",
            "XX    XX",
            " XX  XX ",
            "  XXXX  ",
            " XX  XX ",
            "XX    XX",
            "XX    XX"
          ])
      },
      ?Y => %{
        encoding: ?Y,
        bitmap:
          defbitmap([
            "XX    XX",
            "XX    XX",
            " XX  XX ",
            "  XXXX  ",
            "   XX   ",
            "   XX   ",
            "   XX   "
          ])
      },
      ?Z => %{
        encoding: ?Z,
        bitmap:
          defbitmap([
            " XXXXXX ",
            "     XX ",
            "    XX  ",
            "   XX   ",
            "  XX    ",
            " XX     ",
            " XXXXXX "
          ])
      },
      ?[ => %{
        encoding: ?[,
        bitmap:
          defbitmap([
            "  XXXX  ",
            "  XX    ",
            "  XX    ",
            "  XX    ",
            "  XX    ",
            "  XX    ",
            "  XXXX  "
          ])
      },
      ?\\ => %{
        encoding: ?\\,
        bitmap:
          defbitmap([
            " XX     ",
            " XX     ",
            "  XX    ",
            "   XX   ",
            "    XX  ",
            "     XX ",
            "     XX "
          ])
      },
      ?] => %{
        encoding: ?],
        bitmap:
          defbitmap([
            "XXXX",
            "  XX",
            "  XX",
            "  XX",
            "  XX",
            "  XX",
            "XXXX"
          ])
      },
      ?^ => %{
        encoding: ?^,
        bitmap:
          defbitmap([
            "  XXX  ",
            " XX XX ",
            "XX   XX",
            "       ",
            "       ",
            "       ",
            "       "
          ])
      },
      ?_ => %{
        encoding: ?_,
        bitmap:
          defbitmap([
            "        ",
            "        ",
            "        ",
            "        ",
            "        ",
            "        ",
            " XXXXXX "
          ])
      },
      ?` => %{
        encoding: ?`,
        bitmap:
          defbitmap([
            "  XX    ",
            "   XX   ",
            "        ",
            "        ",
            "        ",
            "        ",
            "        "
          ])
      },
      ?a => %{
        encoding: ?a,
        bitmap:
          defbitmap([
            "     ",
            "     ",
            " XXXX",
            "X   X",
            "X   X",
            "X   X",
            " XXXX"
          ])
      },
      ?b => %{
        encoding: ?b,
        bitmap:
          defbitmap([
            "X    ",
            "X    ",
            "XXXX ",
            "X   X",
            "X   X",
            "X   X",
            "XXXX "
          ])
      },
      ?c => %{
        encoding: ?c,
        bitmap:
          defbitmap([
            "     ",
            "     ",
            " XXXX",
            "X    ",
            "X    ",
            "X    ",
            " XXXX"
          ])
      },
      ?d => %{
        encoding: ?d,
        bitmap:
          defbitmap([
            "    X",
            "    X",
            " XXXX",
            "X   X",
            "X   X",
            "X   X",
            " XXXX"
          ])
      },
      ?e => %{
        encoding: ?e,
        bitmap:
          defbitmap([
            "     ",
            "     ",
            " XXX ",
            "X   X",
            "XXXXX",
            "X    ",
            " XXXX"
          ])
      },
      ?f => %{
        encoding: ?f,
        bitmap:
          defbitmap([
            "  XX",
            " X  ",
            " X  ",
            "XXXX",
            " X  ",
            " X  ",
            " X  "
          ])
      },
      ?g => %{
        encoding: ?g,
        bitmap:
          defbitmap([
            "     ",
            "     ",
            "     ",
            " XXXX",
            "X   X",
            " XXXX",
            "    X",
            "XXXX "
          ])
      },
      ?h => %{
        encoding: ?h,
        bitmap:
          defbitmap([
            "X    ",
            "X    ",
            "XXXX ",
            "X   X",
            "X   X",
            "X   X",
            "X   X"
          ])
      },
      ?i => %{
        encoding: ?i,
        bitmap:
          defbitmap([
            "X",
            " ",
            "X",
            "X",
            "X",
            "X",
            "X"
          ])
      },
      ?j => %{
        encoding: ?j,
        bitmap:
          defbitmap([
            "   X",
            "    ",
            "   X",
            "   X",
            "   X",
            "X  X",
            " XX "
          ])
      },
      ?k => %{
        encoding: ?k,
        bitmap:
          defbitmap([
            "X   ",
            "X  X",
            "X X ",
            "XX  ",
            "X X ",
            "X  X",
            "X  X"
          ])
      },
      ?l => %{
        encoding: ?l,
        bitmap:
          defbitmap([
            "X",
            "X",
            "X",
            "X",
            "X",
            "X",
            "X"
          ])
      },
      ?m => %{
        encoding: ?m,
        bitmap:
          defbitmap([
            "       ",
            "       ",
            "XXX XX ",
            "X  X  X",
            "X  X  X",
            "X  X  X",
            "X  X  X"
          ])
      },
      ?n => %{
        encoding: ?n,
        bitmap:
          defbitmap([
            "     ",
            "     ",
            "XXXX ",
            "X   X",
            "X   X",
            "X   X",
            "X   X"
          ])
      },
      ?o => %{
        encoding: ?o,
        bitmap:
          defbitmap([
            "     ",
            "     ",
            " XXX ",
            "X   X",
            "X   X",
            "X   X",
            " XXX "
          ])
      },
      ?p => %{
        encoding: ?p,
        bitmap:
          defbitmap([
            "     ",
            "     ",
            "XXXX ",
            "X   X",
            "XXXX ",
            "X    ",
            "X    "
          ])
      },
      ?q => %{
        encoding: ?q,
        bitmap:
          defbitmap([
            "     ",
            "     ",
            " XXXX",
            "X   X",
            " XXXX",
            "    X",
            "    X"
          ])
      },
      ?r => %{
        encoding: ?r,
        bitmap:
          defbitmap([
            "    ",
            "    ",
            " XXX",
            "X   ",
            "X   ",
            "X   ",
            "X   "
          ])
      },
      ?s => %{
        encoding: ?s,
        bitmap:
          defbitmap([
            "     ",
            "     ",
            " XXXX",
            "X    ",
            " XXX ",
            "    X",
            "XXXX "
          ])
      },
      ?t => %{
        encoding: ?t,
        bitmap:
          defbitmap([
            " X ",
            " X ",
            "XXX",
            " X ",
            " X ",
            " X ",
            " X "
          ])
      },
      ?u => %{
        encoding: ?u,
        bitmap:
          defbitmap([
            "     ",
            "     ",
            "X   X",
            "X   X",
            "X   X",
            "X   X",
            " XXX "
          ])
      },
      ?v => %{
        encoding: ?v,
        bitmap:
          defbitmap([
            "     ",
            "     ",
            "X   X",
            "X   X",
            "X   X",
            " X X ",
            "  X  "
          ])
      },
      ?w => %{
        encoding: ?w,
        bitmap:
          defbitmap([
            "       ",
            "       ",
            "X     X",
            "X     X",
            "X  X  X",
            "X  X  X",
            " XX XX "
          ])
      },
      ?x => %{
        encoding: ?x,
        bitmap:
          defbitmap([
            "     ",
            "     ",
            "X   X",
            " X X ",
            "  X  ",
            " X X ",
            "X   X"
          ])
      },
      ?y => %{
        encoding: ?y,
        bitmap:
          defbitmap([
            "     ",
            "     ",
            "X   X",
            "X   X",
            " XXXX",
            "    X",
            "XXXX "
          ])
      },
      ?z => %{
        encoding: ?z,
        bitmap:
          defbitmap([
            "     ",
            "     ",
            "XXXXX",
            "   X ",
            "  X  ",
            " X   ",
            "XXXXX"
          ])
      },
      ?{ => %{
        encoding: ?{,
        bitmap:
          defbitmap([
            "  X",
            " X ",
            " X ",
            "X  ",
            " X ",
            " X ",
            "  X"
          ])
      },
      ?| => %{
        encoding: ?|,
        bitmap:
          defbitmap([
            "X",
            "X",
            "X",
            "X",
            "X",
            "X",
            "X"
          ])
      },
      ?} => %{
        encoding: ?},
        bitmap:
          defbitmap([
            "X  ",
            " X ",
            " X ",
            "  X",
            " X ",
            " X ",
            "X  "
          ])
      },
      ?~ => %{
        encoding: ?~,
        bitmap:
          defbitmap([
            "     ",
            "     ",
            " X   ",
            "X X X",
            "   X ",
            "     ",
            "     "
          ])
      },

      # ISO 8859-1 CHARACTERS

      160 => %{
        encoding: 160,
        name: "no-break space",
        bitmap:
          defbitmap([
            " ",
            " ",
            " ",
            " ",
            " ",
            " ",
            " "
          ])
      },
      ?¡ => %{
        encoding: ?¡,
        name: "inverted exclamation mark",
        bitmap:
          defbitmap([
            "X",
            " ",
            "X",
            "X",
            "X",
            "X",
            "X"
          ])
      },
      ?¢ => %{
        encoding: ?¢,
        name: "cent sign",
        bitmap:
          defbitmap([
            "     ",
            "  XXX",
            " X   ",
            "XXXX ",
            " X   ",
            "  XXX",
            "     "
          ])
      },
      ?£ => %{
        encoding: ?£,
        name: "pound sign",
        bitmap:
          defbitmap([
            "  XXX",
            " X   ",
            " X   ",
            "XXXX ",
            " X   ",
            " X   ",
            "XXXXX"
          ])
      },
      ?¤ => %{
        encoding: ?¤,
        name: "currency sign",
        bitmap:
          defbitmap([
            "     ",
            "X   X",
            " XXX ",
            "X   X",
            "X   X",
            "X   X",
            " XXX ",
            "X   X"
          ])
      },
      ?¥ => %{
        encoding: ?¥,
        name: "yen sign",
        bitmap:
          defbitmap([
            "X   X",
            " X X ",
            "XXXXX",
            "  X  ",
            "XXXXX",
            "  X  ",
            "  X  "
          ])
      },
      ?¦ => %{
        encoding: ?¦,
        name: "broken bar",
        bitmap:
          defbitmap([
            "X",
            "X",
            "X",
            " ",
            "X",
            "X",
            "X"
          ])
      },
      ?§ => %{
        encoding: ?§,
        name: "section sign",
        bitmap:
          defbitmap([
            " XXX ",
            "X    ",
            " X   ",
            " XXX ",
            "X   X",
            " XXX ",
            "   X ",
            "    X",
            " XXX "
          ], baseline_y: -1)
      },
      ?ß => %{
        encoding: ?ß,
        bitmap:
          defbitmap([
            " XXX ",
            "X   X",
            "X  X ",
            "X X  ",
            "X  X ",
            "X   X",
            "X XX ",
            "X    "
          ], baseline_y: -1)
      },
      ?Ä => %{
        encoding: ?Ä,
        bitmap:
          defbitmap([
            "     ",
            "X   X",
            "     ",
            " XXX ",
            "X   X",
            "XXXXX",
            "X   X",
            "X   X"
          ])
      },
      ?Á => %{
        encoding: ?Á,
        bitmap:
          defbitmap([
            "   X ",
            "  X  ",
            "     ",
            " XXX ",
            "X   X",
            "XXXXX",
            "X   X",
            "X   X"
          ])
      },
      ?À => %{
        encoding: ?À,
        bitmap:
          defbitmap([
            " X   ",
            "  X  ",
            "     ",
            " XXX ",
            "X   X",
            "XXXXX",
            "X   X",
            "X   X"
          ])
      },
      ?Å => %{
        encoding: ?Å,
        bitmap:
          defbitmap([
            " XXX ",
            " XXX ",
            "     ",
            " XXX ",
            "X   X",
            "XXXXX",
            "X   X",
            "X   X"
          ])
      },
      ?Ã => %{
        encoding: ?Ã,
        bitmap:
          defbitmap([
            " XX X",
            "X XX ",
            "     ",
            " XXX ",
            "X   X",
            "XXXXX",
            "X   X",
            "X   X"
          ])
      },
      ?ä => %{
        encoding: ?ä,
        bitmap:
          defbitmap([
            "X   X",
            "     ",
            " XXXX",
            "X   X",
            "X   X",
            "X   X",
            " XXXX"
          ])
      },
      ?Ö => %{
        encoding: ?Ö,
        bitmap:
          defbitmap([
            "X   X",
            " XXX ",
            "X   X",
            "X   X",
            "X   X",
            "X   X",
            "X   X",
            " XXX "
          ])
      },
      ?ö => %{
        encoding: ?ö,
        bitmap:
          defbitmap([
            " X X ",
            "     ",
            " XXX ",
            "X   X",
            "X   X",
            "X   X",
            " XXX "
          ])
      },
      ?Ü => %{
        encoding: ?Ü,
        bitmap:
          defbitmap([
            "X   X",
            "     ",
            "X   X",
            "X   X",
            "X   X",
            "X   X",
            "X   X",
            " XXX "
          ])
      },
      ?ü => %{
        encoding: ?ü,
        bitmap:
          defbitmap([
            " X X ",
            "     ",
            "X   X",
            "X   X",
            "X   X",
            "X   X",
            " XXX "
          ])
      },
      ?¨ => %{
        encoding: ?¨,
        name: "diaresis",
        bitmap:
          defbitmap([
            "X X",
            "   ",
            "   ",
            "   ",
            "   ",
            "   ",
            "   "
          ])
      },
      ?© => %{
        encoding: ?©,
        name: "copyright sign",
        bitmap:
          defbitmap([
            " XXX ",
            "X   X",
            "  X  ",
            " X X ",
            " X   ",
            " X X ",
            "  X  ",
            "X   X",
            " XXX "
          ], baseline_y: -1)
      },
      ?€ => %{
        encoding: ?€,
        name: "euro sign",
        bitmap:
          defbitmap([
            "  XXX",
            " X   ",
            "XXXX ",
            " X   ",
            "XXXX ",
            " X   ",
            "  XXX"
          ])
      },
      ?¯ => %{
        encoding: ?¯,
        name: "macron",
        bitmap:
          defbitmap([
            "XXXXX",
            "     ",
            "     ",
            "     ",
            "     ",
            "     ",
            "     "
          ])
      },
      ?° => %{
        encoding: ?°,
        name: "degree sign",
        bitmap:
          defbitmap([
            " X ",
            "X X",
            " X ",
            "   ",
            "   ",
            "   ",
            "   "
          ])
      },
      ?± => %{
        encoding: ?±,
        name: "plus-minus sign",
        bitmap:
          defbitmap([
            "  X  ",
            "  X  ",
            "XXXXX",
            "  X  ",
            "  X  ",
            "     ",
            "XXXXX"
          ])
      },
      ?² => %{
        encoding: ?²,
        name: "superscript two",
        bitmap:
          defbitmap([
            "XX ",
            "  X",
            " X ",
            "X  ",
            "XXX",
            "   ",
            "   "
          ])
      },
      ?³ => %{
        encoding: ?³,
        name: "superscript three",
        bitmap:
          defbitmap([
            "XX ",
            "  X",
            " X ",
            "  X",
            "XX ",
            "   ",
            "   "
          ])
      },
      ?´ => %{
        encoding: ?´,
        name: "acute accent",
        bitmap:
          defbitmap([
            " X",
            "X "
          ], baseline_y: 5)
      },
      ?µ => %{
        encoding: ?µ,
        name: "micro sign",
        bitmap:
          defbitmap([
            "    ",
            "    ",
            "    ",
            "   X",
            "X  X",
            "X  X",
            "XXX ",
            "X   ",
            "X   "
          ], baseline_y: -1)
      },
      ?· => %{
        encoding: ?·,
        name: "middle dot",
        bitmap:
          defbitmap([
            " ",
            " ",
            " ",
            "X",
            " ",
            " ",
            " "
          ])
      },
      ?¹ => %{
        encoding: ?¹,
        name: "superscript one",
        bitmap:
          defbitmap([
            " X ",
            "XX ",
            " X ",
            " X ",
            "XXX",
            "   ",
            "   "
          ])
      },
      ?ª => %{
        encoding: ?ª,
        name: "feminine ordinal indicator",
        bitmap:
          defbitmap([
            " X ",
            "X X",
            "XXX",
            "X X",
            "   ",
            "   ",
            "   "
          ])
      },
      ?º => %{
        encoding: ?º,
        name: "masculine ordinal indicator",
        bitmap:
          defbitmap([
            " X ",
            "X X",
            "X X",
            " X ",
            "   ",
            "   ",
            "   "
          ])
      },
      ?« => %{
        encoding: ?«,
        name: "left-pointing double angle quotation mark",
        bitmap:
          defbitmap([
            "     ",
            "     ",
            " X X ",
            "X X  ",
            " X X ",
            "     ",
            "     "
          ])
      },
      ?¬ => %{
        encoding: ?¬,
        name: "not sign",
        bitmap:
          defbitmap([
            "     ",
            "     ",
            "     ",
            "XXXXX",
            "    X",
            "     ",
            "     "
          ])
      },
      ?» => %{
        encoding: ?»,
        name: "right-pointing double angle quotation mark",
        bitmap:
          defbitmap([
            "     ",
            "     ",
            " X X ",
            "  X X",
            " X X ",
            "     ",
            "     "
          ])
      },
      ?¼ => %{
        encoding: ?¼,
        name: "vulgar fraction one quarter",
        bitmap:
          defbitmap([
            " X      X   ",
            "XX     X    ",
            " X    X X  X",
            " X   X  X  X",
            " X  X   XXXX",
            "   X       X",
            "  X        X"
          ])
      },
      ?½ => %{
        encoding: ?½,
        name: "vulgar fraction one half",
        bitmap:
          defbitmap([
            " X      X   ",
            "XX     X    ",
            " X    X  XX ",
            " X   X  X  X",
            " X  X     X ",
            "   X     X  ",
            "  X     XXXX"
          ])
      },
      ?¾ => %{
        encoding: ?¾,
        name: "vulgar fraction three quarters",
        bitmap:
          defbitmap([
            " XX      X    ",
            "X  X    X     ",
            "  X    X  X  X",
            "X  X  X   X  X",
            " XX  X    XXXX",
            "    X        X",
            "   X         X"
          ])
      },
      ?¿ => %{
        encoding: ?¿,
        bitmap:
          defbitmap([
            "  X  ",
            "     ",
            "  X  ",
            "  X  ",
            "   X ",
            "X   X",
            " XXX "
          ])
      }
    }
  }

  def get(), do: @font
end
