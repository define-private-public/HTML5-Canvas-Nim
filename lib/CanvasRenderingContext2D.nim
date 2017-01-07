# Contains the CanvasRenderingContext2D bindings


type
  CanvasRenderingContext2D* = ref CanvasRenderingContext2DObj
  CanvasRenderingContext2DObj {.importc.} = object
    font*: cstring
    strokeStyle*: cstring


proc beginPath*(c: CanvasRenderingContext2D) {.importcpp.}

proc stroke*(c: CanvasRenderingContext2D) {.importcpp.}

proc strokeText*(c: CanvasRenderingContext2D; txt: cstring, x, y: float) {.importcpp.}

proc ellipse*(
  c: CanvasRenderingContext2D;
  x, y: float;
  radiusX, radiusY: float;
  rotation: float;
  startAngle, endAngle: float;
  anticlockwise: bool = false
) {.importcpp.}

