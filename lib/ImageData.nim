# Contains the ImageData bindings


# TODO fields need testing
type
  ImageData* = ref ImageDataObj
  ImageDataObj {.importc.} = object
    width*: int         # read-only
    height*: int        # read-only
    data*: seq[uint8]   # read-only
    

# Note: Constructor is not added in because it's not supported in IE
