-- Modern CRM schema (Test_Xib_View).
-- Source of truth for the tables; build contacts.sqlite with:  python3 Database/build_db.py
-- Keep CreateEmptySQLDatabase in SQLite3_CRM.incl in step with this file.

CREATE TABLE 'person' (
    'id'         INTEGER PRIMARY KEY ASC AUTOINCREMENT,
    'type'       TEXT,
    'givenName'  TEXT,
    'middleName' TEXT,
    'surName'    TEXT,
    'balance'    REAL DEFAULT 0
);

CREATE TABLE 'address' (
    'id'        INTEGER PRIMARY KEY ASC AUTOINCREMENT,
    'personID'  INTEGER REFERENCES person (id),
    'type'      TEXT,
    'street'    TEXT,
    'apartment' TEXT,
    'city'      TEXT,
    'state'     TEXT,
    'zip'       TEXT
);

CREATE TABLE 'contact' (
    'id'       INTEGER PRIMARY KEY ASC AUTOINCREMENT,
    'personID' INTEGER REFERENCES person (id),
    'type'     TEXT,
    'contact'  TEXT
);
