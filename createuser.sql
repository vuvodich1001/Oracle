create user sinhvien01 identified by 311001;
create user sinhvien02 identified by 311001;
create user sinhvien03 identified by 311001;
create user sinhvien04 identified by 311001;
create user sinhvien05 identified by 311001;
create user sinhvien06 identified by 311001;
create user sinhvien07 identified by 311001;
create user sinhvien08 identified by 311001;
create user sinhvien09 identified by 311001;
create user sinhvien10 identified by 311001;

create role  role_quantri;
grant connect, resource, oem_monitor, dba to role_quantri;


grant role_quantri to sinhvien01;
grant role_quantri to sinhvien02;
grant role_quantri to sinhvien03;
grant role_quantri to sinhvien04;
grant role_quantri to sinhvien05;
grant role_quantri to sinhvien06;
grant role_quantri to sinhvien07;
grant role_quantri to sinhvien08;
grant role_quantri to sinhvien09;
grant role_quantri to sinhvien10;


create user sinhvien11 identified by 311001;
create user sinhvien12 identified by 311001;
create user sinhvien13 identified by 311001;
create user sinhvien14 identified by 311001;
create user sinhvien15 identified by 311001;
create user sinhvien16 identified by 311001;
create user sinhvien17 identified by 311001;
create user sinhvien18 identified by 311001;
create user sinhvien19 identified by 311001;
create user sinhvien20 identified by 311001;

create role role_nguoidung;
grant connect, resource, oem_monitor to role_nguoidung;

grant role_nguoidung to sinhvien11;
grant role_nguoidung to sinhvien12;
grant role_nguoidung to sinhvien13;
grant role_nguoidung to sinhvien14;
grant role_nguoidung to sinhvien15;
grant role_nguoidung to sinhvien16;
grant role_nguoidung to sinhvien17;
grant role_nguoidung to sinhvien18;
grant role_nguoidung to sinhvien19;
grant role_nguoidung to sinhvien20;

select * from DBA_ROLE_PRIVS
where UPPER(GRANTEE) like '%SINHVIEN01%';

select * from dba_sys_privs where grantee='ROLE_USER';
select * from dba_role_privs where grantee='ROLE_USER';


