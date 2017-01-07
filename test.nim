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
    msg1 = "Nim+JS!"

  ctx.font = "bold 48px Serif"
  ctx.fillStyle = "black"
  ctx.textBaseline = Hanging

  for i in 4..<16:
    ctx.fillText(msg1, i.float, (20 - i).float)

  ctx.font = "bold italic 48px Serif"
  ctx.strokeStyle = "white"
  ctx.strokeText(msg1, 10, 10)

  ctx.font = "24px Arial"
  ctx.fillStyle = "green"
  ctx.strokeStyle = "blue"
  ctx.textAlign = Right
  ctx.textBaseline = Bottom
  ctx.strokeText("(in a HTML5", 200, 180, 80);
  ctx.fillText("canvas tag)", 190, 200, 50);


# Line functions
proc lineTest()=
  let
    canvas = dom.document.getElementById("line-canvas").Canvas
    ctx = canvas.getContext2D()


  ctx.lineWidth = 15
  ctx.lineCap = RoundCap
  ctx.lineJoin = RoundJoin
  ctx.strokeStyle = rgb(255, 0, 128)
  ctx.beginPath()
  ctx.moveTo(10, 10)
  ctx.lineTo(50, 50)
  ctx.lineTo(10, 90)
  ctx.stroke()

  ctx.lineCap = Buttcap
  ctx.lineJoin = BevelJoin
  ctx.strokeStyle = rgb(255, 128, 0)
  ctx.lineWidth = 10
  ctx.beginPath()
  ctx.moveTo(60, 10)
  ctx.lineTo(110, 50)
  ctx.lineTo(140, 5)
  ctx.lineTo(180, 75)
  ctx.stroke()

  ctx.miterLimit = 4
  ctx.strokeStyle = rgb(0, 255, 128)
  ctx.lineCap = SquareCap
  ctx.lineJoin = MiterJoin
  ctx.lineWidth = 5
  ctx.beginPath()
  ctx.moveTo(20, 150)
  for x in countup(30, 180, 15):
    let y = if x mod 10 == 0: 100 else: 150
    ctx.lineTo(x.float, y.float)
  ctx.stroke()

  ctx.miterLimit = 10
  ctx.strokeStyle = rgb(0, 128, 255)
  ctx.setLineDash(@[25.0, 10.0])
  ctx.lineDashOffset = 23
  ctx.lineWidth = 2.5
  ctx.beginPath()
  ctx.moveTo(20, 180)
  ctx.lineTo(180, 180)
  ctx.stroke()

  echo "This is only a test for getting dash values, please ignore:"
  echo $ctx.getLineDash()


# The dom on load
dom.window.onload = proc(e: dom.Event) =
  canvasTest()
  rectTest()
  textTest()
  lineTest()

  let
    canvas = dom.document.getElementById("render-area").Canvas
    ctx = canvas.getContext2D()

  ctx.strokeStyle = rgb(255, 0, 200)
  ctx.beginPath()
  ctx.ellipse(100, 100, 50, 75, 45 * Pi / 180, 0, 1.5 * Pi)
  ctx.stroke()

