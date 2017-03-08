# This file is simply a meta-file that combines the necessary parts for this
# package to work.  Though because of Circular import issues, two procs are
# placed here.

when not defined(js) and not defined(Nimdoc):
  {.error: "This module only works for the JavaScript target.".}


import dom
include html5_canvas/rgb
include html5_canvas/ImageData
include html5_canvas/TextMetrics
include html5_canvas/CanvasGradient
include html5_canvas/CanvasPattern
include html5_canvas/Canvas
include html5_canvas/CanvasRenderingContext2D


# The combinded functions go here:

# Context grabbing
# For 2D only
proc getContext2D*(c: Canvas): CanvasRenderingContext2D {.inline.} =
  {.emit: [result, "=", c, ".getContext('2d');"].}

# Getting the <canvas> from the context
proc canvas*(ctx: CanvasRenderingContext2D): Canvas {.inline.} =
 {.emit: [result, "=", ctx, ".canvas;"].}

