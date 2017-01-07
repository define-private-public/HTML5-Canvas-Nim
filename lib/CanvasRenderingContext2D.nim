# Contains the CanvasRenderingContext2D bindings


type
  CanvasRenderingContext2D* = ref CanvasRenderingContext2DObj
  CanvasRenderingContext2DObj {.importc.} = object
    # TODO what about gradients?  This looks like it only supports strings right now
    strokeStyle*: cstring
    fillStyle*: cstring

    font*: cstring
    textAlign*: TextAlignment
    textBaseline*: TextBaseline

    lineWidth*: float
    lineCap*: LineCap
    lineJoin*: LineJoin
    miterLimit*: float
    lineDashOffset*: float

  TextAlignment* = distinct cstring
  TextBaseline* = distinct cstring 
  LineCap* = distinct cstring
  LineJoin* = distinct cstring

const
  # TextAlignment
  Left* = "left".TextAlignment
  Right* = "right".TextAlignment
  Center* = "center".TextAlignment
  Start* = "start".TextAlignment
  End* = "end".TextAlignment

  # TextBaseline
  Top* = "top".TextBaseline
  Hanging* = "hanging".TextBaseline
  Middle* = "middle".TextBaseline
  Alphabetic* = "alphabetic".TextBaseline
  Ideographic* = "ideographic".TextBaseline
  Bottom* = "bottom".TextBaseline

  # TODO figure out a way to drop the "Cap," and "Join," portions of these.
  #      The problem is that plain old "Round," would conflict
  #LineCap
  ButtCap* = "butt".LineCap
  RoundCap* = "round".LineCap
  SquareCap* = "square".LineCap
  
  #LineJoin
  RoundJoin* = "round".LineJoin
  BevelJoin* = "bevel".LineJoin
  MiterJoin* = "miter".LineJoin
    


# Rectangle functions
proc clearRect*(
  c: CanvasRenderingContext2D;
  x, y: float;
  width, height: float
) {.importcpp.}

proc fillRect*(
  c: CanvasRenderingContext2D;
  x, y: float;
  width, height: float
) {.importcpp.}

proc strokeRect*(
  c: CanvasRenderingContext2D;
  x, y: float;
  width, height: float
) {.importcpp.}


# Text functions
proc fillText*(
  c: CanvasRenderingContext2D;
  text: cstring;
  x, y: float
) {.importcpp.}

proc fillText*(
  c: CanvasRenderingContext2D;
  text: cstring;
  x, y: float;
  maxWidth: float
) {.importcpp.}

proc strokeText*(
  c: CanvasRenderingContext2D;
  text: cstring;
  x, y: float
) {.importcpp.}

proc strokeText*(
  c: CanvasRenderingContext2D;
  text: cstring;
  x, y: float;
  maxWidth: float
) {.importcpp.}


# Line functions
proc getLineDash*(c: CanvasRenderingContext2D): seq[float] {.importcpp.} 

proc setLineDash*(
  c: CanvasRenderingContext2D;
  segments: seq[float]
) {.importcpp.} 






proc beginPath*(c: CanvasRenderingContext2D) {.importcpp.}

proc stroke*(c: CanvasRenderingContext2D) {.importcpp.}

proc moveTo*(c: CanvasRenderingContext2D; x, y: float) {.importcpp.}

proc lineTo*(c: CanvasRenderingContext2D; x, y: float) {.importcpp.}

proc ellipse*(
  c: CanvasRenderingContext2D;
  x, y: float;
  radiusX, radiusY: float;
  rotation: float;
  startAngle, endAngle: float;
  anticlockwise: bool = false
) {.importcpp.}

