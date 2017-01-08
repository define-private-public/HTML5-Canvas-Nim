# Contains the TextMetrics bindings


type
  TextMetrics* = ref TextMetricsObj
  TextMetricsObj {.importc.} = object
    width*: float   # This is read-only

