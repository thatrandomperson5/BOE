
#import unittest

from intenc/ne import nil
from intenc/bpe import nil
import random
    
proc toString(bytes: openarray[byte]): string =
    result = newString(bytes.len)
    copyMem(result[0].addr, bytes[0].unsafeAddr, bytes.len)

var test = newSeq[uint]()
for _ in 0..100:
    test.add rand(260).uint
echo "Orginal: ", test


var i: int


#test "can encode(ne)": # Standard number encoding
let o = ne.encode(test, i)
echo "Encoded bytes length: ", o.len
echo "Raw: ", o.toString
echo "Width: ", o[0] * 8
let r = ne.decode(o, i)
doAssert r == test

#test "can encode(bpe)": # Bit precision number encoding
let o2 = bpe.encode(test, i)
echo "Encoded bytes length: ", o2.len
echo "Raw: ", o2.toString
echo "Width: ", o2[0]
doAssert bpe.decode(o2, i) == test
  
