import std/[math, strutils, sequtils, parseutils]
import utils
    
proc encode*(s: openArray[int]): seq[byte] = 
    var mlength = 0
    for i in s:
        if i > mlength:
             mlength = i
    mlength = ceil(mlength.binLen / 8).int
    result.add mlength.byte
    var tmp: byte
    for x in s:
        let b = x.toBin(mlength * 8)
        for i in countup(0, b.len-1, 8):
            if i+7 < b.len:
                discard b[i..i+7].parseBin(tmp)
            else:
                discard b[i..^1].parseBin(tmp)
            result.add tmp


proc encode*(s: openArray[int], lo: var int): seq[byte] = 
    var mlength = 0
    for i in s:
        if i > mlength:
             mlength = i
    mlength = ceil(mlength.binLen / 8).int
    lo = mlength
    var tmp: byte
    for x in s:
        let b = x.toBin(mlength * 8)
        for i in countup(0, b.len-1, 8):
            if i+7 < b.len:
                discard b[i..i+7].parseBin(tmp)
            else:
                discard b[i..^1].parseBin(tmp)
            result.add tmp

proc decode*(i: openArray[byte], l = 0): seq[int] = 
    var ri = i.toSeq
    var rl: int
    if l == 0:
        rl = ri[0].int
        ri.delete(0)
    else:
        rl = l
    var tmp: int
    for index in countup(0, ri.len-1, rl):
        var rstr = ""
        for x in ri[index..index+rl-1]:
            rstr &= x.int.toBin(8)
        discard rstr.parseBin(tmp)
        result.add tmp