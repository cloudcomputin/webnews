create database web character set UTF8 collate utf8_bin;
use web;
create table categoryuser(
	id int not null auto_increment primary key,
    name varchar(50) not null
)character set UTF8 collate utf8_bin;
create table user(
	id int not null auto_increment primary key,
    fullname varchar(100) not null,
    gmail varchar(100) not null,
    pwd varchar(15) not null,
    idcategoryuser int,
    foreign key(idcategoryuser) references categoryuser(id)
)character set UTF8 collate utf8_bin;
create table categorynews(
	id int not null auto_increment primary key,
    name varchar(100) not null
)character set UTF8 collate utf8_bin;
create table news(
	id int not null auto_increment primary key,
    name varchar(200) not null,
    image varchar(200),
    postday date not null,
    categorynews int,
    author int,
    foreign key(author) references user(id) on delete set null on update cascade,
    foreign key(categorynews) references categorynews(id) on delete set null on update cascade
)character set UTF8 collate utf8_bin;
create table newsdetails(
	id int not null auto_increment primary key,
    content text not null,
    image varchar(200),
    idnews int,
    foreign key(idnews) references news(id) on delete cascade on update cascade
)character set UTF8 collate utf8_bin;
create table comments(
	id int not null auto_increment primary key,
    content text,
    idnewsdetails int,
    iduser int,
    foreign key(idnewsdetails) references newsdetails(id),
    foreign key(iduser) references user(id)
)character set UTF8 collate utf8_bin;
create table feedback(
	id int not null auto_increment primary key,
    content text,
    idcomment int,
    iduser int,
    foreign key(idcomment) references comments(id),
    foreign key(iduser) references user(id)
)character set UTF8 collate utf8_bin;
create table notification(
	id int not null auto_increment primary key,
    iduser int,
    seen bit default 0,
    foreign key(iduser) references user(id)
)character set UTF8 collate utf8_bin;
delimiter $$
create procedure findAllNews()
begin
	select * from categoryuser;
end $$
delimiter ;
call findAllUser();
drop procedure findAllUser;