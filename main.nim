#import LZW
from encoders/ne import nil
from encoders/bpe import nil
import random

const lorem = """
hello world! or not
"""

proc toString(bytes: openarray[byte]): string =
  result = newString(bytes.len)
  copyMem(result[0].addr, bytes[0].unsafeAddr, bytes.len)

var test = newSeq[int]()
for _ in 0..100:
    test.add rand(260)
let o = ne.encode(test)
echo "Orginal: ", test
echo "Encoded bytes length: ", o.len
echo "Raw: ", o.toString
echo "Width: ", o[0] * 8
doAssert ne.decode(o) == test

let o2 = bpe.encode(test)
echo "Encoded bytes length: ", o2.len
echo "Raw: ", o2.toString
echo "Width: ", o2[0]
doAssert bpe.decode(o2) == test