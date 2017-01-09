# Contains the CanvasRenderingContext2D bindings


type
  CanvasRenderingContext2D* = ref CanvasRenderingContext2DObj
  CanvasRenderingContext2DObj {.importc.} = object
    font*: cstring
    textAlign*: TextAlignment
    textBaseline*: TextBaseline

    lineWidth*: float
    lineCap*: LineCap
    lineJoin*: LineJoin
    miterLimit*: float
    lineDashOffset*: float

    shadowBlur*: float
    shadowColor*: cstring
    shadowOffsetX*: float
    shadowOffsetY*: float

  TextAlignment* = distinct cstring
  TextBaseline* = distinct cstring 
  LineCap* = distinct cstring
  LineJoin* = distinct cstring


# Since the 2D Context's `fillStyle` and `strokeStyle` can accept multiple types
# the following six procs are needed to keep cohesion with the JS API.
# fillStyle
proc `fillStyle=`*(
  ctx: CanvasRenderingContext2D;
  color: cstring
) {.inline.} =
  {.emit: [ctx, ".fillStyle=", color, ";"].}

proc `fillStyle=`*(
  ctx: CanvasRenderingContext2D;
  gradient: CanvasGradient
) {.inline.} =
  {.emit: [ctx, ".fillStyle=", gradient, ";"].}

# TODO this needs testing
proc `fillStyle=`*(
  ctx: CanvasRenderingContext2D;
  pattern: CanvasPattern
) {.inline.} =
  {.emit: [ctx, ".fillStyle=", pattern, ";"].}

# strokeStyle
proc `strokeStyle=`*(
  ctx: CanvasRenderingContext2D;
  color: cstring
) {.inline.} =
  {.emit: [ctx, ".strokeStyle=", color, ";"].}

proc `strokeStyle=`*(
  ctx: CanvasRenderingContext2D;
  gradient: CanvasGradient
) {.inline.} =
  {.emit: [ctx, ".strokeStyle=", gradient, ";"].}

# TODO this needs testing
proc `strokeStyle=`*(
  ctx: CanvasRenderingContext2D;
  pattern: CanvasPattern
) {.inline.} =
  {.emit: [ctx, ".strokeStyle=", pattern, ";"].}



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

proc measureText*(
  c: CanvasRenderingContext2D;
  text: cstring
): TextMetrics {.importcpp.}


# Line functions
proc getLineDash*(c: CanvasRenderingContext2D): seq[float] {.importcpp.} 

proc setLineDash*(
  c: CanvasRenderingContext2D;
  segments: seq[float]
) {.importcpp.}


# Gradients and Patterns
proc createLinearGradient*(
  c: CanvasRenderingContext2D;
  x0, y0: float;
  x1, y1: float;
): CanvasGradient {.importcpp.}

proc createRadialGradient*(
  c: CanvasRenderingContext2D;
  x0, y0: float;
  r0: float;
  x1, y1: float;
  r1: float
): CanvasGradient {.importcpp.}





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

