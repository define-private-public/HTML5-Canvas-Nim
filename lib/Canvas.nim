# Contains the Canvas bindings


import dom


type
  Canvas* = ref CanvasObj
  CanvasObj {.importc.} = object of dom.Element

