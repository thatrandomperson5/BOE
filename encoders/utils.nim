
import std/[math, strutils]

type intKeyedSeq*[T] = tuple[key: seq[T], data: seq[int]]

proc makeKeys*[T](a: openArray[T]): intKeyedSeq[T] =
    let key = a.deduplicate()
    var data = newSeq[int]()
    for item in a:
        data.add key.find(item)
    return (key.toSeq, data)
   
proc binLen*(num: int): int =
    if num == 0:
        return 1
    else:
        return floor(
            log(num.float, 2.0)
        ).int + 1