# TODO header

import dom
include lib/rgb
include lib/ImageData
include lib/TextMetrics
include lib/CanvasGradient
include lib/CanvasPattern
include lib/Canvas
include lib/CanvasRenderingContext2D


# The combinded functions go here:


proc getContext2D*(c: Canvas): CanvasRenderingContext2D {.inline.} =
  {.emit: "`result` = `c`.getContext('2d');".}


