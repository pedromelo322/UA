PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE images(
autor text,
nome text,
id text,
data text,
comentarios text,
likes text,
dislikes text);
CREATE TABLE users(
nome text,
email text,
password text);
COMMIT;
