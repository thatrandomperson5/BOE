# Intenc
A library for encoding and decoding integers. It dual supports nim and python.
## The routes
The two current routes are `ne` and `bpe`. Below is a chart to help you choose.
|Type|Stablity|Efficiency|Speed|Max number. [Full](#full-numbers)|
|-|-|-|-|-|
|ne|more stable|less efficient|untested|1.26238e614|
|bpe|less stable|more efficient|untested|5.78960e76|
## Structure
The output structure contains a length and data. The length determines how much of the output data is used up for each number. The data is the actual numbers in decimal.
# Nim
Really simple, choose a route and import it (`import intenc/ne`, `import intenc/bpe`). Use the proc `encode` to turn a array of ints into bytes. Use proc `decode` to turn encoded bytes back. Look at the docs for more info.
## Installation
```
nimble install https://github.com/thatrandomperson5/intenc
```
## [Docs](https://thatrandomperson5.github.io/intenc/intenc.html)

# Python
Run `encode(data)` to encode your data. If you want to use `"bpe"` supply that as the second argument. `encode` returns an EncodedBytes. You can decode that object using `.decode()`.
## Installation
```
pip install git+https://github.com/thatrandomperson5/intenc.git
```
## Docs
### `class EncodeBytes(data, length, etype)`
**Attrs:**
- data: The encoded bytes data
- length: The length of the integers inside the data
- etype: The encoding type
#### `def decode(self) -> List[int]`
Takes no arguments, decodes the object. Returns a list of usigned integers.

### `def encode(ints: List[int], etype: str = "ne") -> EncodedBytes:`
Takes a list of usigned ints and a encoding type. Encodeds and returns an EncodedBytes object
### `def decode(data: bytes, length: int, etype: str = "ne") -> List[int]`
Decodes bytes data, length and type not in object form. Returns a list of usigned integers.

# Notes
## Full numbers
### NE
```
126238304966058622268417487065116999845484776053576109500509161826268184136202698801551568013761380717534054534851164138648904527931605160527688095259563605939964364716019515983399209962459578542172100149937763938581219604072733422507180056009672540900709554109516816573779593326332288314873251559077853068444977864803391962580800682760017849589281937637993445539366428356761821065267423102149447628375691862210717202025241630303118559188678304314076943801692528246980959705901641444238894928620825482303431806955690226308773426829503900930529395181208739591967195841536053143145775307050594328881077553168201547775
```
### BPE
```
57896044618658097711785492504343953926634992332820282019728792003956564819967
```
