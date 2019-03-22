BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS `items` (
	`id`	INTEGER PRIMARY KEY AUTOINCREMENT,
	`price`	INTEGER,
	`amount`	INTEGER,
	`name`	varchar ( 100 ) NOT NULL,
	`image`	varchar ( 200 )
);
INSERT INTO `items` (id,price,amount,name,image) VALUES (0,NULL,NULL,'',NULL);
INSERT INTO `items` (id,price,amount,name,image) VALUES (2,299,3,'Mad Max','game2.jpg');
INSERT INTO `items` (id,price,amount,name,image) VALUES (3,99,6,'Recore','game3.jpg');
INSERT INTO `items` (id,price,amount,name,image) VALUES (4,399,4,'Assassin''s Creed Origins','game6.jpeg');
INSERT INTO `items` (id,price,amount,name,image) VALUES (5,349,7,'Quantum Break','game7.jpg');
INSERT INTO `items` (id,price,amount,name,image) VALUES (6,249,10,'Mortal Kombat X','game8.jpg');
INSERT INTO `items` (id,price,amount,name,image) VALUES (7,99,5,'Undertale','game9.jpg');
INSERT INTO `items` (id,price,amount,name,image) VALUES (8,499,6,'Final Fantasy XV','game10.jpg');
INSERT INTO `items` (id,price,amount,name,image) VALUES (9,199,3,'Forza Horizon 3','game11.jpg');
INSERT INTO `items` (id,price,amount,name,image) VALUES (10,149,5,'Kinect Sports Rivals','game12.jpg');
INSERT INTO `items` (id,price,amount,name,image) VALUES (11,199,15,'Minecraft','game13.jpg');
INSERT INTO `items` (id,price,amount,name,image) VALUES (12,499,8,'Shadow Of The Tomb Raider','game14.jpg');
COMMIT;
