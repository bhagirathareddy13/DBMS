create database BookMyShowDB

create table Customer
(
CID int primary key,
Cname varchar(30) not null,
Mobile bigint not null unique,
Email varchar(50) not null unique,
City varchar(20) not null
)

insert into Customer values
(101, 'Princy', 9876543210, 'princy1211@gmail.com', 'Hyderabad'),
(102, 'Jagadesh', 9876543211, 'jagadeshreddy0099@gmail.com', 'Chennai'),
(103, 'Goutham', 9876543212, 'goutham843@gmail.com', 'Bangalore'),
(104, 'Sneha', 9876543213, 'sneha345@gmail.com', 'Mumbai'),
(105, 'Sumanth', 9876543214, 'sumanth463@gmail.com', 'Delhi'),
(106, 'Sanjay', 9876543215, 'sanjayguptha45@gmail.com', 'Pune'),
(107, 'Rohit', 9876543216, 'rohit355433@gmail.com', 'Kolkata'),
(108, 'Divya', 9876543217, 'divya987@gmail.com', 'Hyderabad'),
(109, 'Vijay', 9876543218, 'vijay0011@gmail.com', 'Chennai'),
(110, 'Pinky', 9876543219, 'pinky1223@gmail.com', 'Bangalore'),
(111, 'Bhagi', 9876543220, 'bhagi1303@gmail.com', 'Mumbai'),
(112, 'Venky', 9876543221, 'venky7788@gmail.com', 'Delhi'),
(113, 'Ajay', 9876543222, 'ajay0034@gmail.com', 'Pune'),
(114, 'Neha', 9876543223, 'neha6574@gmail.com', 'Kolkata'),
(115, 'Naveen', 9876543224, 'naveen@gmail.com', 'Hyderabad')

create table Movies
(
MID int primary key,
Mname varchar(30) not null,
Language varchar(30) not null,
Gender varchar(30) not null,
Duration int not null
)

insert into Movies values
(201, 'Avengers', 'English', 'Action', 182),
(202, 'RRR', 'Telugu', 'Action', 187),
(203, 'Kalki 2898 AD', 'Telugu', 'Sci-Fi', 181),
(204, 'Krish', 'Hindi', 'Sci-fi', 175),
(205, 'Leo', 'Tamil', 'Action', 164),
(206, 'Animal', 'Hindi', 'Drama', 201),
(207, 'Fast X', 'English', 'Crime', 141),
(208, 'Kaithi', 'Tamil', 'Thriller', 146),
(209, 'Dangal', 'Hindi', 'Sports', 161),
(210, 'Bahubali 2', 'Telugu', 'Drama', 167)

create table Theater
(
TID int primary key,
Tname varchar(50) not null,
Location varchar(100) not null,
City varchar(50) not null,
Screens int not null
)

insert into Theater values
(301, 'PVR Cinemas', 'Banjara Hills', 'Hyderabad', 6),
(302, 'PGR Cinemas', 'Tata Nagar', 'Tirupati', 3),
(303, 'PVR Icon', 'Velachery', 'Chennai', 7),
(304, 'Cinepolis', 'Andheri', 'Mumbai', 5),
(305, 'Miraj Cinemas', 'Connaught Place', 'Delhi', 4)

create table Shows
(
SID int primary key,
MID int not null,
TID int not null,
SDate date not null,
ShowTime time not null
foreign key (MID) references Movies (MID),
foreign key (TID) references Theater (TID)
)

insert into Shows values
(401, 201, 301, datefromparts(2012,05,04), timefromparts(10,0,0,0,0)),
(402, 202, 302, datefromparts(2022,03,25), timefromparts(13,0,0,0,0)),
(403, 203, 301, datefromparts(2024,06,27), timefromparts(16,0,0,0,0)),
(404, 204, 303, datefromparts(2006,06,23), timefromparts(10,3,0,0,0)),
(405, 205, 304, datefromparts(2023,10,19), timefromparts(14,0,0,0,0)),
(406, 206, 305, datefromparts(2023,12,01), timefromparts(18,0,0,0,0)),
(407, 207, 301, datefromparts(2023,12,19), timefromparts(19,0,0,0,0)),
(408, 208, 303, datefromparts(2019,10,25), timefromparts(20,0,0,0,0)),
(409, 209, 304, datefromparts(2016,12,23), timefromparts(17,3,0,0,0)),
(410, 210, 305, datefromparts(2017,04,28), timefromparts(21,0,0,0,0))

create table Booking
(
BID int primary key,
CID int not null,
SID int not null,
Seats int not null,
BookingDate date not null,
foreign key (CID) references Customer(CID),
foreign key (SID) references Shows(SID)
)

insert into Booking values
(501, 101, 401, 2, '2026-08-19'),
(502, 102, 402, 3, '2026-08-19'),
(503, 103, 403, 2, '2026-08-19'),
(504, 104, 404, 4, '2026-08-19'),
(505, 105, 405, 2, '2026-08-19'),
(506, 106, 406, 3, '2026-08-19'),
(507, 107, 407, 2, '2026-08-20'),
(508, 108, 408, 5, '2026-08-20'),
(509, 109, 409, 2, '2026-08-20'),
(510, 110, 410, 3, '2026-08-20')

create table Payment
(
PID int primary key,
BID int not null,
Amount decimal(10,2) not null,
Ptype varchar(30) not null,
Pstatus varchar(30) not null,
foreign key (BID) references Booking(BID)
)

insert into Payment values
(601, 501, 500.00, 'UPI', 'Success'),
(602, 502, 750.00, 'Card', 'Success'),
(603, 503, 1500.00, 'UPI', 'Success'),
(604, 504, 950.00, 'Net Banking', 'Success'),
(605, 505, 500.00, 'Card', 'Success'),
(606, 506, 1100.00, 'UPI', 'Success'),
(607, 507, 500.00, 'Cash', 'Success'),
(608, 508, 1250.00, 'Card', 'Success'),
(609, 509, 500.00, 'UPI', 'Pending'),
(610, 510, 750.00, 'Cash', 'Success')

select * from Customer
select * from Movies
select * from Theater
select * from Shows
select * from Booking
select * from Payment

-- 1.
select Cname from Customer
where City = 'Bangalore'
Goutham
Pinky

-- 2.
select Cname, Mobile from Customer
where City = 'Hyderabad'
Princy	9876543210
Divya	9876543217
Naveen	9876543224

-- 3.
select * from Movies
where Language = 'Telugu'
201	Avengers	Telugu	Action	182
202	RRR	Telugu	Action	187
203	Kalki 2898 AD	Telugu	Action	181
210	Bahubali 2	Telugu	Action	187

-- 4.
select Mname, Gender from Movies
where Gender = 'Action'
Avengers	Action
RRR	Action
Kalki 2898 AD	Action
Leo	Action
Bahubali 2	Actiona

-- 5.
select Mname from Movies
where Duration > 150
Avengers
RRR
Kalki 2898 AD
Krish
Leo
Animal
Dangal
Bahubali 2

-- 6.
select * from Theater
where City = 'Tirupati'
302	PGR Cinemas	Tata Nagar	Tirupati	3

-- 7.
select Tname, Location from Theater
where Screens > 3
PVR Cinemas	Banjara Hills
PVR Icon	Velachery
Cinepolis	Andheri
Miraj Cinemas	Connaught Place

-- 8. 
select * from Shows
where SDate = '2024-06-27'
403	203	301	2024-06-27	16:00:00.0000000

-- 9.
select SID, MID, ShowTime from Shows
where ShowTime > '18:00:00'
407	207	19:00:00.0000000
408	208	20:00:00.0000000
410	210	21:00:00.0000000

-- 10.
select * from Booking
where Seats > 3
504	104	404	4	2026-08-19
508	108	408	5	2026-08-20

-- 11.
select BID, CID, Seats from Booking
where BookingDate > '2026-08-19'
507	107	2
508	108	5
509	109	2
510	110	3

-- 12.
select * from Payment
where Amount > 500
602	502	750.00	Card	Success
603	503	1500.00	UPI	Success
604	504	950.00	Net Banking	Success
606	506	1100.00	UPI	Success
608	508	1250.00	Card	Success
610	510	750.00	Cash	Success

-- 13.
select PID, BID, Ptype from Payment
where Ptype = 'UPI'
601	501	UPI
603	503	UPI
606	506	UPI
609	509	UPI

-- 14.
select * from Payment
where Pstatus = 'Success'
601	501	500.00	UPI	Success
602	502	750.00	Card	Success
603	503	1500.00	UPI	Success
604	504	950.00	Net Banking	Success
605	505	500.00	Card	Success
606	506	1100.00	UPI	Success
607	507	500.00	Cash	Success
608	508	1250.00	Card	Success
610	510	750.00	Cash	Success

-- 15.
select Cname, Email
from Customer
where City = 'Tirupati' or City = 'Chennai'
Jagadesh	jagadeshreddy0099@gmail.com
Vijay	vijay0011@gmail.com

-- 16.
select Mname
from Movies
where Language = 'Telugu' and Gender = 'Action'
RRR

-- 17.
select Mname from Movies
where Duration > 120
and Duration < 180
Krish
Leo
Fast X
Kaithi
Dangal
Bahubali 2 2

-- 18.
select * from Customer
where City = 'Chennai' and Email is not null
102	Jagadesh	9876543211	jagadeshreddy0099@gmail.com	Chennai
109	Vijay	9876543218	vijay0011@gmail.com	Chennai

-- 19.
select * from Theater
where City = 'Tirupati'
or City = 'Hyderabad'
301	PVR Cinemas	Banjara Hills	Hyderabad	6
302	PGR Cinemas	Tata Nagar	Tirupati	3

-- 20. 
select Tname from Theater
where Screens > 2
and City = 'Tirupati'
PGR Cinemas

-- 21.
select * from Booking
where Seats >= 2
and Seats <= 5
501	101	401	2	2026-08-19
502	102	402	3	2026-08-19
503	103	403	2	2026-08-19
504	104	404	4	2026-08-19
505	105	405	2	2026-08-19
506	106	406	3	2026-08-19
507	107	407	2	2026-08-20
508	108	408	5	2026-08-20
509	109	409	2	2026-08-20
510	110	410	3	2026-08-20

-- 22. 
select BID, CID from Booking
where BookingDate = '2026-08-20'
or Seats > 4
507	107
508	108
509	109
510	110

-- 23.
select * from Payment
where Amount > 500
and Pstatus = 'Success'
602	502	750.00	Card	Success
603	503	1500.00	UPI	Success
604	504	950.00	Net Banking	Success
606	506	1100.00	UPI	Success
608	508	1250.00	Card	Success
610	510	750.00	Cash	Success

-- 24.

select PID, Amount, Ptype from Payment
where Ptype = 'UPI'
or Ptype = 'Card'
601	500.00	UPI
602	750.00	Card
603	1500.00	UPI
605	500.00	Card
606	1100.00	UPI
608	1250.00	Card
609	500.00	UPI

-- 25.
select Cname from Customer
where (City = 'Tirupati'
or City = 'Hyderabad')
and Mobile is not null
Princy
Divya
Naveen

-- 26. 
select CID, Cname from Customer
where City = 'Hyderabad'
101	Princy
108	Divya
115	Naveen

-- 27. 
select Mname, Language, Gender from Movies
where Duration > 120
Avengers	English	Action
RRR	Telugu	Action
Kalki 2898 AD	Telugu	Sci-Fi
Krish	Hindi	Sci-fi
Leo	Tamil	Action
Animal	Hindi	Drama
Fast X	English	Crime
Kaithi	Tamil	Thriller
Dangal	Hindi	Sports
Bahubali 2	Telugu	Drama

-- 28. 
select Tname, City, Screens from Theater
where Screens > 3
PVR Cinemas	Hyderabad	6
PVR Icon	Chennai	7
Cinepolis	Mumbai	5
Miraj Cinemas	Delhi	4

-- 29.
select SID, MID, ShowTime from Shows
where ShowTime > '18:00:00'
407	207	19:00:00.0000000
408	208	20:00:00.0000000
410	210	21:00:00.0000000

-- 30.
select PID, Amount, Pstatus from Payment
where Amount > 500
602	750.00	Success
603	1500.00	Success
604	950.00	Success
606	1100.00	Success
608	1250.00	Success
610	750.00	Success

-- 31. 
select Cname, BID from Customer as C join Booking as B
on C.CID = B.CID
Princy	501
Jagadesh	502
Goutham	503
Sneha	504
Sumanth	505
Sanjay	506
Rohit	507
Divya	508
Vijay	509
Pinky	510

-- 32.
select Cname, Mobile, Seats
from Customer as C join Booking as B on C.CID = B.CID
Princy	9876543210	2
Jagadesh	9876543211	3
Goutham	9876543212	2
Sneha	9876543213	4
Sumanth	9876543214	2
Sanjay	9876543215	3
Rohit	9876543216	2
Divya	9876543217	5
Vijay	9876543218	2
Pinky	9876543219	3

-- 33.
select Mname, ShowTime from Movies as M  join Shows as S 
on M.MID = S.MID
Avengers	10:00:00.0000000
RRR	13:00:00.0000000
Kalki 2898 AD	16:00:00.0000000
Krish	10:03:00.0000000
Leo	14:00:00.0000000
Animal	18:00:00.0000000
Fast X	19:00:00.0000000
Kaithi	20:00:00.0000000
Dangal	17:03:00.0000000
Bahubali 2	21:00:00.0000000

-- 34.
select Mname, Language, SDate from Movies as M join Shows as S
on M.MID = S.MID
Avengers	English	2012-05-04
RRR	Telugu	2022-03-25
Kalki 2898 AD	Telugu	2024-06-27
Krish	Hindi	2006-06-23
Leo	Tamil	2023-10-19
Animal	Hindi	2023-12-01
Fast X	English	2023-12-19
Kaithi	Tamil	2019-10-25
Dangal	Hindi	2016-12-23
Bahubali 2	Telugu	2017-04-28

-- 35.
select Tname, ShowTime from Theater as T join Shows as S
on T.TID = S.TID
PVR Cinemas	10:00:00.0000000
PGR Cinemas	13:00:00.0000000
PVR Cinemas	16:00:00.0000000
PVR Icon	10:03:00.0000000
Cinepolis	14:00:00.0000000
Miraj Cinemas	18:00:00.0000000
PVR Cinemas	19:00:00.0000000
PVR Icon	20:00:00.0000000
Cinepolis	17:03:00.0000000
Miraj Cinemas	21:00:00.0000000

-- 36.
select Tname, City, SDate from Theater as T join Shows as S
on T.TID = S.TID
PVR Cinemas	Hyderabad	2012-05-04
PGR Cinemas	Tirupati	2022-03-25
PVR Cinemas	Hyderabad	2024-06-27
PVR Icon	Chennai	2006-06-23
Cinepolis	Mumbai	2023-10-19
Miraj Cinemas	Delhi	2023-12-01
PVR Cinemas	Hyderabad	2023-12-19
PVR Icon	Chennai	2019-10-25
Cinepolis	Mumbai	2016-12-23
Miraj Cinemas	Delhi	2017-04-28

-- 37. 
select Mname, Tname from Movies as M join Shows as S
on M.MID = S.MID join Theater as T
on S.TID = T.TID
Avengers	PVR Cinemas
RRR	PGR Cinemas
Kalki 2898 AD	PVR Cinemas
Krish	PVR Icon
Leo	Cinepolis
Animal	Miraj Cinemas
Fast X	PVR Cinemas
Kaithi	PVR Icon
Dangal	Cinepolis
Bahubali 2	Miraj Cinemas

-- 38.
select Mname, Tname, City from Movies as M join Shows as S
on M.MID = S.MID join Theater as T
on S.TID = T.TID
where T.City = 'Tirupati'
RRR	PGR Cinemas	Tirupati

-- 39.
select Cname, Mname, Seats from Customer as C join Booking as B
on C.CID = B.CID join Shows as S
on B.SID = S.SID join Movies as M
on S.MID = M.MID
where Seats > 2
Jagadesh	RRR	3
Sneha	Krish	4
Sanjay	Animal	3
Divya	Kaithi	5
Pinky	Bahubali 2	3

-- 40.
select Mname, Tname, ShowTime from Movies as M join Shows as S
on M.MID = S.MID join Theater as T
on S.TID = T.TID
where City = 'Hyderabad' and ShowTime > '18:00:00'
Fast X	PVR Cinemas	19:00:00.0000000

-- 41.
select Cname, Mname, BookingDate from Customer as C join Booking as B
on C.CID = B.CID join Shows as S
on B.SID = S.SID join Movies as M
on S.MID = M.MID
where BookingDate > '2026-08-19'
Rohit	Fast X	2026-08-20
Divya	Kaithi	2026-08-20
Vijay	Dangal	2026-08-20
Pinky	Bahubali 2	2026-08-20

-- 42.
select Mname, Tname, City from Movies as M join Shows as S
on M.MID = S.MID join Theater as T
on S.TID = T.TID
where Language = 'Telugu' and City = 'Tirupati'
RRR	PGR Cinemas	Tirupati

-- 43.
update Customer
set City = 'Chittoor'
where CID = 101 and City = 'Hyderabad'
select * from Customer
101	Princy	9876543210	princy1211@gmail.com	Chittoor
102	Jagadesh	9876543211	jagadeshreddy0099@gmail.com	Chennai
103	Goutham	9876543212	goutham843@gmail.com	Bangalore
104	Sneha	9876543213	sneha345@gmail.com	Mumbai
105	Sumanth	9876543214	sumanth463@gmail.com	Delhi
106	Sanjay	9876543215	sanjayguptha45@gmail.com	Pune
107	Rohit	9876543216	rohit355433@gmail.com	Kolkata
108	Divya	9876543217	divya987@gmail.com	Hyderabad
109	Vijay	9876543218	vijay0011@gmail.com	Chennai
110	Pinky	9876543219	pinky1223@gmail.com	Bangalore
111	Bhagi	9876543220	bhagi1303@gmail.com	Mumbai
112	Venky	9876543221	venky7788@gmail.com	Delhi
113	Ajay	9876543222	ajay0034@gmail.com	Pune
114	Neha	9876543223	neha6574@gmail.com	Kolkata
115	Naveen	9876543224	naveen@gmail.com	Hyderabad

-- 44.
update Movies
set Gender = 'Action'
where MID = 203
select * from Movies
where MID=203
203	Kalki 2898 AD	Telugu	Action	181

-- 45. 
update Theater
set Screens = Screens + 1
where TID = 302
select * from Theater
where TID = 302
302	PGR Cinemas	Tata Nagar	Tirupati	4ted

-- 46.
update Payment
set Pstatus = 'Successful'
where PID = 605
select * from Payment
where PID = 605
605	505	500.00	Card	Successful

-- 47.
update Payment
set Ptype = 'UPI'
where Pstatus = 'Pending' and Amount = 500
select * from Payment
where Pstatus = 'Pending'
609	509	500.00	UPI	Pending

-- 48.
delete from Customer
where CID = 114
select * from Customer
101	Princy	9876543210	princy1211@gmail.com	Chittoor
102	Jagadesh	9876543211	jagadeshreddy0099@gmail.com	Chennai
103	Goutham	9876543212	goutham843@gmail.com	Bangalore
104	Sneha	9876543213	sneha345@gmail.com	Mumbai
105	Sumanth	9876543214	sumanth463@gmail.com	Delhi
106	Sanjay	9876543215	sanjayguptha45@gmail.com	Pune
107	Rohit	9876543216	rohit355433@gmail.com	Kolkata
108	Divya	9876543217	divya987@gmail.com	Hyderabad
109	Vijay	9876543218	vijay0011@gmail.com	Chennai
110	Pinky	9876543219	pinky1223@gmail.com	Bangalore
111	Bhagi	9876543220	bhagi1303@gmail.com	Mumbai
112	Venky	9876543221	venky7788@gmail.com	Delhi
113	Ajay	9876543222	ajay0034@gmail.com	Pune
115	Naveen	9876543224	naveen@gmail.com	Hyderabad

-- 49.
delete from Movies
where Duration < 120

-- 50. 
delete from Theater
where Screens < 7 and City = 'Chennai'

-- 51.
delete from Booking
where Seats = 2 and BookingDate < '2026-08-20'

-- 52.
delete from Payment
where Pstatus = 'Success' and Amount < 800
select * from Payment
where Pstatus = 'Success'
603	503	1500.00	UPI	Success
604	504	950.00	Net Banking	Success
606	506	1100.00	UPI	Success
608	508	1250.00	Card	Success

-- 53. 
update Movies
set Duration = Duration + 10
where Duration < 180
select * from Movies
where Duration < 180
207	Fast X	English	Crime	161
208	Kaithi	Tamil	Thriller	166

-- 54. 
update Theater
set Screens = Screens + 1
where Screens < 5
select * from Theater
301	PVR Cinemas	Banjara Hills	Hyderabad	6
302	PGR Cinemas	Tata Nagar	Tirupati	5
303	PVR Icon	Velachery	Chennai	7
304	Cinepolis	Andheri	Mumbai	5
305	Miraj Cinemas	Connaught Place	Delhi	5

-- 55. 
update Theater
set City = 'Tirupati'
where City = 'Hyderabad' and Screens >= 3
select * from Theater
301	PVR Cinemas	Banjara Hills	Tirupati	6
302	PGR Cinemas	Tata Nagar	Tirupati	5
303	PVR Icon	Velachery	Chennai	7
304	Cinepolis	Andheri	Mumbai	5
305	Miraj Cinemas	Connaught Place	Delhi	5

-- 56. 
update Movies
set Language = 'Telugu'
where Language = 'English'
and Gender = 'Action'
select * from Movies
201	Avengers	Telugu	Action	182
202	RRR	Telugu	Action	187
203	Kalki 2898 AD	Telugu	Action	181
204	Krish	Hindi	Sci-fi	185
205	Leo	Tamil	Action	184
206	Animal	Hindi	Drama	201
207	Fast X	English	Crime	161
208	Kaithi	Tamil	Thriller	166
209	Dangal	Hindi	Sports	181
210	Bahubali 2	Telugu	Drama	187

-- 57.
update Movies
set Gender = 'Action'
where Language = 'Telugu' and Duration > 120
select * from Movies
201	Avengers	Telugu	Action	182
202	RRR	Telugu	Action	187
203	Kalki 2898 AD	Telugu	Action	181
204	Krish	Hindi	Sci-fi	185
205	Leo	Tamil	Action	184
206	Animal	Hindi	Drama	201
207	Fast X	English	Crime	161
208	Kaithi	Tamil	Thriller	166
209	Dangal	Hindi	Sports	181
210	Bahubali 2	Telugu	Action	187

-- 58. 
update Shows
set ShowTime = '18:00:00'
where SDate = '2024-06-27' and ShowTime < '18:00:00'
select * from Shows
401	201	301	2012-05-04	10:00:00.0000000
402	202	302	2022-03-25	13:00:00.0000000
403	203	301	2024-06-27	18:00:00.0000000
404	204	303	2006-06-23	10:03:00.0000000
405	205	304	2023-10-19	14:00:00.0000000
406	206	305	2023-12-01	18:00:00.0000000
407	207	301	2023-12-19	19:00:00.0000000
408	208	303	2019-10-25	20:00:00.0000000
409	209	304	2016-12-23	17:03:00.0000000
410	210	305	2017-04-28	21:00:00.0000000

-- 59.
update Booking
set Seats = Seats + 1
where Seats < 3
select * from Booking
501	101	401	3	2026-08-19
502	102	402	3	2026-08-19
503	103	403	3	2026-08-19
504	104	404	4	2026-08-19
505	105	405	3	2026-08-19
506	106	406	3	2026-08-19
507	107	407	3	2026-08-20
508	108	408	5	2026-08-20
509	109	409	3	2026-08-20
510	110	410	3	2026-08-20

-- 60. 
update Booking
set BookingDate = '2026-08-25'
where Seats > 4 and BookingDate < '2026-08-21'
select * from Booking
501	101	401	3	2026-08-19
502	102	402	3	2026-08-19
503	103	403	3	2026-08-19
504	104	404	4	2026-08-19
505	105	405	3	2026-08-19
506	106	406	3	2026-08-19
507	107	407	3	2026-08-20
508	108	408	5	2026-08-25
509	109	409	3	2026-08-20
510	110	410	3	2026-08-20

-- 61.
update Payment
set Ptype = 'UPI'
where Ptype = 'Cash'
select * from Payment
603	503	1500.00	UPI	Success
604	504	950.00	Net Banking	Success
605	505	500.00	Card	Successful
606	506	1100.00	UPI	Success	45 
608	508	1250.00	Card	Success
609	509	500.00	UPI	Pending

-- 62.
update Payment
set Pstatus = 'Successful'
where Amount >= 500 and Pstatus = 'Pending'
select * from Payment
603	503	1500.00	UPI	Success
604	504	950.00	Net Banking	Success
605	505	500.00	Card	Successful
606	506	1100.00	UPI	Success
608	508	1250.00	Card	Success
609	509	500.00	UPI	Successful

-- 63.
update Payment
set Pstatus = 'Failed'
where Amount <= 500 and Pstatus = 'Pending'
select * from Payment
603	503	1500.00	UPI	Success
604	504	950.00	Net Banking	Success
605	505	500.00	Card	Successful
606	506	1100.00	UPI	Success
608	508	1250.00	Card	Success
609	509	500.00	UPI	Successful


-- 64. 
update Payment
set Amount = Amount + 50
where Ptype = 'UPI' and Amount <= 500
select * from Payment
603	503	1500.00	UPI	Success
604	504	950.00	Net Banking	Success
605	505	500.00	Card	Successful
606	506	1100.00	UPI	Success
608	508	1250.00	Card	Success
609	509	550.00	UPI	Successful


-- 65.
delete from Customer
where City = 'Hyderabad' and Email like '%@gmail.com'
select * from Customer

-- 66.
delete from Movies
where Language = 'English' and Duration > 150
select * from Movies

-- 67.
delete from Theater
where (City = 'Hyderabad'
or City = 'Chennai') and Screens < 8

-- 68.
delete from Shows
where SDate = '2024-06-27' and ShowTime < '17:00:00'

-- 69.
delete from Booking
where Seats > 4 and BookingDate < '2026-08-21'


-- 70.
delete from Payment
where Amount > 1000 and Pstatus = 'Success'
select * from Payment
604	504	950.00	Net Banking	Success
605	505	500.00	Card	Successful
609	509	550.00	UPI	Successful

-- 71.
select count(*) from Customer
where City  = 'Bangalore' and Email like '%@gmail.com'

2

--72.
select count(*) from Customer
where City = 'Hyderabad' or City = 'Chennai'

4

-- 73.
select count(*) from Movies
where Language = 'Telugu' and Gender = 'Action'

4

-- 74.
select count(*) from Movies
where Duration < 180 and Duration >120

2

-- 75.
select count(*) from Theater
where City = 'Tirupati' and Screens  > 3

2

-- 76.
select count(*) from Booking
where Seats >= 3 and Seats <=5

10

--77.
select min(Duration) from Movies
where Language = 'Telugu' and Gender = 'Action'
select * from Movies

181

--78.
select max(Duration) from Movies
where Language = 'English' or Language = 'Hindi'

201

--79.
select avg(Duration) from Movies
where Duration > 120 and Duration < 180

163

-- 80.
select min(Screens) from Theater 
where City = 'Tirupati' and Screens > 2

302	PGR Cinemas	Tata Nagar	Tirupati	5

-- 81.
select max(Screens) from Theater
where City = 'Hyderabad' or City = 'Chennai'
select * from Theater

7

-- 82.
select avg(Screens) from Theater
where City = 'Tirupati' and Screens >=3

5

-- 83.
select min(Seats) from Booking
where Seats > 1 and Seats < 5

3
-- 84.
select max(Seats) from Booking
where BookingDate = '2026-08-19' and Seats > 2

output: 4

-- 85.
select avg(Amount) from Payment
where Pstatus = 'Successful' and Amount > 500

output: 550.000000

-- 86.
select sum(Amount) from Payment
where Pstatus = 'Success' and Amount > 500

output: 950.00

-- 87.
select sum(Amount) from Payment
where Ptype = 'UPI' and Amount > 300

ouput: 950.00

-- 88.
select sum(Amount) from Payment
where Pstatus = 'Success' and Ptype = 'UPI' and Amount > 500

output: NULL

-- 89.
select distinct City from Theater 
where Screens > 2 and Screens < 6

output: Delhi
Mumbai
Tirupati

-- 90.
select distinct Pstatus from Payment 
where Ptype = 'UPI' or Ptype = 'Card'

output: Successful

-- 91.
select distinct SDate from Shows
where ShowTime = '18:00:00' and ShowTime < '22:00:00'

output: 2023-12-01
2024-06-27

-- 92.
select CName from Customer 
where CName like 'P%' and City = 'Chittoor'

output: Princy

-- 93.
select CName from Customer
where (CName like 'D%' or CName like 'N%') 
and City = 'Hyderabad'

output: Divya
Naveen


--94.
select CName, Email from Customer 
where Cname like '%an%' and Email like '%@gmail.com' 
Sumanth	sumanth463@gmail.com
Sanjay	sanjayguptha45@gmail.com

-- 95.
select Mname from Movies
where Mname like 'K%' and Language = 'Telugu'

output: Kalki 2898 AD

-- 96.
select Language, avg(Duration) from Movies
where Duration > 100 group by Language
English	161
Hindi	189
Tamil	175
Telugu	184

-- 97.
select City, count(*) from Theater
where Screens >= 3 group by City
Chennai	1
Delhi	1
Mumbai	1
Tirupati	2

-- 98.
select City, avg(Screens) from Theater
where Screens > 2 group by City
Chennai	7
Delhi	5
Mumbai	5
Tirupati	5

-- 99.
select Ptype, sum(Amount) from Payment
where Pstatus = 'Success' group by Ptype

Net Banking	950.00

-- 100.
select City, count(*) from Customer
group by City having count(*) > 0
Bangalore	2
Chennai	2
Chittoor	1
Delhi	2
Hyderabad	2
Kolkata	1
Mumbai	2
Pune	2

-- 101.
select Language, count(*) from Movies
group by Language having count(*) > 1
Hindi	3
Tamil	2
Telugu	4

-- 102.
select Gender, avg(Duration) from Movies
group by Gender having avg(Duration) > 120
Action	184
Crime	161
Drama	201
Sci-fi	185
Sports	181
Thriller	166

-- 103.
select City, count(*) from Theater
group by City having count(*) >= 2

output: Tirupati	2

-- 104.
select Ptype, sum(Amount) from Payment
group by Ptype having sum(Amount) > 105

output: Card	500.00
Net Banking	950.00
UPI	550.00

-- 105.
select Gender, count(*) from Movies
where Language = 'Telugu'
group by Gender having count(*) > 2

output: Action	4

-- 106.
select Cname, sum(Seats) from Customer as C 
join Booking as B on C.CID = B.CID
where Seats > 1
group by Cname having sum(Seats) > 5

output: NULL

-- 107.
select Ptype, avg(Amount) from Payment
where Pstatus = 'Success'
group by Ptype having avg(Amount) > 500

output: Net Banking	950.000000

-- 108.
select Gender, count(*) from Movies
group by Gender order by count(*) desc
Action	5
Crime	1
Drama	1
Sci-fi	1
Sports	1
Thriller	1

-- 109.
select Language, avg(Duration) from Movies
group by Language order by avg(Duration) asc
English	161
Tamil	175
Telugu	184
Hindi	189

-- 110.
select Ptype, sum(Amount) from Payment
where Pstatus = 'Success' and Amount > 300
group by Ptype having sum(Amount) > 100
order by sum(Amount) desc

output: Net Banking	950.00

      ---- Subqueries ----
-- 1.
select * from Movies
where Duration = (select max(Duration) from Movies)
output:
206	Animal	Hindi	Drama	201

-- 2.
select * from Movies
where Duration = (select min(Duration) from Movies)

output: 207	Fast X	English	Crime	161

-- 3.
select * from Theater
where Screens = (select max(Screens) from Theater)

output: 303	PVR Icon	Velachery	Chennai	7

-- 4.
select * from Theater
where Screens = (select min(Screens) from Theater)
PGR Cinemas	Tata Nagar	Tirupati	5
Cinepolis	Andheri	Mumbai	5
Miraj Cinemas	Connaught Place	Delhi	5

-- 5.
select * from Booking 
where Seats = (select max(Seats) from Booking)

output: 508	108	408	5	2026-08-25

-- 6.
select * from Booking
where Seats = (select min(Seats) from Booking)

output: 604	504	950.00	Net Banking	Success

-- 7.
select * from Payment
where Amount = (select max(Amount) from Payment)

ouput: 604	504	950.00	Net Banking	Success

-- 8.
select * from Payment
where Amount = (select min(Amount) from Payment)

output: 605	505	500.00	Card	Successful

-- 9.
select Mname from Movies
where Duration > (select avg(Duration) from Movies)
Avengers
RRR
Krish
Leo
Animal
Bahubali 2

-- 10.
select Tname from Theater
where Screens > (select avg(Screens) from Theater)
PVR Cinemas
PVR Icon

-- 11.
select Mname from Movies
where Duration > (select Duration from Movies
where MID = 205)
RRR
Krish
Animal
Bahubali 2

-- 12.
select Tname from Theater 
where Screens > (select Screens from Theater
where TID = 302)
PVR Cinemas
PVR Icon

-- 13.
select CName from Customer
where City = (select City from Customer
where CID = 105)
select * from Customer
Sumanth
Venky

-- 14.
select * from Booking
where Seats > (select Seats from Booking
where BID = 505)
select * from Booking
504	104	404	4	2026-08-19
508	108	408	5	2026-08-25

-- 15
select * from Payment
where Amount > (select Amount from Payment
where PID = 605)
604	504	950.00	Net Banking	Success
609	509	550.00	UPI	Successful

--16.
select Mname from Movies 
where Duration < (select avg(Duration) from Movies)
Fast X
Kaithi

--17.
select Tname from Theater 
where Screens < (select avg(Screens) from Theater)
select * from Theater

output: NULL

-- 18.
select Cname from Customer
where CID in (select CID from Booking)
Princy
Jagadesh
Goutham
Sneha
Sumanth
Sanjay
Rohit
Divya
Vijay
Pinky

-- 19.
select Mname from Movies
where MID in (select MID from Shows)
Avengers
RRR
Kalki 2898 AD
Krish
Leo
Animal
Fast X
Kaithi
Dangal
Bahubali 2

-- 20.
select Tname from Theater
where TID in (select TID from Shows)
PVR Cinemas
PGR Cinemas
PVR Icon
Cinepolis
Miraj Cinemas

-- 21.
select Cname from Customer
where CID not in (Select CID from Booking)
Bhagi
Venky
Ajay
Naveen

-- 22.
select Mname from Movies
where Duration > (select avg(Duration) from Movies
where Language = 'Telugu')
RRR
Krish
Animal
Bahubali 2

-- 23.
select Tname from Theater
where Screens > (select avg(Screens) from Theater
where City = 'Tirupati')
PVR Cinemas
PVR Icon

-- 24.
select * from Payment
where Amount > (select avg(Amount) from Payment
where Pstatus = 'Successful')
604	504	950.00	Net Banking	Success
609	509	550.00	UPI	Successful

-- 25.
select Cname from Customer
where CID in (select CID from Booking
where Seats > 2)
Princy
Jagadesh
Goutham
Sneha
Sumanth
Sanjay
Rohit
Divya
Vijay
Pinky




















