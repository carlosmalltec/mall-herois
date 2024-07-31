CREATE TABLE categorys_storage (Id INTEGER PRIMARY KEY UNIQUE, Name TEXT);
CREATE TABLE heroes_storage (Id INTEGER PRIMARY KEY UNIQUE, Name TEXT, Active INTEGER, Category BLOB);
CREATE TABLE configures_storage (Types TEXT PRIMARY KEY UNIQUE, CursorTime INTEGER);
CREATE TABLE request_storage (Id INTEGER NULL, Name TEXT, Active INTEGER, Category BLOB);