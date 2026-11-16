# Database

The app opens `~/Desktop/contacts.sqlite` (see `CreateGlobalURL` in `SQLite Interface.incl`).

| File | What it is |
|---|---|
| `contacts.sqlite` | Ready-made database: the CRM tables plus sample data |
| `schema.sql` | The tables — edit this when the model changes |
| `seed.sql` | Sample data |
| `build_db.py` | Rebuilds the database (Python 3, standard library only) |

## Put the database on the Desktop

```bash
cp Database/contacts.sqlite ~/Desktop/
```

If the file is missing, the app also creates it at launch (`CreateEmptySQLDatabase`).

## Regenerate it as the app evolves

Edit `schema.sql` / `seed.sql`, then:

```bash
python3 Database/build_db.py --out ~/Desktop/contacts.sqlite
```

The previous file is kept as `contacts.sqlite.bak`. Also update
`CreateEmptySQLDatabase` in `SQLite3_CRM.incl` so the app creates the same tables.

## From an API Logic Server model

```bash
python3 Database/build_db.py --als http://localhost:5656 --user admin --password p --with-data --out ~/Desktop/app.sqlite
python3 Database/build_db.py --als metadata.json --out ~/Desktop/app.sqlite
```

The tables are generated from `/metadata?include=attributes` into `schema.als.sql`
(review it before use); `--with-data` copies each resource's records through the
JSON:API. Login tries `/api/auth/login`, then `/api/authentication-User/login`.
ALS metadata has no key information, so generated tables have no primary keys
unless the metadata marks them.
