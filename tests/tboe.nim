
import unittest

from BOE/ne import nil
from BOE/bpe import nil
import random
proc toString(bytes: openarray[byte]): string =
    result = newString(bytes.len)
    copyMem(result[0].addr, bytes[0].unsafeAddr, bytes.len)

var test = newSeq[int]()
for _ in 0..100:
    test.add rand(260)
echo "Orginal: ", test

test "can encode(ne)": # Standard number encoding
    let o = ne.encode(test)
    echo "Encoded bytes length: ", o.len
    echo "Raw: ", o.toString
    echo "Width: ", o[0] * 8
    let r = ne.decode(o)
    check r == test

test "can encode(bpe)": # Bit precision number encoding
    let o2 = bpe.encode(test)
    echo "Encoded bytes length: ", o2.len
    echo "Raw: ", o2.toString
    echo "Width: ", o2[0]
    check bpe.decode(o2) == test
  
