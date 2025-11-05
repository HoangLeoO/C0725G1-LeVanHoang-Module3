drop database if exists manager_students;
create database if not exists  manager_students;
use manager_students;

create table if not exists class(
class_id int auto_increment primary key, 
class_name varchar(60) not null,
start_date date not null,
status Bit default 1
);

create table if not exists students(
student_id int auto_increment primary key ,
student_name varchar(30) not null,
address varchar(50),
phone varchar(20),
status bit,
class_id int not null,
constraint fk_student_class_id foreign key (class_id) references class(class_id)
);

create table if not exists subjects(
sub_id int auto_increment primary key,
sub_name varchar(30) not null,
credit tinyint not null default 1 check (credit >= 1) ,
status bit default 1
);


create table if not exists marks(
mark_id int auto_increment primary key,
sub_id int not null ,
student_id int not null ,
mark float default 0 check (mark between 0 and 100),
exam_times tinyint default 1 ,
unique(sub_id,student_id),
constraint fk_mark_subject foreign key (sub_id) references subjects(sub_id),
constraint fk_mark_student_id foreign key (student_id)references students(student_id)
);

INSERT INTO Class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO Class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO Class
VALUES (3, 'B3', current_date, 0);

INSERT INTO Students (student_name, address, phone, status, class_id)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO Students (student_name, address, phone, status, class_id)
VALUES ('Hoa', 'Hai phong','0912113112', 1, 1);
INSERT INTO Students (student_name, address, phone, status, class_id)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO Subjects
VALUES (1, 'CF', 5, 1),
 (2, 'C', 6, 1),
 (3, 'HDJ', 5, 1),
 (4, 'RDBMS', 10, 1);
 
 INSERT INTO Marks (sub_id, student_id, mark, exam_times)
VALUES (1, 1, 8, 1),
 (1, 2, 10, 2),
 (2, 1, 12, 1);
 
 select * from class;
 select * from students;
 select * from subjects;
 select * from marks;
 
--  Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select * from students where student_name like 'h%';
-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select * from subjects where credit between 3 and 5;
-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
SET SQL_SAFE_UPDATES = 0;

UPDATE students 
SET class_id = 2 
WHERE student_name = 'Hung';

SET SQL_SAFE_UPDATES = 1; -- (tuỳ chọn, bật lại sau khi xong)

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select s.student_name , sb.sub_name , m.mark from marks as m
join students as s on s.student_id = m.student_id 
join subjects as sb on sb.sub_id = m.sub_id 
order by m.mark desc , s.student_name asc;