import intenc
import random
mainlist = random.sample(
    range(0, 300), 
    counts=random.shuffle(
        list(range(0, 300))
    ),
    k=100
)
o = intenc.encode(mainlist)
print(o)
assert o.decode() == mainlist
o2 = intenc.encode(mainlist, "bpe")
print(o2)
assert o2.decode() == mainlist
