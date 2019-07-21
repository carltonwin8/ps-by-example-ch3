module Test.Main where

import Prelude
import Effect (Effect)
import Effect.Console (log)
import Test.Assert (assert)

import Data.AddressBook (showAddress, showEntry, emptyBook, insertEntry)

main :: Effect Unit
main = do
  let address = { street: "123 fake st", city: "fake city", state: "ca" }
  assert (showAddress address == "123 fake st, fake city: ca")
  let entry = { firstName: "John", lastName: "Smith", address: address }
  let entryStr = "Smith, John: 123v fake st, fake city: ca"
  assert (showEntry entry /= entryStr)
  let address2 = {street: "1234 fake st", city: "fake city 2", state: "ca2"}
  let entry2 = {firstName: "Mary", lastName: "Jane", address: address2 }
  let book = emptyBook
  let book1 = insertEntry entry book
  let book2 = insertEntry entry2 book1
  --printEntry "Mary" "Jane" book2
  --let result2 = findEntry "Mary" "Jane1" book2
  --assert (result == entryStr)
  log "testing completed"
