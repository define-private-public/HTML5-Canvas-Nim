import dom
from math import Pi
import html5_canvas


# TODO test creating a canvas dynamically


# A Blank canvas for canvas info
proc canvasTest()=
  let
    canvas = dom.document.getElementById("info-canvas").Canvas

  canvas.height = canvas.width

  echo "These are just some data urls of the first mini-canvas, don't mind them:"
  echo $canvas.toDataURL("image/jpeg", 0.2)
  echo $canvas.toDataURL()


# Rectangle functions
proc rectTest()=
  let
    canvas = dom.document.getElementById("rect-canvas").Canvas
    ctx = canvas.getContext2D()

  ctx.fillStyle = "green"
  ctx.fillRect(10, 10.5, 50.5, 50)
  
  ctx.strokeStyle = "blue"
  ctx.strokeRect(30.5, 30, 50, 50.5)

  ctx.clearRect(20, 20, 25, 27.5)


# Text functions
proc textTest()=
  let
    canvas = dom.document.getElementById("text-canvas").Canvas
    ctx = canvas.getContext2D()

  ctx.font = "bold 24px Serif"
  ctx.fillStyle = "black"
  ctx.textBaseline = Hanging

  ctx.fillText("Nim+JS HTML5!", 4, 4)



# The dom on load
dom.window.onload = proc(e: dom.Event) =
  canvasTest()
  rectTest()
  textTest()

  let
    canvas = dom.document.getElementById("render-area").Canvas
    ctx = canvas.getContext2D()

  ctx.strokeStyle = rgb(255, 0, 200)
  ctx.beginPath()
  ctx.ellipse(100, 100, 50, 75, 45 * Pi / 180, 0, 1.5 * Pi)
  ctx.stroke()

