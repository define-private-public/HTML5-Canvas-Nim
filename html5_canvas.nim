# TODO header

import dom
include lib/rgb
include lib/TextMetrics
include lib/Canvas
include lib/CanvasRenderingContext2D


# The combinded functions go here:


proc getContext2D*(c: Canvas): CanvasRenderingContext2D {.inline.} =
  {.emit: "`result` = `c`.getContext('2d');".}


