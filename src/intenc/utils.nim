
import std/[math, strutils]

# type intKeyedSeq*[T] = tuple[key: seq[T], data: seq[int]]

# proc makeKeys*[T](a: openArray[T]): intKeyedSeq[T] =
    # let key = a.deduplicate()
    # var data = newSeq[int]()
    # for item in a:
        # data.add key.find(item)
    # return (key.toSeq, data)
   
proc binLen*(num: int): int =
    if num == 0:
        return 1
    else:
        return floor(
            log(num.float, 2.0)
        ).int + 1
proc stoBin(num: int, length: int): string =
    var forward: string
    if num < 0:
        forward = "0"
    else:
        forward = "1"
    return forward & num.toBin(length-1)

proc findMaxLen*(s: openArray[int], assertpos=false): int = 
    result = 0
    for i in s:
        if assertpos:
            doAssert i > 0
        if i > result:
            result = i
