drop table if exists pjs_instance_op;
drop table if exists pjs_instance;

create table pjs_instance
(
	inst_id		int(11) unsigned not null auto_increment,
    inst_type	varchar(20) not null,
	inst_data	text,
    primary key (inst_id)
);

create table pjs_instance_op
(
	inop_id				int(11) unsigned not null auto_increment,
    inop_fk_instance	int(11) unsigned not null,
    inop_type			varchar(20),
    inop_data			text,
    primary key (inop_id),
    foreign key fk_inop_inid (inop_fk_instance) references pjs_instance (inst_id)
);

select * from pjs_instance; 
select * from pjs_instance_op;

select * from tmp_instance;
insert into pjs_instance select * from tmp_instance where inst_id in (3, 4, 6);
insert into pjs_instance_op select * from tmp_instance_op where inop_fk_instance in (3, 4, 6);

delete from pjs_instance where inst_id > 26;

drop table if exists tmp_instance;
create table tmp_instance as select * from pjs_instance;
drop table if exists tmp_instance_op;
create table tmp_instance_op as select * from pjs_instance_op;

insert into pjs_instance_op select 0, 4, inop_type, inop_data from pjs_instance_op;

delete from pjs_instance_op where inop_id > 5;




