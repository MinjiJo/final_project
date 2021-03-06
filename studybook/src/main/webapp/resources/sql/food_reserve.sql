create table food_reserve(
	r_code number(10) not null constraint food_reserve_r_code_fk references reserve(r_code) on delete cascade,
	food_code number(10) not null constraint food_reserve_food_code_fk references food(food_code) on delete cascade,
	mem_key number(10) not null constraint food_reserve_mem_key_fk references member(key) on delete cascade,
	count number(5) not null,
	total_cost number(10) not null
);
ALTER TABLE food_reserve
RENAME COLUMN total_cost TO food_total_cost;

alter table food_reserve drop column mem_key;

alter table food_reserve drop column mem_key;

drop table food_reserve;

select * from food_reserve;