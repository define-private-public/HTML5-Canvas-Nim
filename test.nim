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
  ctx.fillRect(10, 10.5, 125.5, 125)

  ctx.clearRect(20, 20, 25, 27.5)
  ctx.clearRect(30, 30, 60, 67.5)
  
  ctx.strokeStyle = "blue"
  ctx.strokeRect(50.5, 50, 125, 125.5)

  ctx.clearRect(30, 30, 50, 40)


# Text functions
proc textTest()=
  let
    canvas = dom.document.getElementById("text-canvas").Canvas
    ctx = canvas.getContext2D()
    msg1 = "Nim+JS!"
    origLineWidth = ctx.lineWidth

  ctx.font = "bold 48px Serif"
  ctx.fillStyle = "black"
  ctx.textBaseline = Hanging

  for i in 4..<16:
    ctx.fillText(msg1, i.float, (20 - i).float)

  ctx.font = "bold italic 48px Serif"
  ctx.lineWidth = 1.5
  ctx.strokeStyle = "white"
  ctx.strokeText(msg1, 10, 10)

  echo "This is only some TextMetrics info code, pay no mind:"
  echo ctx.measureText(msg1).width;

  ctx.font = "24px Arial"
  ctx.lineWidth = origLineWidth
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


# Gradient & Pattern Tests
proc gradAndPattTest()=
  let
    canvas = dom.document.getElementById("grad-and-patt-canvas").Canvas
    ctx = canvas.getContext2D()

  var grad = ctx.createLinearGradient(0, 0, 80, 20)
  grad.addColorStop(0, "green")
  grad.addColorStop(0.5, "yellow")
  grad.addColorStop(1, rgb(128, 255, 0))
  ctx.fillStyle = grad
  ctx.fillRect(4, 4, 100, 100)

  grad = ctx.createRadialGradient(130, 130, 20, 110, 110, 80)
  grad.addColorStop(1, "cyan")
  grad.addColorStop(0, "magenta")
  ctx.strokeStyle = grad

  ctx.beginPath()
  ctx.lineJoin = RoundJoin
  ctx.lineWidth = 7.5
  ctx.moveTo(80, 80)
  ctx.lineTo(180, 180)
  ctx.lineTo(180, 80)
  ctx.lineTo(80, 80)
  ctx.lineTo(80, 180)
  ctx.lineTo(180, 80)
  ctx.moveTo(180, 180)
  ctx.lineTo(80, 180)
  ctx.stroke()


proc shadowTest()=
  let
    canvas = dom.document.getElementById("shadow-canvas").Canvas
    ctx = canvas.getContext2D()

  ctx.fillStyle = rgb(0, 0, 0)
  ctx.fillRect(0, 0, canvas.width.float, canvas.height.float)

  ctx.shadowColor = "red"
  ctx.fillStyle = "orange"
  ctx.shadowBlur = 75
  ctx.fillRect(10, 10, 80, 80)

  ctx.shadowOffsetX = -15
  ctx.shadowOffsetY = 5
  ctx.shadowBlur = 2
  ctx.fillStyle = "green"
  ctx.shadowColor = "yellow"
  ctx.fillRect(100, 100, 80, 50)


proc paths1Test()=
  let
    canvas = dom.document.getElementById("paths-1-canvas").Canvas
    ctx = canvas.getContext2D()

  ctx.lineWidth = 3

  ctx.strokeStyle = rgb(30, 0, 100)
  ctx.beginPath()
  ctx.moveTo(8, 8)
  ctx.lineTo(48, 8)
  ctx.lineTo(8, 48)
  ctx.closePath()
  ctx.stroke()

  ctx.strokeStyle = rgb(80, 0, 120)
  ctx.beginPath()
  ctx.moveTo(50, 50)
  ctx.bezierCurveTo(0, 0, 150, 20, 75, 75)
  ctx.quadraticCurveTo(-10, 150, 75, 175)
  ctx.arcTo(75, 100, 105, 110, 55)
  ctx.stroke()
  ctx.closePath()

  ctx.strokeStyle = rgb(130, 20, 200)
  ctx.beginPath()
  ctx.moveto(100, 100)
  ctx.rect(105, 15, 85, 85)
  ctx.arc(145, 55, 35, 0.3 * Pi, 1.8 * Pi)
  ctx.closePath()
  ctx.stroke()

  ctx.strokeStyle = rgb(255, 0, 200)
  ctx.beginPath()
  ctx.ellipse(150, 170, 20, 35, -105 * Pi / 180, 0, 1.5 * Pi)
  ctx.stroke()


# The dom on load
dom.window.onload = proc(e: dom.Event) =
  canvasTest()
  rectTest()
  textTest()
  lineTest()
  gradAndPattTest()
  shadowTest()
  paths1Test()


