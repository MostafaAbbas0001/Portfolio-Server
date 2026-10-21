# Portfolio seed

`Portfolio.sql` is the single content seed, based on the supplied October 20, 2026 export. It replaces the old numbered seeds and the Arabic update script.

Apply the database schema first, then run the seed from the `server` directory:

```sh
dotnet ef database update
psql "$DATABASE_URL" -v ON_ERROR_STOP=1 -f Seed/Portfolio.sql
```

For `psql`, `DATABASE_URL` must be a PostgreSQL URI (`postgresql://user:password@host:5432/database`) or libpq connection string. The API's `Host=...;Port=...;Database=...` Npgsql connection string is a different format. Alternatively, pass `psql -h HOST -p PORT -U USER -d DATABASE -v ON_ERROR_STOP=1 -f Seed/Portfolio.sql`.

The seed runs in one transaction and upserts by the export's existing IDs. It is safe to import repeatedly without duplicate rows; reapplying intentionally resets seeded content to this file's values. Additional rows are retained. Identity sequences advance to each table's current maximum ID. EF migration history, users, passwords, database ownership, and dump-specific `psql` commands are excluded. The API never reapplies the seed at startup.

The seed includes 2 languages, 10 pages, 14 sections, 39 technologies, 8 globals, and the professional experience start date. Arabic prose is preserved, with project URLs, years, technology references, company logo URLs, and profile links synchronized with the English records. The default OG image uses `/Uploads/images/og-image.jpg`.

## Admin content controls

| Location | Content |
| --- | --- |
| Content → Pages | Headlines, descriptions, calls to action, portrait, page SEO and all existing page sections |
| Pages → Projects → projects-list | Project records and order, URLs, technology keys, screenshots/captions, store links, and per-project SEO |
| Pages → Experience → experience-list | Job history, roles, company logos, dates, responsibilities, skills, and related project links |
| Content → Globals → site | Site identity, contact/social links, default OG image and description, `faviconUrl`, structured data, search verification codes |
| Content → Globals → header/footer | Logos, navigation, external links, availability, contact action, reply text, footer text |
| Content → Globals → interface | Public button labels, accessibility labels, language names, theme option labels, status messages, error/404 pages, count and experience wording |
| Content → Settings | Professional experience start date, shared by both languages |
| Technologies | Technology keys, names, and logos |
| Media | Upload/remove images and replace the resume PDF |

Select English or Arabic when editing pages and globals. Interface templates use `{count}`, `{ms}`, or `{years}`; retain those placeholders. The `zero`, `one`, `two`, `few`, `many`, and `other` fields follow the language's plural rules. Bundled interface defaults keep error pages usable when the API cannot be reached.

Screenshots and store URLs are empty where the supplied export provided none. Fill them through the project JSON using paths copied from Media. A page/project `ogImage` overrides its normal image; project detail pages otherwise use their first screenshot, then the global image. Clear a page/project `ogImage` to restore that fallback.

## Uploaded files

Git tracks only `.gitkeep` placeholders under `Uploads`; actual media and generated variants are excluded from Git and Docker build contexts. SQL stores image paths, not image bytes. Restore the existing `Uploads/images` and `Uploads/resume` files or Docker `portfolio-uploads` volume alongside this data. A fresh checkout needs media restored or uploaded through the admin panel before seeded image paths can resolve.

## Deployment

Deploy the API, apply schema changes and this seed deliberately, then deploy the client. The nginx configuration is in `client/deploy/nginx/mostafa-portfolio.conf`; validate with `nginx -t` before reloading nginx. Routine content edits after this initial import use the admin panel and do not require reseeding or redeploying.

## Checks

Run `npx tsc --noEmit` and `npm run lint` in `client`; run `dotnet build` in `server`. Seed imports should be checked against a disposable database with the real EF schema before applying to an existing installation.
