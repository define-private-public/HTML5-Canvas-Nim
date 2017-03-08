# Contains the Canvas bindings


import dom


type
  Canvas* = ref CanvasObj
  CanvasObj {.importc.} = object of dom.Element
    width*: int
    height*: int


proc toDataURL*(
  c: Canvas;
  imageFormat:cstring="image/png";
  encoderOptions:float=0.92
):cstring {.inline.} =
  {.emit: [result, "=", c, ".toDataURL(", imageFormat, ",", encoderOptions, ");"].}

