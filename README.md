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

To add it to your application, simply call `import html5_canvas` at whatever
file you want to use it in.  Keep in mind that this only works for the
JavaScript target.

This API was designed after the one listed on the Mozilla docs.  Because the API
is nearly identical, you can find documentation for most of the behavior there:
https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D

Because of Nim there are some limitations and differences though:
 - Where the API might call for passing in a string as an argument or value,
   that has been replaced with distinct types.  E.g. For the rendering context's
   `globalCompositeOperation` field, you wouldn't pass in `'source-over'`, but
   `SourceOver`.  This helps ensure that we're playing safe here.  Please check
   the top of the `lib/CanvasRenderingContext2D.nim` file for all of them.  Most
   of them have an analogous CamelCase constant.
 - `resetTransform()` is emulated instead of being the real function call.  This
   is done for compatiblity between browsers.
 - `createPattern()` only supports using Images, Canvases, `ImageData` objects,
   and `CanvasRenderingContext2D`.
 - `drawImage()` only supports Image, and Canvas as sources right now.
 - The `strokeStyle` and `fillStyle` fields in the rendering context can be
   simply set but using an `=` with different types (e.g. `ctx.fillStyle =
   rgb(255, 0, 255)` or `ctx.fillStyle = canvas.createLinearGradient(0, 0, 100,
   100)`.  Yet when retriving their values you'll need to add the type onto the
   identifier.  These procs are:
   - `fillStyleColor`
   - `fillStyleGradient`
   - `fillStylePattern`
   - `strokeStyleColor`
   - `strokeStyleGradient`
   - `strokeStylePattern`

I recommend looking through the `test.nim` file's `*Test()` functions if you are
confused at all.


License
-------

This wrapper is available under the MIT license.  Please see the file
`LICENSE.txt` for details.

Extra:
 - [ ] Play nice with `colors` module



Other Things
------------

If something changes in the standard, or some browsers add common
implementations, pleas alert me so I can make the necessary changes.

Note that fonts may render differently in different browsers for the `text`
functions.  This is really out of my control and there is nothing I can do than
tell you to make sure your fonts look the same in each of the major browsers.
For example.  Look at the `Serif` font in the `textTest()` from `test.nim`.  It
renders larger in Firefox than in Chrome.

