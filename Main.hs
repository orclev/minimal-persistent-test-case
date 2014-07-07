module Main where

import Model
import Database.Persist.Sqlite

main :: IO ()
main = runSqlite ":memory:" $ do
  runMigration migrateAll
  insertUnique testData
  getBy $ UniqueCheck 8 Active
  return ()