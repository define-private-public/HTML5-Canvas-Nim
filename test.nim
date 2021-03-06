import dom
import math
import html5_canvas
import colors


proc canvasTest()=
  let
    canvas = dom.document.getElementById("info-canvas").Canvas

  canvas.height = canvas.width

  echo "These are just some data urls of the first mini-canvas, don't mind them:"
  echo $canvas.toDataURL("image/jpeg", 0.2)
  echo $canvas.toDataURL()


proc dataTest()=
  let
    canvas = dom.document.getElementById("data-canvas").Canvas
    ctx = canvas.getContext2D()

  ctx.translate(0.5, 0.5)
  ctx.lineWidth = 1

  ctx.strokeStyle = rgb(255, 0, 0)
  ctx.beginPath()
  ctx.moveTo(0, 0)
  ctx.lineTo(0, 2)
  ctx.closePath()
  ctx.stroke()

  ctx.strokeStyle = rgb(0, 255, 0)
  ctx.beginPath()
  ctx.moveTo(1, 0)
  ctx.lineTo(1, 2)
  ctx.closePath()
  ctx.stroke()

  ctx.strokeStyle = rgb(0, 0, 255)
  ctx.beginPath()
  ctx.moveTo(2, 0)
  ctx.lineTo(2, 2)
  ctx.closePath()
  ctx.stroke()

  echo "The data below \"didn't happen.\"  Catch my drift?"
  let imgData = ctx.getImageData(0, 0, 3, 3)
  echo imgData.width, "x", imgData.height, " byte-size:", imgData.data.len

  # Paste it over
  ctx.putImagedata(imgData, 3, 0)


# Rectangle functions
proc rectTest()=
  let
    canvas = dom.document.getElementById("rect-canvas").Canvas
    ctx = canvas.getContext2D()

  ctx.fillStyle = rgb(colDarkGreen)   # Using a Nim `colors` module color!
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

  echo "This is only some TextMetrics info code, pay no attention:"
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
  ctx.moveTo(4, 150)
  for ix in countup(30, 210, 15):
    let
      x = ix.float - (3 * sqrt(ix.float))
      y = if ix mod 10 == 0: 100 else: 150
    ctx.lineTo(x, y.float)
  ctx.stroke()

  ctx.miterLimit = 10
  ctx.strokeStyle = rgb(0, 128, 255)
  ctx.setLineDash(@[25.0, 10.0])
  ctx.lineDashOffset = 23
  ctx.lineWidth = 2.5
  ctx.beginPath()
  ctx.moveTo(20, 180)
  ctx.lineTo(180, 160)
  ctx.stroke()

  echo "This is only a test for getting dash values, please ignore:"
  echo $ctx.getLineDash()


# Gradient & Pattern Tests
proc gradAndPattTest()=
  let
    canvas = dom.document.getElementById("grad-and-patt-canvas").Canvas
    ctx = canvas.getContext2D()
    pattern1 = dom.document.getElementById("pattern").ImageElement
    pattern2 = dom.document.getElementById("text-canvas").Canvas
#    pattern3 = dom.document.getElementById("data-canvas").Canvas.getContext2D().getImageData(0, 0, 3, 3)

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

  ctx.fillStyle = ctx.createPattern(pattern1, Repeat)
  ctx.beginPath()
  ctx.moveTo(10, 55)
  ctx.lineTo(65, 115)
  ctx.lineTo(20, 180)
  ctx.closePath()
  ctx.fill()

  ctx.strokeStyle = ctx.createPattern(pattern2, RepeatY)
  ctx.lineWidth = 10
  ctx.beginPath()
  ctx.moveTo(150, 10)
  ctx.lineTo(200, 0)
  ctx.lineTo(90, 90)
  ctx.closePath()
  ctx.stroke()



proc shadowTest()=
  let
    canvas = dom.document.getElementById("shadow-canvas").Canvas
    ctx = canvas.getContext2D()

  ctx.fillStyle = rgb(25, 35, 50)
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
  ctx.moveTo(100, 100)
  ctx.rect(105, 15, 85, 85)
  ctx.arc(145, 55, 35, 0.3 * Pi, 1.8 * Pi)
  ctx.closePath()
  ctx.stroke()

  ctx.strokeStyle = rgb(255, 0, 200)
  ctx.beginPath()
  ctx.ellipse(150, 170, 20, 35, -105 * Pi / 180, 0, 1.5 * Pi)
  ctx.stroke()


proc paths2Test()=
  let
    canvas = dom.document.getElementById("paths-2-canvas").Canvas
    ctx = canvas.getContext2D()

  # Make a star of sorts
  var
    points:seq[tuple[x:float, y:float]] = @[]
    theta = -90.0
    r = 30.0

  for i in 0..<12:
    let
      angle = theta * Pi / 180.0
      x = r * cos(angle)
      y = r * sin(angle)

    points.add((x, y))
    theta += 135
    

  # Draw with simply lines
  ctx.strokeStyle = rgb(200, 0, 50)
  ctx.moveTo(points[0].x + 50, points[1].y + 50)
  ctx.beginPath()
  for i in 1..high(points):
    ctx.lineTo(points[i].x + 50, points[i].y + 50)
  ctx.stroke()
  ctx.closePath()


  # Fill draw (NonZero)
  ctx.fillStyle = rgb(50, 0, 200)
  ctx.moveTo(points[0].x + 150, points[0].y + 50)
  ctx.beginPath()
  for i in 1..high(points):
    ctx.lineTo(points[i].x + 150, points[i].y + 50)
  ctx.fill()
  ctx.closePath()

  # Fill draw (EvenOdd)
  ctx.fillStyle = rgb(200, 0, 200)
  ctx.moveTo(points[0].x + 150, points[0].y + 150)
  ctx.beginPath()
  for i in 1..high(points):
    ctx.lineTo(points[i].x + 150, points[i].y + 150)
  ctx.fill(EvenOdd)
  ctx.closePath()

  # Clipping
  ctx.fillStyle = rgb(50, 0, 50)
  ctx.arc(25, 175, 50, 0, 2 * Pi)
  ctx.clip(NonZero)
  ctx.fillRect(5, 125, 50, 50)

  echo "Forget about what you're going to see below, just testing some \"point in path/stroke\" values:"
  echo ctx.isPointInStroke(20, 180)
  echo ctx.isPointInPath(20, 180, NonZero)


proc transformsTest()=
  let
    canvas = dom.document.getElementById("transforms-canvas").Canvas
    ctx = canvas.getContext2D()

  ctx.strokeStyle = rgb(200, 20, 0)
  ctx.lineWidth = 3
  ctx.rotate(15.0 * Pi / 180.0)
  ctx.strokeRect(4, 4, 125, 35)

  ctx.setTransform(1, 0, 0, 1, 0, 0)    # Reset to identity matrix
  ctx.scale(1.5, 0.5)
  ctx.beginPath()
  ctx.fillStyle = rgb(200, 100, 10)
  ctx.arc(100, 50, 20, 0, 2 * Pi)
  ctx.fill()

  ctx.resetTransform()      # Reset to identity matrix
  ctx.lineWidth = 1
  ctx.strokeStyle = rgb(30, 200, 70)
  ctx.translate(0.5, 0.5)   # Pixel aligned drawing!
  ctx.strokeRect(25, 125, 50, 40)

  ctx.transform(1, 0.5, 0.7, 1, 0, 0);    # A skew matrix
  ctx.fillStyle = rgb(100, 230, 20)
  ctx.fillRect(75, 75, 30, 60)


proc compositingTest()=
  let
    canvas = dom.document.getElementById("compositing-canvas").Canvas
    ctx = canvas.getContext2D()

  # Alpha blending
  ctx.fillStyle = rgb(0, 100, 200)
  var
    a = 1.0
    y = 10.0
  for x in countup(10, 200, 10):
    ctx.globalAlpha = a
    ctx.fillRect(x.float, y, 40, 40)
    
    a -= 0.05
    y += 7.5

  ctx.globalAlpha = 0.8
  ctx.globalCompositeOperation = SourceAtop
  ctx.fillStyle = rgb(250, 10, 65)

  ctx.arc(140, 140, 100, 0, 2 * Pi)
  ctx.fill()

  ctx.lineJoin = BevelJoin
  ctx.strokeStyle = rgb(50, 245, 65)
  ctx.lineWidth = 15
  ctx.strokeRect(35, 35, 150, 150)


proc imageDraw1Test()=
  let
    canvas = dom.document.getElementById("image-drawing-1-canvas").Canvas
    ctx = canvas.getContext2D()
    kevin = dom.document.getElementbyId("kevin-bacon").ImageElement

  ctx.fillStyle = "black"
  ctx.fillRect(0, 0, 200, 200)

  # He deserives a holy glow around him
  ctx.shadowColor = "yellow"
  ctx.shadowBlur = 25
  ctx.drawImage(kevin, 35, 10)
 

proc imageDraw2Test()=
  let
    canvas = dom.document.getElementById("image-drawing-2-canvas").Canvas
    ctx = canvas.getContext2D()

    # Get some canvas to source from
    src1 = dom.document.getElementById("line-canvas").Canvas
    src2 = dom.document.getElementById("grad-and-patt-canvas").Canvas

  ctx.drawImage(src1, 0, 0, 100, 200)
  ctx.drawImage(src2, 65, 65, 40, 60, 100, 0, 100, 200)


proc stateTest()=
  let
    canvas = dom.document.getElementById("state-canvas").Canvas
    ctx = canvas.getContext2D()

  ctx.strokeStyle = rgb(80, 255, 80)
  ctx.lineWidth = 5
  ctx.save()

  ctx.strokeStyle = rgb(0, 80, 255)
  ctx.fillStyle = rgb(255, 80, 0)
  ctx.translate(100, 10)
  ctx.rotate(60 * Pi / 180)
  ctx.fillRect(10, 0, 100, 100)
  ctx.strokeRect(10, 0, 100, 100)

  ctx.restore()
  ctx.strokeRect(150, 150, 45, 45)
  ctx.fillRect(155, 155, 35, 35)

  # Verify some stuff
  echo "Testing to see if a Canvas matches, look the other way:"
  echo "same:", (canvas == ctx.canvas)


proc dynamicCreationTest()=
  echo "Testing dynamic canvas creation:"
   
  var canvas = dom.document.createElement("canvas").Canvas
  let ctx = canvas.getContext2D()
  dom.document.body.appendChild(canvas)

  canvas.width = 100
  canvas.height = 100

  ctx.textAlign = Center
  ctx.textBaseline = Middle

  ctx.fillText("I'm new here.", 50, 50)
  

# The dom on load
dom.window.onload = proc(e: dom.Event) =
  canvasTest()
  dataTest()
  rectTest()
  textTest()
  lineTest()
  gradAndPattTest()
  shadowTest()
  paths1Test()
  paths2Test()
  transformsTest()
  compositingTest()
  imageDraw1Test()
  imageDraw2Test()
  stateTest()
  dynamicCreationTest()




