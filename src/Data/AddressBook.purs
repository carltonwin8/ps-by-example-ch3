module Data.AddressBook where

import Prelude
import Control.Plus (empty)
import Data.List (List(..), filter, head, null, nubBy)
import Data.Maybe (Maybe)

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
-- same as point free form below (same function inputs on lhs and rhs or = )
-- insertEntry = Cons

--filter :: (Entry -> Boolean) -> AddressBook -> AddressBook
--head :: AddressBook -> Maybe Entry

findEntry :: String -> String -> AddressBook -> Maybe Entry
findEntry firstName lastName = filter filterEntry >>> head
--findEntry firstName lastName = head <<< filter filterEntry
--findEntry firstName lastName book = (head <<< filter filterEntry) book
--findEntry firstName lastName book = head $ filter filterEntry book
  where
    filterEntry :: Entry -> Boolean
    filterEntry entry = entry.firstName == firstName
      && entry.lastName == lastName

findAddress :: String -> String -> String -> AddressBook -> Maybe Entry
findAddress street city state = filter filterAddress >>> head
  where
    filterAddress :: Entry -> Boolean
    filterAddress entry = entry.address.street == street
      && entry.address.city == city
      && entry.address.state == state

printEntry :: String -> String -> AddressBook -> Maybe String
printEntry firstName lastName book = map showEntry (findEntry firstName lastName book)

printAddress :: String -> String -> String -> AddressBook -> Maybe String
printAddress street city state book = map showEntry (findAddress street city state book)

findEntryNotPresent :: String -> String -> AddressBook -> Boolean
findEntryNotPresent firstName lastName = filter filterEntry >>> null
  where
    filterEntry entry = entry.firstName == firstName
      && entry.lastName == lastName

--filter :: (Entry -> Boolean) -> AddressBook -> AddressBook
--head :: AddressBook -> Maybe Entry
removeDuplicates :: AddressBook -> AddressBook
removeDuplicates = nubBy filterEntry
  where
    filterEntry entry1 entry2 = entry1.firstName == entry2.firstName
      && entry1.lastName == entry2.lastName
