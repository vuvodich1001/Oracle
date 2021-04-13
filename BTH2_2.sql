
--set date format
alter session set nls_date_format = 'dd-mm-yyyy';
--25 Cho biet ten vung, ma vung va so phong ban truc thuoc moi vung.
select w.region_id, r.name, count(*) SLPB from s_warehouse w, s_region r, s_dept d
where w.region_id = r.id and w.region_id = d.region_id
group by w.region_id, r.name;

--26 Hien thi ten khach hang va so luong don dat hang cua moi khach hang.
select c.name, count(*) SLDH from s_customer c, s_ord o
where c.id = o.customer_id
group by c.id, c.name;

--27 Cho biet khach hang co so don dat hang nhieu nhat.
select c.id, c.name from s_customer c, s_ord o
where c.id = o.customer_id
group by c.id, c.name
order by count(*) desc
fetch first 1 rows only;

--28 Cho biet khach hang co tong so tien mua lon nhat.
select c.id, c.name from s_customer c, s_ord o
where c.id = o.customer_id
group by c.id, c.name
order by sum(total) desc
fetch first 1 rows only;

--29 
--30 Hien thi ho, ten va ngay tuyen dung cua tat ca cac nhan vien cung phong voi lan.
select first_name, last_name, start_date 
from s_emp where dept_id = (select dept_id from s_emp where first_name = 'Mai');

--31 Hien thi ma nhan vien, ho, ten va ma  truy cap cua tat ca nhan vien co muc luong tren tb.
select id, first_name, last_name, userid 
from s_emp where salary >(select avg(salary) from s_emp);

--32 Nhu cau 31 va co chu ki tu L trong first name.
select id, first_name, last_name from s_emp 
where salary >(select avg(salary) from s_emp) and
first_name like '%L%';
--33 Hien thi khach hang chua bao gio dat hang.
select id,name from s_customer
minus
select distinct customer_id id, c.name from s_ord o, s_customer c
where o.customer_id = c.id;

--10 
select last_name, start_date, to_char(next_day(add_months(start_date, 6), 'monday'), 'fmDdspth "of" MONTH, YYYY') from s_emp;
