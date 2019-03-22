BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS `category_item_id` (
	`category_id`	INTEGER NOT NULL,
	`item_id`	INTEGER NOT NULL,
	FOREIGN KEY(`category_id`) REFERENCES `categories`(`id`),
	FOREIGN KEY(`item_id`) REFERENCES `items`(`id`)
);
INSERT INTO `category_item_id` (category_id,item_id) VALUES (1,1);
INSERT INTO `category_item_id` (category_id,item_id) VALUES (3,2);
INSERT INTO `category_item_id` (category_id,item_id) VALUES (1,2);
INSERT INTO `category_item_id` (category_id,item_id) VALUES (3,3);
INSERT INTO `category_item_id` (category_id,item_id) VALUES (1,4);
INSERT INTO `category_item_id` (category_id,item_id) VALUES (3,4);
INSERT INTO `category_item_id` (category_id,item_id) VALUES (2,5);
INSERT INTO `category_item_id` (category_id,item_id) VALUES (1,5);
INSERT INTO `category_item_id` (category_id,item_id) VALUES (1,6);
INSERT INTO `category_item_id` (category_id,item_id) VALUES (2,7);
INSERT INTO `category_item_id` (category_id,item_id) VALUES (3,7);
INSERT INTO `category_item_id` (category_id,item_id) VALUES (1,8);
INSERT INTO `category_item_id` (category_id,item_id) VALUES (3,8);
INSERT INTO `category_item_id` (category_id,item_id) VALUES (1,9);
INSERT INTO `category_item_id` (category_id,item_id) VALUES (3,10);
INSERT INTO `category_item_id` (category_id,item_id) VALUES (3,11);
INSERT INTO `category_item_id` (category_id,item_id) VALUES (1,12);
INSERT INTO `category_item_id` (category_id,item_id) VALUES (2,12);
INSERT INTO `category_item_id` (category_id,item_id) VALUES (3,12);
COMMIT;
