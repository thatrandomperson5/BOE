import std/[math, strutils, sequtils, parseutils]
import utils


proc encode*(s: openArray[int]): seq[byte] =
    var mlength = 0
    for i in s:
        if i > mlength:
             mlength = i
    mlength = mlength.binLen + 1
    var cache = ""
    for i in s:
        cache &= toBin(i, mlength)
    # Smash and pad
    let rem = cache.len mod 8
    if rem != 0:
        for _ in 1..(8 - rem):
            cache = "0" & cache
    var bnum: byte
    
    result.add mlength.byte
    for i in countup(0, cache.len-1, 8):
        doAssert parseBin(cache[i..i+7], bnum) == 8
        result.add bnum

proc encode*(s: openArray[int], lo: var int): seq[byte] =
    var mlength = 0
    for i in s:
        if i > mlength:
             mlength = i
    mlength = mlength.binLen + 1
    var cache = ""
    for i in s:
        cache &= toBin(i, mlength)
    # Smash and pad
    let rem = cache.len mod 8
    if rem != 0:
        for _ in 1..(8 - rem):
            cache = "0" & cache
    var bnum: byte
    
    lo = mlength
    for i in countup(0, cache.len-1, 8):
         doAssert parseBin(cache[i..i+7], bnum) == 8
         result.add bnum

proc decode*(i: openArray[byte], l = 0): seq[int] = 
    var ri = i.toSeq
    var rl: int
    if l == 0:
        rl = ri[0].int
        ri.delete(0)
    else:
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
        result.add iitem
