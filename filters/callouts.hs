import Text.Pandoc
import Text.Pandoc.JSON

calloutNames = ["CalloutAlert"]

main = toJSONFilter callout
  where callout x@(Div (_, [oneClass], _) blocks)
          | oneClass `elem` calloutNames = [rawtex ("\\begin{"++oneClass++"}")] ++ blocks ++ [rawtex ("\\end{"++oneClass++"}")]
          | otherwise = [x]
        callout x = [x]
        rawtex = RawBlock (Format "latex")

