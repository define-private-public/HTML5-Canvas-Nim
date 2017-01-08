# Contains the TextMetrics bindings


import dom


type
  TextMetrics* = ref TextMetricsObj
  TextMetricsObj {.importc.} = object
    width*: float   # This is read-only

