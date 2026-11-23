# Test_Xib_View ("Modern CRM")

A FutureBasic (FBE, macOS/Cocoa) app: XIB views over a SQLite database
(person / contact / address). It is the record/view pattern that apps generated
by [Api_Logic_Client](https://github.com/thomasgpeters/Api_Logic_Client) follow,
and the test bed for FB 7.1.x fixes.

## Rules
Follow Api_Logic_Client's `CLAUDE.md` and `docs/reference/FB Coding Rules.md` — they are
the shared rules for all of the author's FB code. In short: typed return values,
`//` comments (never `'` or `'~'1`), no `#build` in projects, view tags not
window tags, verify toolbox names in FutureBasic_Documentation's headers, CR
line endings. Check with Api_Logic_Client's linter before handing over:

```bash
python3 ../Api_Logic_Client/tools/fblint.py --headers ../FutureBasic_Documentation/Toolboxes/Headers .
```

## Project notes
- Build order is `Test Xib View.fbeproj/data.fbproj`; `-lsqlite3` is set in Build Settings.
- The app opens `~/Desktop/contacts.sqlite` (`CreateGlobalURL`) and creates it
  at launch if missing (`CreateEmptySQLDatabase`).
- `Database/` — `schema.sql` and `seed.sql` are the source of truth for the
  tables and sample data; `build_db.py` rebuilds `contacts.sqlite` from them or
  from an ALS model (`--als`). Keep `CreateEmptySQLDatabase` in step with `schema.sql`.
- SQL is built with the DataObject query builder and must match `schema.sql`:
  - describe the statement: `InitQueryDictionary` / `InitInsertIntoDictionary` /
    `InitUpdateDictionary` / `InitDeleteFromDictionary`, then `AddTableTo…`,
    `AddColumnTo…`, `AddFilterToQuery` (alias `@""` for UPDATE/DELETE), `AddAssociationToQuery` (joins)
  - generate: `GenerateSelectSQL` / `GenerateInsertIntoSQL` / `GenerateUpdateSQL` /
    `GenerateDeleteFromSQL` (`DataObject.incl`; parameterized, UPDATE/DELETE need a filter)
  - run: `BuildPreparedStatement_Select` + `ExecutePreparedStatement`, or
    `ExecuteInsert` (new id) / `ExecuteUpdate` / `ExecuteDelete` (rows changed) in `SQLite Interface.incl`
  - names are quoted in the generated SQL (`QuoteSQLName`: `Order` -> `"Order"`, `a.id` ->
    `"a"."id"`; already-quoted names such as `'Given Name'` are kept)
  - the builder files are shared with Api_Logic_Client's `src/Runtime/` (its data runtime):
    keep both copies identical, and fix them in both repos
  - example: the person functions in `SQLite3_CRM.incl` (`SelectAllPersonQuery`,
    `InsertPersonRecord`, `UpdatePersonRecord`, `DeletePersonRecord`).
- Obsolete demo code is removed once nothing references it (find unreferenced
  functions with a call graph from the main program, the `on appevent/menu/dialog`
  handlers and `@fn` callbacks).
- Work on `claude/dazzling-darwin-awec2o`; the author builds on a Mac and merges via pull requests.
