import Text.Pandoc
import Text.Pandoc.JSON

main = toJSONFilter customTable
  where customTable (Table caption aligns widths heads rows) =
          [Table caption aligns (killWidths widths) heads rows]
        customTable x = [x]
        killWidths a = map f a
          where f _ = 0.0
--        rawtex = RawBlock (Format "latex")
--        doAligns a = concat $ map f a
--          where f AlignLeft    = "l"
--                f AlignRight   = "r"
--                f AlignCenter  = "c"
--                f AlignDefault = "l"

