use mydb;

insert into School(id) values(1);
insert into School(id) values(2);
insert into School(id) values(3);
insert into School(id) values(4);
insert into School(id) values(5);
insert into School(id) values(6);
insert into School(id) values(7);
insert into School(id) values(8);
insert into School(id) values(9);
insert into School(id) values(10);
insert into School(id) values(11);
insert into School(id) values('12chongfu');
insert into School(id) values(10011);

insert into User(id,name,identity,password,School) values(1,'WJH',1,'asdfasdf',1);
insert into User(id,name,identity,password,School) values(2,'LWB',3,'asdfasdf',1);

insert into User(name,identity,password,School) values('FKY',1,'asdf',2);
insert into User(name,identity,password,School) values('aaa',2,'aaaa',4);
insert into User(name,identity,password,School) values('bbb',3,'aabb',3);
insert into User(name,identity,password,School) values('ccc',3,'cccc',3);
insert into User(name,identity,password,School) values('ddd',3,'dddd',3);
insert into User(name,identity,password,School) values('ddd',3,'dddd',3);
insert into User(name,identity,password,School) values('ddd',3,'dddd',3);
insert into User(name,identity,password,School) values('ddd',3,'dddd',3);
insert into User(name,identity,password,School) values('ddd',3,'dddd',3);
insert into User(name,identity,password,School) values('eee',3,'iOF',3);
insert into User(name,identity,password,School) values('eee',3,'kXp',3);

insert into Project(id,property,leader,passBy) values(1,2,3,4);
insert into Project(id,property,leader,passBy) values(2,3,3,5);

insert into Project(property,leader,passBy) values(2,4,4);
insert into Project(property,leader,passBy) values(1,3,5);

insert into Asset(assetID,owner,value,category,amount) values(1,3,45,2,3);
insert into Asset(assetID,owner,value,category,amount) values(2,3,45,5,3);
insert into Asset(assetID,owner,value,category,amount) values(3,1,34,5,5);
insert into Asset(assetID,owner,value,category,amount) values(4,1,111,2,10);
insert into Asset(assetID,owner,value,category,amount) values(5,2,120,3,1);
insert into Asset(assetID,owner,value,category,amount) values(6,4,130,2,1);
insert into Asset(assetID,owner,value,category,amount) values(7,5,110,1,1);
insert into Asset(assetID,owner,value,category,amount) values(8,5,1500,1,1);
insert into Asset(assetID,owner,value,category,amount) values(9,3,23,2,5);
insert into Asset(assetID,owner,value,category,amount) values(10,3,344,3,1);

insert into ProjectHistory(ProjectId,ifPass,verifyBy) values(3,0,3);
insert into ProjectHistory(ProjectId,ifPass,verifyBy) values(3,0,1);
insert into ProjectHistory(ProjectId,ifPass,verifyBy) values(2,1,1);
