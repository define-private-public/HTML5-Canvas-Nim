# Contains the CanvasGradient bindings


type
  CanvasGradient* = ref CanvasGradientObj
  CanvasGradientObj {.importc.} = object


proc addColorStop*(
  cg: CanvasGradient;
  offset: float;
  color: cstring
) {.importcpp.}

