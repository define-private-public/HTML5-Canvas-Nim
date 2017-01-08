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
 - [x] List of functions/properties to bind (https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D)
 - [ ] some examples/tests
 - [x] GitHub mirror
 - [ ] License mention in README
 - [ ] Check into using enumerations instead of making the programmer pass in strings
   - e.g. the `lineCap` field


To Bind & Test.  Key: `b`=bound, `x`=bound & tested
 - [b] rgb()
 - [x] Canvas
 - [x] width 
 - [x] height
 - [x] toDataURL()
 - [x] getContext()
 - [x] clearRect()
 - [x] fillRect()
 - [x] strokeRect()
 - [b] TextMetrics
 - [x] fillText()
 - [x] strokeText()
 - [ ] measureText()
 - [x] lineWidth
 - [x] lineCap
 - [x] lineJoin
 - [x] miterLimit
 - [x] lineDashOffset
 - [x] getLineDash()
 - [x] setLineDash()
 - [x] font
 - [x] textAlign
 - [x] textBaseline
 - [ ] fillStyle
 - [ ] strokeStyle
 - [ ] createLinearGradient()
 - [ ] createRadialGraident()
 - [ ] CanvasImageSource
 - [ ] createPattern()
 - [ ] shadowBlur
 - [ ] shadowColor
 - [ ] shadowOffsetX
 - [ ] shadowOffsetY
 - [ ] beginPath()
 - [ ] closePath()
 - [ ] moveTo()
 - [ ] lineTo()
 - [ ] bezierCurveTo()
 - [ ] quadraticCurveTo()
 - [ ] arc()
 - [ ] arcTo()
 - [ ] ellipse()  [EXP]
 - [ ] rect()
 - [ ] fill()
 - [ ] stroke()
 - [ ] drawFocusIfNeeded()
 - [ ] scrollPathIntoView()
 - [ ] clip()
 - [ ] isPointInPath()
 - [ ] isPointInStroke()
 - [ ] currentTransform
 - [ ] rotate()
 - [ ] scale()
 - [ ] translate()
 - [ ] transform()
 - [ ] setTransform()
 - [ ] resetTransform()
 - [ ] SVGMatrix
 - [ ] globalAlpha
 - [ ] globalCompositeOperation
 - [ ] drawImage()
 - [ ] createImageData()
 - [ ] getImageData()
 - [ ] putImageData()
 - [ ] ImageData
 - [ ] imageSmoothingEnabled  [EXP]
 - [ ] save()
 - [ ] restore
 - [ ] canvas
 - [ ] addHitRegion()  [EXP]
 - [ ] removeHitRegion()  [EXP]
 - [ ] clearHitRegions()  [EXP]


Extra:
 - [ ] shadowOffset to take Nim's tuples instead?
 - [ ] SVGMatrix <-> Nim Matrix
 - [ ] Play nice with `colors` module
