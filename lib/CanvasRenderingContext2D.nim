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
  FillRule* = distinct cstring


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
  # LineCap
  ButtCap* = "butt".LineCap
  RoundCap* = "round".LineCap
  SquareCap* = "square".LineCap
  
  # LineJoin
  RoundJoin* = "round".LineJoin
  BevelJoin* = "bevel".LineJoin
  MiterJoin* = "miter".LineJoin

  # FillRule
  NonZero* = "nonzero".FillRule
  EvenOdd* = "evenodd".FillRule

    


# Rectangle functions
proc clearRect*(
  ctx: CanvasRenderingContext2D;
  x, y: float;
  width, height: float
) {.importcpp.}

proc fillRect*(
  ctx: CanvasRenderingContext2D;
  x, y: float;
  width, height: float
) {.importcpp.}

proc strokeRect*(
  ctx: CanvasRenderingContext2D;
  x, y: float;
  width, height: float
) {.importcpp.}


# Text functions
proc fillText*(
  ctx: CanvasRenderingContext2D;
  text: cstring;
  x, y: float
) {.importcpp.}

proc fillText*(
  ctx: CanvasRenderingContext2D;
  text: cstring;
  x, y: float;
  maxWidth: float
) {.importcpp.}

proc strokeText*(
  ctx: CanvasRenderingContext2D;
  text: cstring;
  x, y: float
) {.importcpp.}

proc strokeText*(
  ctx: CanvasRenderingContext2D;
  text: cstring;
  x, y: float;
  maxWidth: float
) {.importcpp.}

proc measureText*(
  ctx: CanvasRenderingContext2D;
  text: cstring
): TextMetrics {.importcpp.}


# Line functions
proc getLineDash*(ctx: CanvasRenderingContext2D): seq[float] {.importcpp.} 

proc setLineDash*(
  ctx: CanvasRenderingContext2D;
  segments: seq[float]
) {.importcpp.}


# Gradients and Patterns
proc createLinearGradient*(
  ctx: CanvasRenderingContext2D;
  x0, y0: float;
  x1, y1: float;
): CanvasGradient {.importcpp.}

proc createRadialGradient*(
  ctx: CanvasRenderingContext2D;
  x0, y0: float;
  r0: float;
  x1, y1: float;
  r1: float
): CanvasGradient {.importcpp.}


# Path manipulation
proc beginPath*(ctx: CanvasRenderingContext2D) {.importcpp.}

proc closePath*(ctx: CanvasRenderingContext2D) {.importcpp.}

proc moveTo*(
  ctx: CanvasRenderingContext2D;
  x, y: float
) {.importcpp.}

proc lineTo*(
  ctx: CanvasRenderingContext2D;
  x, y: float
) {.importcpp.}

proc bezierCurveTo*(
  ctx: CanvasRenderingContext2D;
  cp1x, cp1y: float;
  cp2x, cp2y: float;
  x, y: float
) {.importcpp.}

proc quadraticCurveTo*(
  ctx: CanvasRenderingContext2D;
  cpx, cpy: float;
  x, y: float
) {.importcpp.}

proc arc*(
  ctx: CanvasRenderingContext2D;
  x, y: float;
  radius: float;
  startAngle, endAngle: float;
  anticlockwise: bool = false
) {.importcpp.}

proc arcTo*(
  ctx: CanvasRenderingContext2D;
  x1, y1: float;
  x2, y2: float;
  radius: float;
) {.importcpp.}

# Note: this function works in Edge but not IE
proc ellipse*(
  ctx: CanvasRenderingContext2D;
  x, y: float;
  radiusX, radiusY: float;
  rotation: float;
  startAngle, endAngle: float;
  anticlockwise: bool = false
) {.importcpp.}

proc rect*(
  ctx: CanvasRenderingContext2D;
  x, y: float;
  width, height: float;
) {.importcpp.}


# Path drawing
proc fill*(ctx: CanvasRenderingContext2D) {.importcpp.}

proc fill*(
  ctx: CanvasRenderingContext2D;
  fillRule: FillRule
) {.importcpp.}

proc stroke*(ctx: CanvasRenderingContext2D) {.importcpp.}

proc clip*(ctx: CanvasRenderingContext2D) {.importcpp.}

proc clip*(
  ctx: CanvasRenderingContext2D;
  fillRule: FillRule
) {.importcpp.}

proc isPointInPath*(
  ctx: CanvasRenderingContext2D;
  x, y: float
): bool {.importcpp.}

proc isPointInPath*(
  ctx: CanvasRenderingContext2D;
  x, y: float;
  fillRule: FillRule
): bool {.importcpp.}

proc isPointInStroke*(
  ctx: CanvasRenderingContext2D;
  x, y: float
): bool {.importcpp.}


# Transformations
proc rotate*(
  ctx: CanvasRenderingContext2D;
  angle: float
) {.importcpp.}

proc scale*(
  ctx: CanvasRenderingContext2D;
  x, y: float
) {.importcpp.}

proc translate*(
  ctx: CanvasRenderingContext2D;
  x, y: float
) {.importcpp.}

proc transform*(
  ctx: CanvasRenderingContext2D;
  a: float;   # Horizontal scaling
  b: float;   # Horizontal skewing
  c: float;   # Vertical skewing
  d: float;   # Vertical scaling
  e: float;   # Horizontal moving
  f: float    # Vertical moving
) {.importcpp.}

proc setTransform*(
  ctx: CanvasRenderingContext2D;
  a: float;   # Horizontal scaling
  b: float;   # Horizontal skewing
  c: float;   # Vertical skewing
  d: float;   # Vertical scaling
  e: float;   # Horizontal moving
  f: float    # Vertical moving
) {.importcpp.}

# Note: the native function doesn't work in IE, Opera, or Safari, but it can be
#       emulated by calling setTransform() with an identity matrix
proc resetTransform*(ctx: CanvasRenderingContext2D) {.inline.} =
  ctx.setTransform(1, 0, 0, 1, 0, 0)
  

