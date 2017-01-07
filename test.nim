import dom
from math import Pi
import html5_canvas


# TODO test creating a canvas dynamically


# A Blank canvas
proc canvasTest()=
  let
    canvas = dom.document.getElementById("canvas-test").Canvas

  canvas.height = canvas.width

  echo "These are just some data urls of the first mini-canvas, don't mind them:"
  echo $canvas.toDataURL("image/jpeg", 0.2)
  echo $canvas.toDataURL()


# The dom on load
dom.window.onload = proc(e: dom.Event) =
  canvasTest()

  let
    font:string = "30px Arial"
    msg:string = "Hello Nim+JS!"
    canvas = dom.document.getElementById("render-area").Canvas
    ctx = canvas.getContext2D()

  ctx.font = font
  ctx.strokeText(msg, 10, 50)

  ctx.strokeStyle = rgb(255, 0, 200)
  ctx.beginPath()
  ctx.ellipse(100, 100, 50, 75, 45 * Pi / 180, 0, 1.5 * Pi)
  ctx.stroke()

