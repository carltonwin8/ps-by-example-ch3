# PureScript

The code in this repository is based of the code in the
[PureScript by Example](https://leanpub.com/purescript/read)
online book.

Commands

- pulp init
- pulp run
- pulp build
- pulp test
- pulp browserify > public/main.js
- pulp build -O --to public/main.min.js
- pulp repl
- bower install purescript-math --save

## Notes

### Chapter 3 - Functions and Records

```purescript
pulp repl
> import Data.AddressBook
> address = { street: "123 fake st", city: "fake city", state: "ca" }
> entry = { firstName: "John", lastName: "Smith", address: address }
> book1 = insertEntry entry emptyBook
> book2 = insertEntry entry book1
> book2
({ address: { city: "fake city", state: "ca", street: "123 fake st" }, firstName: "John", lastName: "Smith" } : { address: { city: "fake city", state: "ca", street: "123 fake st" }, firstName: "John", lastName: "Smith" } : Nil)

> removeDuplicates book2
({ address: { city: "fake city", state: "ca", street: "123 fake st" }, firstName: "John", lastName: "Smith" } : Nil)
```
