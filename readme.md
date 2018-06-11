## 支持语法
- [x] 生成`use [database]`
- [x] 重复`*[n times]`
- [x] 随机生成`{str,5}`
- [x] 注释 `#`
- [x] 小数  

## 使用方法

```bash
python generate.py 数据文件
```

## 数据文件格式

```
database mydb

table School id
1

table User id name identity password School
1 WJH 1 asdfasdf 1
2 LWB 3 asdfasdf 1

table User name identity password School
FKY 1 asdf 2

```
- 块儿以空白行为界限

- 每个块儿第一行的第一个词可以为databases或者table
    - database 后面跟数据库名，生成 `use *`
    - table 后面跟表名，再之后跟列名

- 如果是table 开头的块儿，后面每行紧跟着对应列名的数据项，其中字符串可以加单引号也可以不加

## 生成语句

```sql
use mydb;

insert into School(id) values(1);

insert into User(id,name,identity,password,School) values(1,'WJH',1,'asdfasdf',1);
insert into User(id,name,identity,password,School) values(2,'LWB',3,'asdfasdf',1);

insert into User(name,identity,password,School) values('FKY',1,'asdf',2);
```
