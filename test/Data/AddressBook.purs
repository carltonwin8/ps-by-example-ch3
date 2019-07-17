module Test.Data.AddressBook where

import Prelude
import Effect (Effect)
import Effect.Console (log)
import Test.Assert (assert)

import Data.AddressBook (showAddress, showEntry)

main :: Effect Unit
main = do
  assert (1 == 2)
  let address = { street: "123 fake st", city: "fake city", state: "ca" }
  assert (showAddress address == "123 fake st, fake city: ca")
  let entry = { firstName: "John", lastName: "Smith", address: address }
  assert (showEntry entry == "Smith, John: 123 fake st, fake city: ca")
  log "Pass asserts"