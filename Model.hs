module Model where

import Database.Persist
import Database.Persist.Sqlite
import Database.Persist.TH
import Data.Text

share [mkPersist sqlSettings, mkMigrate "migrateAll"] [persistLowerCase|
Test
    field1 Text
    field2 Int Maybe
    field3 Int
    field4 Checkmark nullable
    UniqueOne field1
    UniqueCheck field3 field4 !force
    deriving Show Eq

|]

testData :: Test
testData = Test "Testing" (Just 5) 8 Active