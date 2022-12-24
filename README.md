# Intenc
A library for encoding and decoding integers. It dual supports nim and python.
## The routes
The two current routes are `ne` and `bpe`. Below is a chart to help you choose.
|Type|Stablity|Efficiency|Speed|
|-|-|-|-|
|ne|more stable|less efficient|untested|
|bpe|less stable|more efficient|untested|
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
