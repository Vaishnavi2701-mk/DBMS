/*

Project Name: Liabrary Management System 
Made by : Group No 19
Subject: DBMS
Tool : MySQL


*/

create database librabry_project;
use librabry_project;

create table books (ISBN int not null, book_title varchar(50) not null, 
                    category varchar(50) not null, rental_price int not null, status varchar(50) not null,
                    author varchar(50) not null, publisher varchar(50) not null,primary key(ISBN));

create table employee (employee_id int not null, employee_name varchar(50) not null, 
                       emp_position varchar(50) not null, salary int not null, primary key(employee_id));
                       

create table customer (customer_id int not null, customer_name varchar(50) not null, 
                       customer_address varchar(50) not null, registration_date date not null, primary key(customer_id));
                       
                       

create table branch (branch_no int not null,manager_id int not null, 
                       customer_address varchar(50) not null, contact_no int not null, primary key(branch_no));
                       


create table issue_status (issue_id int not null,issued_cust int not null, 
                           issued_book_name varchar(50) not null, issue_date date not null,isbn_book int not null,primary key(issue_id),constraint foreign key(isbn_book) references BOOKS(ISBN), constraint foreign key(issued_cust)references customer(customer_id)) ;
				
create table return_status (return_id int not null,return_cust int not null, 
                            return_book_name varchar(50) not null, return_date date not null,isbn_book2 int not null,primary key(return_id),constraint foreign key(isbn_book2) references BOOKS(ISBN), constraint foreign key(return_cust)references issue_status(issued_cust)) ;
                            
                            

insert into books values (1009,'Ikigai','selp-help',5,'available','Hector Garcia','pub1'),
                         (1001,'Atomic Habit','selp-help',4,'availabe','james clear','pub2'),
                         (1002,'Hobbit','Fiction',1,'unavailable','J.R.R Tolkien','pub3'),
                         (1003,'Eat that Frog','selp-help',2,'availabe','Brian Tracy','pub4'),
						 (1004,'Mahatma Gandhi','Autobiography',0,'unavailable','M.K.Gandhi','pub5');
                         
delete from books where ISBN=1000;

desc books;

select *from books;

insert into books values (1009,'Ikigai','selp-help',5,'available','Hector Garcia','pub1');

alter table branch add constraint foreign key(manager_id) references employee(employee_id);

insert into employee values(991,'emp1','manager',30000),
                           (992,'emp2','worker',10000),
                           (993,'emp3','worker',10000),
                           (994,'emp4','leader',20000),
                           (995,'emp5','assistant',20000),
                           (996,'emp6','leader',20000),
                           (997,'emp7','assiatant',20000),
                           (998,'emp8','worker',10000);
                           
insert into branch values(1,991,'branch_addr1',9874563218),
						 (3,994,'branch_addr2',9876833218),
                         (4,889,'branch_addr3',9845323218);
                         
insert into customer values(11,'cus1','hom1','2008:10:10'),
						   (12,'cus2','hom2','2008:03:03'),
                           (13,'cus3','hom3','2009:04:04'),
                           (14,'cus4','hom4','2009:04:04');
                           
insert into issue_status values(51,12,'book1','2010:01:01',1001);
insert into issue_status values(52,14,'book4','2010:01:01',1004);

insert into return_status values(61,12,'book1','2010:10:01',1001);
insert into return_status values(62,13,'book1','2010:10:01',1001);

/* Display the customer name whose id is 12*/

select customer_name from customer where customer_id=12;
/*Display issue id, issued customer name whose ibsn book number is 1004*/

select issue_id,issued_cust from issue_status where isbn_book=1004;

/*Display all content in issue staus table where isbn book of issue table and return table are equal*/

select p. *from issue_status p,return_status r where p.isbn_book=r.isbn_book2;

/*Add a column called book type in customer table*/

alter table customer add book_type varchar(10) not null;

desc customer;
select *from customer;




