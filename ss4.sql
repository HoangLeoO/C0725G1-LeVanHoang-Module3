-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select sub_id,sub_name, max(credit) as credit  from subjects group by  sub_id,sub_name,credit order by credit  desc limit 0,1  ;

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select sb.sub_id , sb.sub_name , max(m.mark) as mark
from subjects sb 
join marks m on m.sub_id = sb.sub_id 
group by sb.sub_id , sb.sub_name order by mark desc limit 0,1;
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select s.student_id , s.student_name , avg(m.mark) as agv from students s 
join marks m on m.student_id = s.student_id
group by s.student_id , s.student_name;