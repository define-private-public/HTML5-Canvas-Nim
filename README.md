HTML5 Canvas & Drawing for Nim
==============================

This is a light wrapper of the HTML5 Canvas Drawing API for Nim's JavaScript
target.  It can be found on nimble as the `html5_canvas` package. The current
version is `v1.1`.

The official repo can be found on GitLab:
https://gitlab.com/define-private-public/HTML5-Canvas-Nim

It is where most of the develoment takes place.  But there is a GitHub mirror
where issues can be logged and will be addressed:
https://github.com/define-private-public/HTML5-Canvas-Nim


More Details
------------

This will only work when you compile for JavaScript.  If you try to compile it
for something else it will fail.

This is for the 2D drawing API only (a.k.a. `CanvasRenderingContext2D`).  If you
are looking for a 3D API for the Canvas tag, take a look at stisa's `webgl`
package: https://github.com/stisa/webgl

If there is a part of the API that doesn't have support accross all of the major
browsers (e.g. `addHitRegion()`) it will not be bound.  If you want it in it'
should be too difficult to write a `proc` for yourself.  Take a look at the
source for example on how to do this; it's very simple.  The one exception to
this rule is that the `ellipse()` function is bound.  It will not work in
Internet Explorer (while it does in Edge).


Documentation/How to Use
------------------------

This API was designed after the one listed on the Mozilla docs.  Because the API
is nearly identical, you can find documentation for most of the behavior there:
https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D




License
-------

This wrapper is available under the MIT license.  Please see the file
`LICENSE.txt` for details.



TODO:
 - [ ] Professional README
   - for `createPattern()`, only <img>, <canvas>, `ImageData`, and `CanvasRenderingContext2D` are supported
   - There are `distinct` types for things (list them)
   - `resetTransform()` is actually emulated instead of being the real function call
   - Not all of the compositing operations are tested
   - drawImage() only uses <image> and <canvas> as sources right now
   - Some fonts might render differently in differnt browsers (e.g. Serif 48px in Chrome vs. Firefox)
   - If something is not supported that you think should be, create an issue on the tracker
   - `stroke/fillStyle`'s getters and setters


Extra:
 - [ ] Play nice with `colors` module

