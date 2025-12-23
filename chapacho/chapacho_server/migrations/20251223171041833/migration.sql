BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "lecture_note" (
    "id" bigserial PRIMARY KEY,
    "title" text NOT NULL,
    "audioPath" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "durationSeconds" bigint,
    "transcript" text,
    "formattedContent" text,
    "tags" json
);


--
-- MIGRATION VERSION FOR chapacho
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('chapacho', '20251223171041833', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251223171041833', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20251208110333922-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110333922-v3-0-0', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_idp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_idp', '20251208110420531-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110420531-v3-0-0', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_core
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_core', '20251208110412389-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110412389-v3-0-0', "timestamp" = now();


COMMIT;
