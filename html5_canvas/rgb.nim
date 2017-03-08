# Contains the rgb() function (for colors)

from colors import Color, extractRGB


## Get an RGB color
proc rgb*(r, g, b: int): cstring {.inline.} =
  return "rgb(" & $r & "," & $g & "," & $b & ")"

## Convert a Nim Color over to a JS friendly color
proc rgb*(clr: Color): cstring {.inline.} =
  let comp = extractRGB(clr)
  return rgb(comp.r, comp.g, comp.b)

