# This file is only for docs! do not import directly

## The BOE docs
## ============
## - `ne<./BOE/ne>`_ number/int encoding
## - `bpe<./BOE/bpe>`_ bit precision number/int encoding
## Example
## =======
## .. code:: nim
## 
##   from BOE/ne import nil
##   from BOE/bpe import nil
##   import random
##   proc toString(bytes: openarray[byte]): string =
##     result = newString(bytes.len)
##     copyMem(result[0].addr, bytes[0].unsafeAddr, bytes.len)
##   
##   var test = newSeq[int]()
##   for _ in 0..100:
##     test.add rand(260)
##   echo "Orginal: ", test
##    
##   let o = ne.encode(test)
##   echo "Encoded bytes length: ", o.len
##   echo "Raw: ", o.toString
##   echo "Width: ", o[0] * 8
##   let r = ne.decode(o)
##   doAssert r == test
##
##   let o2 = bpe.encode(test)
##   echo "Encoded bytes length: ", o2.len
##   echo "Raw: ", o2.toString
##   echo "Width: ", o2[0]
##   doAssert bpe.decode(o2) == test
##   
## ..
## 
## tmp


from BOE/ne import nil
from BOE/bpe import nil

