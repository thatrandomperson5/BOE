## Bit precision int/number encoding
    
import std/[strutils, sequtils, parseutils, sugar]
import utils

proc binToInt(cache: var string): seq[byte] = 
    # Smash and pad
    let rem = cache.len mod 8
    if rem != 0:
        for _ in 1..(8 - rem):
            cache = "0" & cache

    var bnum: byte   
    for i in countup(0, cache.len-1, 8):
        doAssert parseBin(cache[i..i+7], bnum) == 8
        result.add bnum




proc encode*(us: openArray[uint], lo: var int): seq[byte] =
    ## Encode an array of integers into an seq of bytes.
    ## The bit length is stored into `lo`. 
    let s = us.map(a => a.int)
    var mlength = findMaxLen(s, true)
    mlength = mlength.binLen + 1
    var cache = ""
    for i in s:
        cache &= toBin(i, mlength)


    lo = mlength
    result.add binToInt(cache)

# Temporary removal
# proc encode*(s: openArray[int]): seq[byte] =
    # Encode and smash an array of ints into bytes.
    # The first byte will be the bit length
    # var tmp: int 
    # result = s.encode(tmp)
    # result.insert(tmp.byte, 0)

proc decode*(i: openArray[byte], l = 0): seq[uint] = 
    ## Decode and de-smash an array of bytes into a int seq
    var ri = i.toSeq
    var rl: int
    # if l == 0:
        # rl = ri[0].int
        # ri.delete(0)
    # else:
    rl = l

    var binstr = ""
    for x in ri:
        binstr &= x.int.toBin(8)
    #while binstr[0] == '0':
        #binstr = binstr[1..^1]
    #let padnum = rl - (binstr.len mod rl)
    #if padnum != rl:
        #for _ in 1..padnum:
            #binstr = "0" & binstr
    for _ in 1..(binstr.len mod rl):
         binstr = binstr[1..^1]
    var iitem: int
    for x in countup(0, binstr.len-1, rl):
        let item = binstr[x..x+rl-1]
        doAssert item.parseBin(iitem) == rl
        result.add iitem.uint
