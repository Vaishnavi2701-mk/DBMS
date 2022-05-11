CREATE DATABASE lms_db;
USE lms_db;

Create table LMS_MEMBERS
(
MEMBER_ID Varchar(10),
MEMBER_NAME Varchar(30) NOT NULL,
CITY Varchar(20),
DATE_REGISTER Date NOT NULL,
DATE_EXPIRE Date ,
MEMBERSHIP_STATUS Varchar(15)NOT NULL,
Constraint LMS_cts1 PRIMARY KEY(MEMBER_ID)
);


Create table LMS_SUPPLIERS_DETAILS
(
SUPPLIER_ID Varchar(3),
SUPPLIER_NAME Varchar(30) NOT NULL,
ADDRESS Varchar(50),
CONTACT bigint NOT NULL,
EMAIL Varchar(15) NOT NULL,
Constraint LMS_cts2 PRIMARY KEY(SUPPLIER_ID)
);

drop table LMS_SUPPLIERS_DETAILS;

Create table LMS_FINE_DETAILS
(
FINE_RANGE Varchar(3),
FINE_AMOUNT decimal(10,2) NOT NULL,
Constraint LMS_cts3 PRIMARY KEY(FINE_RANGE)
);


Create table LMS_BOOK_DETAILS
(
BOOK_CODE Varchar(10), 
BOOK_TITLE Varchar(50) NOT NULL,
CATEGORY Varchar(15) NOT NULL,
AUTHOR Varchar(30) NOT NULL,
PUBLICATION Varchar(30),
PUBLISH_DATE Date,
BOOK_EDITION int,
PRICE decimal(8,2) NOT NULL, 
RACK_NUM Varchar(3),
DATE_ARRIVAL Date NOT NULL,  
SUPPLIER_ID Varchar(3) NOT NULL,
Constraint LMS_cts4 PRIMARY KEY(BOOK_CODE), 
Constraint LMS_cts41 FOREIGN KEY(SUPPLIER_ID) References LMS_SUPPLIERS_DETAILS(SUPPLIER_ID)
);
drop table LMS_BOOK_DETAILS;

Create table LMS_BOOK_ISSUE
(
BOOK_ISSUE_NO int,
MEMBER_ID Varchar(10) NOT NULL,
BOOK_CODE Varchar(10) NOT NULL,
DATE_ISSUE Date NOT NULL,
DATE_RETURN Date NOT NULL,
DATE_RETURNED Date NULL,
FINE_RANGE Varchar(3),
Constraint LMS_cts5 PRIMARY KEY(BOOK_ISSUE_NO),
Constraint LMS_Mem FOREIGN KEY(MEMBER_ID) References LMS_MEMBERS(MEMBER_ID),
Constraint LMS_BookDetail FOREIGN KEY(BOOK_CODE) References LMS_BOOK_DETAILS(BOOK_CODE),
Constraint LMS_FineDetail FOREIGN KEY(FINE_RANGE) References LMS_FINE_DETAILS(FINE_RANGE)
);


Insert into LMS_MEMBERS
Values('LM001', 'AMIT', 'CHENNAI', '2012-02-12', '2013-02-11','Temporary');
Insert into LMS_MEMBERS
Values('LM002', 'ABDHUL', 'DELHI', '2012-04-10', '2013-04-09','Temporary');
Insert into LMS_MEMBERS
Values('LM003', 'GAYAN', 'CHENNAI', '2012-05-13','2013-05-12', 'Permanent');
Insert into LMS_MEMBERS
Values('LM004', 'RADHA', 'CHENNAI', '2012-04-22', '2013-04-21', 'Temporary');
Insert into LMS_MEMBERS
Values('LM005', 'GURU', 'BANGALORE', '2012-03-30', '2013-05-16','Temporary');
Insert into LMS_MEMBERS
Values('LM006', 'MOHAN', 'CHENNAI', '2012-04-12', '2013-05-16','Temporary');
select * from lms_members;

Insert into LMS_SUPPLIERS_DETAILS 
Values ('S01','SINGAPORE SHOPPEE', 'CHENNAI', 9894123555,'sing@gmail.com');
Insert into LMS_SUPPLIERS_DETAILS 
Values ('S02','JK Stores', 'MUMBAI', 9940123450 ,'jks@yahoo.com');
Insert into LMS_SUPPLIERS_DETAILS 
Values ('S03','ROSE BOOK STORE', 'TRIVANDRUM', 9444411222,'rose@gmail.com');
Insert into LMS_SUPPLIERS_DETAILS 
Values ('S04','KAVARI STORE', 'DELHI', 8630001452,'kavi@redif.com');
Insert into LMS_SUPPLIERS_DETAILS 
Values ('S05','EINSTEN BOOK GALLARY', 'US', 9542000001,'eingal@aol.com');
Insert into LMS_SUPPLIERS_DETAILS 
Values ('S06','AKBAR STORE', 'MUMBAI',7855623100 ,'akbakst@aol.com');
select * from LMS_SUPPLIERS_DETAILS;

Insert into LMS_FINE_DETAILS Values('R0', 0);
Insert into LMS_FINE_DETAILS Values('R1', 20);
insert into LMS_FINE_DETAILS Values('R2', 50);
Insert into LMS_FINE_DETAILS Values('R3', 75);
Insert into LMS_FINE_DETAILS Values('R4', 100);
Insert into LMS_FINE_DETAILS Values('R5', 150);
Insert into LMS_FINE_DETAILS Values('R6', 200);
select * from LMS_FINE_DETAILS;

Insert into LMS_BOOK_DETAILS
Values('BL000010', 'Java ForvDummies', 'JAVA', 'Paul J. Deitel', 'Prentice Hall', '1999-12-10', 6, 575.00, 'A1', '2011-05-10', 'S01');
Insert into LMS_BOOK_DETAILS
Values('BL000002', 'Java: The Complete Reference ', 'JAVA', 'Herbert Schildt', 'Tata Mcgraw Hill ', '2011-10-10', 5, 750.00, 'A1', '2011-05-10', 'S03');
Insert into LMS_BOOK_DETAILS 
Values('BL000003', 'Java How To Do Program', 'JAVA', 'Paul J. Deitel', 'Prentice Hall', '1999-05-10', 6, 600.00, 'A1', '2012-05-10', 'S01');
Insert into LMS_BOOK_DETAILS
Values('BL000004', 'Java: The Complete Reference ', 'JAVA', 'Herbert Schildt', 'Tata Mcgraw Hill ', '2011-10-10', 5, 750.00, 'A1', '2012-05-11', 'S01');
Insert into LMS_BOOK_DETAILS 
Values('BL000005', 'Java How To Do Program', 'JAVA', 'Paul J. Deitel', 'Prentice Hall', '1999-12-10', 6, 600.00, 'A1', '2012-05-11', 'S01');
Insert into LMS_BOOK_DETAILS
Values('BL000006', 'Java: The Complete Reference ', 'JAVA', 'Herbert Schildt', 'Tata Mcgraw Hill ', '2011-10-10', 5, 750.00, 'A1', '2012-05-12', 'S03');
Insert into LMS_BOOK_DETAILS 
Values('BL000007', 'Let Us C', 'C', 'Yashavant Kanetkar ', 'BPB Publications', '2010-12-11', 9, 500.00 , 'A3', '2010-11-03', 'S03');
Insert into LMS_BOOK_DETAILS 
Values('BL000008', 'Let Us C', 'C', 'Yashavant Kanetkar ','BPB Publications', '2010-05-12', 9, 500.00 , 'A3', '2011-08-09', 'S04');
Insert into LMS_BOOK_DETAILS 
Values('BL000009', 'Let Us C#', 'C', 'Yashavant Kanetkar ','BPB Publications', '2010-05-12', 9, 550.00 , 'A3', '2011-08-09', 'S04');
Insert into LMS_BOOK_DETAILS 
Values('BL000011', 'Let Us C++', 'C', 'Yashavant Kanetkar ','BPB Publications', '2010-05-12', 9, 650.00 , 'A3', '2011-08-09', 'S04');
select * from LMS_BOOK_DETAILS;

Insert into LMS_BOOK_ISSUE 
Values (001, 'LM001', 'BL000010', '2012-05-01', '2012-05-16', '2012-05-16', 'R0');
Insert into LMS_BOOK_ISSUE 
Values (002, 'LM002', 'BL000002', '2012-05-01', '2012-05-06','2012-05-16', 'R2');
Insert into LMS_BOOK_ISSUE
Values (003, 'LM003', 'BL000007', '2012-04-01', '2012-04-16', '2012-04-20','R1');
Insert into LMS_BOOK_ISSUE 
Values (004, 'LM004', 'BL000005', '2012-04-01', '2012-04-16','2012-04-20', 'R1');
Insert into LMS_BOOK_ISSUE 
Values (005, 'LM005', 'BL000008', '2012-03-30', '2012-04-15','2012-04-20' , 'R1');
Insert into LMS_BOOK_ISSUE 
Values (006, 'LM005', 'BL000008', '2012-04-20', '2012-05-05','2012-05-05' , 'R0');
Insert into LMS_BOOK_ISSUE 
Values (007, 'LM003', 'BL000007', '2012-04-22', '2012-05-07','2012-05-25' , 'R4');
select * from LMS_BOOK_ISSUE ;



/*Write a query to display the member id, member name, city 
and membership status who are all having life time membership. 
*/
select member_id,member_name,city,membership_status
from lms_members
where membership_status='permanent';
select*from lms_book_issue;

/*Write a query to display the member id, member name who have not returned the books.*/
select bd.book_code,bd.publication,bd.price,sd.SUPPLIER_NAME,
count(bi.book_code)
From lms_book_details bd
join lms_suppliers_details sd 
join lms_book_issue bi
on sd.SUPPLIER_ID= bd.SUPPLIER_ID 
and bd.BOOK_CODE=bi.BOOK_CODE
group by bd.BOOK_CODE
Having count(bi.book_code)=(select count(Book_code)
from lms_book_issue
group by book_code
order by count(Book_code)desc
limit 1);

/*
Write a query to display the member id, member name who 
have taken the book with book code 'BL000002'.*/
select member_id,member_name 
from lms_members 
where member_id in
(select member_id 
from lms_book_issue
where book_code like'%02');

/*Write a query to display the book code, book title and 
author of the books whose author name begins with 'P'.*/
select book_code,author,book_title
from lms_book_details
where author like 'p%';

/*Write a query to display the total number of Java books
 available in library with alias name ‘NO_OF_BOOKS’.*/
select count(category) no_of_books
from lms_book_details 
where category ='java'; 

/*Write a query to list the category 
and number of books in each category with alias name ‘NO_OF_BOOKS’.*/
select category,count(category) no_of_book
from lms_book_details
where category ='java' or category='C'
group by category; 

/*Write a query to display the number of books published 
by "Prentice Hall” with the alias name “NO_OF_BOOKS”.*/
select count(author) no_of_books
from lms_book_details
where publication like 'p%'; 

/*Write a query to display the book code, 
book title of the books which are issued on the date "1st April 2012".*/
select book_title,book_code
from lms_book_details
where book_code in
(select book_code 
from lms_book_issue
where date_issue ='2012-04-01');

/*Write a query to display the member id, member name, 
date of registration and expiry date of the members whose membership expiry date is before APR 2013.*/
select member_id,member_name,date_register,date_expire
from lms_members
where date_expire<'2013-04-01';

/*write a query to display the member id, member name, date of registration, 
membership status of the members who registered before "March 2012" and membership status is "Temporary"*/
select member_name,member_id,date_register,membership_status
from lms_members
where membership_status='temporary' and date_register<'2012-03-02';

/*Write a query to display the member id, member name who’s City is CHENNAI or DELHI. */
select member_id,member_name name,city
from lms_members
where city='delhi' or city='chennai';

/*Write a query to concatenate book title, author and display in the following format.
Book_Title_is_written_by_Author
Example: Let Us C_is_written_by_Yashavant Kanetkar*/
select concat(book_title,'_Is_Written_by_',author)
from lms_book_details;

/*Write a query to display the average price of books which is 
belonging to ‘JAVA’ category with alias name “AVERAGEPRICE”.*/
select avg(price) as averageprice from lms_book_details
where category='java';

/*Write a query to display the supplier id, supplier name and email of 
the suppliers who are all having gmail account.*/
select supplier_id,supplier_name,email
from lms_suppliers_details
where email like '%gmail%';

/*
Write a query to display the supplier id, supplier name and contact details. 
Contact details can be either phone number or email or address with alias name “CONTACTDETAILS”. 
If phone number is null then display email, even if email also null then display the address of the supplier.*/
SELECT supplier_Name,supplier_id, 
COALESCE(contact,email,address) contactaddress
FROM lms_suppliers_details;
select supplier_name,supplier_id,contact,
if (contact is null,'no','yes') 
from lms_suppliers_details;

/*Write a query to display the supplier id, supplier name and contact. 
If phone number is null then display ‘No’ else display ‘Yes’ with alias name “PHONENUMAVAILABLE”. 
*/
SELECT m.MEMBER_ID, m.MEMBER_NAME, m.CITY,m.membership_status,
SUM(f.FINE_AMOUNT) AS Fine
FROM LMS_MEMBERS m JOIN
LMS_BOOK_ISSUE i ON m.MEMBER_ID = i.MEMBER_ID 
JOIN
LMS_FINE_DETAILS f ON i.FINE_RANGE = f.FINE_RANGE
GROUP BY m.MEMBER_ID, m.MEMBER_NAME, m.CITY,m.membership_status;

/*
Write a query to display the member id, member name of the members, 
book code and book title of the books taken by them.*/
select member_id,member_name,book_title,book_code
from lms_members
join 
lms_fine_details;
/*
Write a query to display the total number of books available in the library
 with alias name “NO_OF_BOOKS_AVAILABLE” (Which is not issued). */

select count(book_code)no_books_available
from lms_book_details 
where book_code not in (select book_code from lms_book_issue);

/*Write a query to display the member id, member name, fine range and fine amount 
of the members whose fine amount is less than 100.*/
select m.member_id,m.member_name,f.fine_range,sum(f.fine_amount)
from lms_members m
join
lms_fine_details f
join
lms_book_issue bi
on m.member_id=bi.member_id and
f.fine_range=bi.fine_range
group by m.member_id
having sum(f.fine_amount)>100; 

/*Write a query to display the book code, book title and availability status of the
 ‘JAVA’ books whose edition is "6”. Show the availability status with alias name “AVAILABILITYSTATUS”. */
 
 select book_code,book_title,
publication,price,book_edition,publish_date
from lms_book_details
order by book_edition,publication,publish_date ;



/*Write a query to display the book code, book title and rack number of the books 
which are placed in rack 'A1' and sort by book title in ascending order.*/
select book_code,book_title,rack_num
from lms_book_details
where rack_num='A1'
ORDER BY BOOK_title;


/*Write a query to display the member id, member name, due date and date returned of the members who has 
returned the books after the due date. Hint: Date_return is due date and Date_returned is actual book
 return date.*/
select m.member_id,m.member_name,bi.date_return,bi.date_returned
from lms_members m
join
lms_book_issue bi
on m.member_id=bi.member_id
where date_return != date_returned;

/*Write a query to display the member id, member name and date of registration who have not taken any book.*/
select m.member_id,m.member_name,m.date_register
from lms_members m
where member_id not in(select member_id from lms_book_issue);

/*Write a Query to display the member id and member name of the members who
 has not paid any fine in the year 2012.*/
select member_id,member_name 
from
lms_members 
where 
member_id not in(select bi.member_id 
from lms_book_issue bi
join lms_fine_details f
on f.fine_range=bi.fine_range
where year(date_returned)=2012
group by bi.member_id
having sum(f.fine_amount)>0);

/*Write a query to display the date on which the maximum numbers of books were issued and the number of books issued with alias name “NOOFBOOKS”.
select member_id,member_name,date_register,date_expire
from lms_members
where date_expire<'2013-04-00';*/

select count(date_issue)no_of_books,date_issue from lms_book_issue
group by book_code
having count(date_issue)=
(select count(date_issue)
from lms_book_issue
group by date_issue
order by count(date_issue)desc
limit 1);


/*Write a query to list the book title and supplier id for the books authored by “Herbert Schildt" and the book edition is 5 and supplied by supplier ‘S01’.
select member_name,member_id,date_register,membership_status
from lms_members
where membership_status='temporary' and date_register<'2012-03-00';*/

select book_title,supplier_id
from lms_book_details
where author like 'h%'
and supplier_id='S01'
and book_edition=5;

/*Write a query to display the rack number and the number of books in each rack with alias name “NOOFBOOKS” and sort by rack number in ascending order.
select member_id,member_name name,city
from lms_members
where city='delhi' or city='chennai';*/

select count(rack_num)no_of_books,rack_num
from lms_book_details
group by rack_num
order by count(rack_num);


/*Write a query to display book issue number, member name, date or registration, date of expiry, book title, category author, price, date of issue, date of return, actual returned date, issue status, fine amount.
select concat(book_title,'_Is_Written_by_',author)
from lms_book_details;*/

select member_name,book_title,category,author,price,
date_issue,date_return,date_returned,book_issue_no
fine_amount
from lms_book_details
join lms_members
join lms_suppliers_details
join lms_book_issue
join lms_fine_details;

/*Write a query to display the book code, title, publish date of the books which is been published in the month of December.
select avg(price) as averageprice from lms_book_details
where category='java'*/

select book_code,book_title,publish_date
from lms_book_details
where month(publish_date)=12;
/*
Write a query to display the book code, book title and availability status of the ‘JAVA’ 
books whose edition is "5”. Show the availability status with alias name “AVAILABILITYSTATUS”. 
*/
select book_code,book_title,bd.supplier_id,max(price)
,supplier_name
from lms_book_details bd 
join lms_suppliers_details sd
on sd.supplier_id=bd.supplier_id
group by supplier_id;