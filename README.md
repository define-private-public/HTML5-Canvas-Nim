HTML5 Canvas & Drawing for Nim
==============================

The official repo can be found on GitLab:
https://gitlab.com/define-private-public/HTML5-Canvas-Nim

It is where most of the develoment takes place.  But there is a GitHub mirror
where issues can be logged and will be addressed:
https://github.com/define-private-public/HTML5-Canvas-Nim

The current version is `v1.1`.


TODO:
 - [ ] Professional README
   - Don't forget to link to the mozilla docs
   - 2D drawing canvas only (maybe other ones in the future)
     - link to webgl package
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
   - `stroke/fillStyle`'s getters and setters
 - [ ] License mention in README


Extra:
 - [ ] Play nice with `colors` module

