
use `12306-train`;

drop table if exists `turns`;

create table `turns` (
    `id` integer primary key,
    `mark_time` timestamp not null
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table if exists `agencys`;

create table `agencys` (
    `province` varchar(10) not null,
    `city` varchar(15) not null,
    `county` varchar(30) not null,
    `address` varchar(50) not null,
    `name` varchar(50) not null,
    `windows` int,
    `start` time,
    `end` time,
    `turn` integer not null,
    primary key (`address`, `turn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table if exists `stations`;

create table `stations` (
    `bureau` varchar(10) not null,
    `station` boolean not null,
    `name` varchar(15) not null,
    `address` varchar(50) not null,
    `passenger` boolean not null,
    `luggage` boolean not null,
    `package` boolean not null,
    `turn` integer not null,
    primary key (`bureau`, `station`, `name`, `turn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table if exists `train_briefs`;

create table `train_briefs` (
    `code` varchar(10),
    `train_no` varchar(20) not null,
    `start` varchar(10) not null,
    `end` varchar(10) not null,
    `seat_type` varchar(20) default null,
    `turn` integer not null,
    primary key (`code`, `turn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table if exists `train_infos`;

create table `train_infos` (
    `train_no` varchar(20) not null,
    `no` tinyint not null,
    `station` varchar(15) not null,
    `start_time` time,
    `arrive_time` time,
    `stopover_time` time,
    `turn` integer not null,
    primary key (`train_no`, `no`, `turn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table if exists `train_stations`;

create table `train_stations` (
    `name` varchar(20),
    `code` varchar(6) not null,
    `turn` integer not null,
    primary key (`name`, `turn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table if exists `train_tickets`;

create table `train_tickets` (
    `train_no` varchar(20) not null,
    `start` varchar(15) not null,
    `end` varchar(15) not null,
    `swz` smallint,
    `tz` smallint,
    `zy` smallint,
    `ze` smallint,
    `gr` smallint,
    `rw` smallint,
    `yw` smallint,
    `rz` smallint,
    `yz` smallint,
    `wz` smallint,
    `qt` smallint,
    `turn` integer not null,
    primary key (`train_no`, `start`, `end`, `turn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
