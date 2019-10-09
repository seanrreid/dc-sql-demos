create table drinks (
	id serial primary key,
	recipe text
);

create table customers (
	id serial primary key,
	name text not null,
	email text,
	twitter text
);

--drop table orders;
create table orders (
	id serial primary key,
	size text,
	date timestamp,
	drink_id integer references drinks(id),
	customer_id integer references customers(id)
);