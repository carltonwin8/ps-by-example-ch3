module Data.AddressBook where

import Prelude
import Control.Plus (empty)
-- import Data.List (List(..), filter, head)
import Data.List (List(..))
-- import Data.Maybe (Maybe)

type Address = {
  street :: String,
  city :: String,
  state :: String
}

showAddress :: Address -> String
showAddress addr = addr.street <> ", " <> addr.city <> ": " <>
  addr.state

type Entry = {
  firstName :: String,
  lastName :: String,
  address :: Address
}

showEntry :: Entry -> String
showEntry entry = entry.lastName <> ", " <> entry.firstName <> ": " <>
  showAddress entry.address

type AddressBook = List Entry
emptyBook :: AddressBook
emptyBook = empty

insertEntry :: Entry -> AddressBook -> AddressBook
insertEntry entry book = Cons entry book
-- same as point free form below
-- insertEntry = Cons
