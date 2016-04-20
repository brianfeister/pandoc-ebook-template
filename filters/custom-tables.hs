import Text.Pandoc
import Text.Pandoc.JSON

{--
main = toJSONFilter inlineLatex
  where inlineLatex (Emph xs) =
          [latex "\\Emph{"  ] ++ xs ++ [latex "}"]
        inlineLatex (Strong xs) =
          [latex "\\Strong{"] ++ xs ++ [latex "}"]
        inlineLatex s@(Span (id, as, kps) xs) =
          case as of
            ["tag"] -> [latex "\\ParTag{"] ++ xs ++ [latex "}"]
            ["basedon"] -> [latex "\\BasedOn{"] ++ xs ++ [latex "}"]
            _ -> [s]
        inlineLatex x = [x]
        latex = RawInline (Format "latex")
--}


main = toJSONFilter customTable
  where customTable (Table caption aligns widths heads rows) =
          [Table caption aligns (killWidths widths) heads rows]
        customTable x = [x]
        rawtex = RawBlock (Format "latex")
        killWidths a = map f a
          where f _ = 0.0
        doAligns a = concat $ map f a
          where f AlignLeft    = "l"
                f AlignRight   = "r"
                f AlignCenter  = "c"
                f AlignDefault = "l"

