# This file is only for docs! do not import directly

## The intenc docs
## ================
## - `ne<./intenc/ne>`_ number/int encoding
## - `bpe<./intenc/bpe>`_ bit precision number/int encoding
## Example
## =======
## .. code:: nim
## 
##   from intenc/ne import nil
##   from intenc/bpe import nil
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
## **Note**: Never import intenc directly, always choose a path (`/ne`, `/bpe`) or use the method used above.
## 


from intenc/ne import nil
from intenc/bpe import nil

