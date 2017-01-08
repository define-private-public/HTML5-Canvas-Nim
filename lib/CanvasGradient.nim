# Contains the CanvasGradient bindings


type
  CanvasGradient* = ref CanvasGradientObj
  CanvasGradientObj {.importc.} = object


# TODO test with `rgb()` function & CSS color string, e.g. "green"
# TODO test with radial and linear
proc addColorStop*(
  cg: CanvasGradient;
  offset: float;
  color: cstring
) {.importcpp.}
