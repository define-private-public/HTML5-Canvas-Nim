# Contains the rgb() function (for colors)


# TODO this clashes with colors.rgb().  Figure out a solution
## Get an RGB color
proc rgb*(r, g, b: int): cstring {.inline.} =
  return "rgb(" & $r & "," & $g & "," & $b & ")"

