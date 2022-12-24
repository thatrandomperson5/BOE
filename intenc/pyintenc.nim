from intenc/ne import nil
from intenc/bpe import nil
import nimpy

proc bpeEncode*(a: openarray[int]): (seq[byte], int) {.exportpy.} = 
    var n: int
    let bytes = bpe.encode(a, n)
    return (bytes, n)

proc neEncode*(a: openarray[int]): (seq[byte], int) {.exportpy.} = 
    var n: int
    let bytes = ne.encode(a, n)
    return (bytes, n)

proc bpeDecode*(bytes: seq[byte], l: int): seq[int] {.exportpy.} = 
    return bpe.decode(bytes, l)



proc neDecode*(bytes: seq[byte], l: int): seq[int] {.exportpy.} = 
    return ne.decode(bytes, l)

    