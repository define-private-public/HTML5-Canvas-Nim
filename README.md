HTML5 Canvas & Drawing for Nim
==============================

The official repo can be found on GitLab:
https://gitlab.com/define-private-public/HTML5-Canvas-Nim

It is where most of the develoment takes place.  But there is a GitHub mirror
where issues can be logged and will be addressed:
https://github.com/define-private-public/HTML5-Canvas-Nim

This is still a work in progress, expect a better README later.


TODO:
 - [ ] Professional README
   - Don't forget to link to the mozilla docs
   - 2D drawing canvas only (maybe other ones)?
   - If something doesn't have support accross all major browsers, it's not supported
   - Most experimental things aren't included, unless is has major support (see above)
   - for `createPattern()`, only <img>, <canvas>, `ImageData`, and `CanvasRenderingContext2D` are supported
   - ellipse() is here, but note it's supported in Edge but not IE
   - There are `distinct` types for things (list them)
   - `resetTransform()` is actually emulated instead of being the real function call
   - Not all of the compositing operations are tested
   - drawImage() only uses <image> and <canvas> as sources right now
   - Some fonts might render differently in differnt browsers (e.g. Serif 48px in Chrome vs. Firefox)
   - If something is not supported that you think should be, create an issue on the tracker
 - [x] List of functions/properties to bind (https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D)
 - [ ] some examples/tests
 - [x] GitHub mirror
 - [ ] License mention in README
 - [ ] Check into using enumerations instead of making the programmer pass in strings
   - e.g. the `lineCap` field


To Bind & Test.
Key: `b`=bound, `x`=bound & tested

[x] rgb()
[x] Canvas
[x] width 
[x] height
[x] toDataURL()
[ ] getContext()  [Only a hard coded one for 2D exists, add a generic one too]
[x] clearRect()
[x] fillRect()
[x] strokeRect()
[x] TextMetrics
[x] fillText()
[x] strokeText()
[x] measureText()
[x] lineWidth
[x] lineCap
[x] lineJoin
[x] miterLimit
[x] lineDashOffset
[x] getLineDash()
[x] setLineDash()
[x] font
[x] textAlign
[x] textBaseline
[x] CanvasGradient
[x] addColorStop()
[x] CanvasPattern
[x] fillStyle   [There's a set, but what about get?]
[x] strokeStyle [See above]
[x] createLinearGradient()
[x] createRadialGraident()
[x] createPattern()
[x] shadowBlur
[x] shadowColor
[x] shadowOffsetX
[x] shadowOffsetY
[x] beginPath()
[x] closePath()
[x] moveTo()
[x] lineTo()
[x] bezierCurveTo()
[x] quadraticCurveTo()
[x] arc()
[x] arcTo()
[x] ellipse()  [EXP]
[x] rect()
[x] fill()
[x] stroke()
[x] clip()
[x] isPointInPath()
[x] isPointInStroke()
[x] rotate()
[x] scale()
[x] translate()
[x] transform()
[x] setTransform()
[x] globalAlpha
[x] globalCompositeOperation
[x] drawImage()
[b] ImageData
[ ] createImageData()
[ ] getImageData()
[ ] putImageData()
[x] save()
[x] restore()
[x] canvas


Extra:
[ ] Play nice with `colors` module

