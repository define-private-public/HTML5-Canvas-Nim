# TODO header

import dom
from math import Pi

include lib/rgb


type
  Canvas* = ref CanvasObj
  CanvasObj {.importc.} = object of dom.Element

  CanvasRenderingContext2D* = ref CanvasRenderingContext2DObj
  CanvasRenderingContext2DObj {.importc.} = object
    font*: cstring
    strokeStyle*: cstring


proc getContext2D*(c: Canvas): CanvasRenderingContext2D {.inline.} =
  {.emit: "`result` = `c`.getContext('2d');".}


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

