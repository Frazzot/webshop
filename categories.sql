BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS `categories` (
	`id`	INTEGER PRIMARY KEY AUTOINCREMENT,
	`name`	varchar ( 100 ) NOT NULL
);
INSERT INTO `categories` (id,name) VALUES (1,'action');
INSERT INTO `categories` (id,name) VALUES (2,'puzzle');
INSERT INTO `categories` (id,name) VALUES (3,'adventure');
COMMIT;
