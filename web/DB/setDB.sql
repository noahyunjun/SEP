drop database if exists SEproject_DB; -- if not need, delete it
create database SEproject_DB;

use SEproject_DB;

create table users(
	user_id INT NOT NULL AUTO_INCREMENT,
	user_name VARCHAR(100) NOT NULL,
	account_id VARCHAR(50) NOT NULL UNIQUE,
	account_pw VARCHAR(64) NOT NULL, -- sha256
	PRIMARY KEY (user_id)
)ENGINE = InnoDB AUTO_INCREMENT = 1 ROW_FORMAT = DEFAULT CHARACTER SET utf8;

create table managers(
	manager_id INT NOT NULL AUTO_INCREMENT,
	manager_name VARCHAR(100) NOT NULL,
	account_id VARCHAR(50) NOT NULL UNIQUE,
	account_pw VARCHAR(64) NOT NULL, -- sha256
	PRIMARY KEY (manager_id)
)ENGINE = InnoDB AUTO_INCREMENT = 1 ROW_FORMAT = DEFAULT CHARACTER SET utf8;

create table restaurant_table(
	table_id INT NOT NULL,
	PRIMARY KEY(table_id)
)ENGINE = InnoDB;

create table reservations(
        reservation_id INT NOT NULL AUTO_INCREMENT,
        reservation_table INT NOT NULL,
	reservation_user INT NOT NULL,
        reservation_at TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
	arrived_at TIMESTAMP DEFAULT '0000-00-00 00:00:00',
	FOREIGN KEY(reservation_table) REFERENCES restaurant_table(table_id),
	FOREIGN KEY(reservation_user) REFERENCES users(user_id) ON DELETE CASCADE,
        PRIMARY KEY (reservation_id)
)ENGINE = InnoDB AUTO_INCREMENT = 1 ROW_FORMAT = DEFAULT CHARACTER SET utf8;

--users
insert into users value(0, "user1", "1234", 
	"f6f2ea8f45d8a057c9566a33f99474da2e5c6a6604d736121650e2730c6fb0a3"); -- name : user1, id : 1234, pw : qwer
insert into users value(0, "user2", "5678", 
	"f0e4c2f76c58916ec258f246851bea091d14d4247a2fc3e18694461b1816e13b"); -- name : user2, id : 5678, pw : asdf
insert into users value(0, "user3", "91011",
        "7020e57625b6a6695ffd51ed494fbfc56c699eaceca4e77bf7ea590c7ebf3879"); -- name : user3, id : 91011, pw : zxcv

--mamangers
insert into managers value(0, "manager1", "admin1", 
	"25f43b1486ad95a1398e3eeb3d83bc4010015fcc9bedb35b432e00298d5021f7"); -- name : mamanger1, id : admin1, pw : admin1
insert into managers value(0, "manager2", "admin2", 
	"1c142b2d01aa34e9a36bde480645a57fd69e14155dacfab5a3f9257b77fdc8d8"); -- name : mamanger2, id : admin2, pw : admin2

--tables
insert into restaurant_table value(1);
insert into restaurant_table value(2);
insert into restaurant_table value(3);
insert into restaurant_table value(4);
insert into restaurant_table value(5);

--reservations
insert into reservations value(0, 3, 1, "2022-04-13 19:20", "0000-00-00");
insert into reservations value(0, 2, 2, "2022-04-25 12:00", "0000-00-00");
insert into reservations value(0, 2, 2, "2022-04-23 16:30", "0000-00-00");
insert into reservations value(0, 1, 3, "2022-04-13 15:30", "0000-00-00");


