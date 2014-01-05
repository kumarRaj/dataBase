select * from bookInventory;
insert into bookInventory 
	(isbn,price,author,Title,Publisher,numberOfPages) 
	values ('12347',560,'Raja','World Bank','OUP',25);
select isbn,price,author,Title,Publisher,numberOfPages 
	from bookInventory
	where isbn = '1';