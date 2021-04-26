create table users(
    userid number(10),
    fullname varchar2(255),
    username varchar2(20),
    password varchar2(20),
    email varchar2(255),
    phone varchar2(11), 
    address varchar2(255),
    status number(5),
    createddate date,
    modifieddate date,
    createdby varchar2(255),
    modifiedby varchar2(255),
    constraint PK_Users primary key(userid)
);


create table customers(
    customerid number(10),
    userid number(10),
    fullname varchar2(255),
    email varchar2(255),
    phone varchar2(11),
    status number(5),
    demand clob,
    createddate date,
    modifieddate date,
    createdby varchar2(255),
    modifiedby varchar2(255),
    constraint PK_Customers primary key(customerid),
    constraint FK_Customers foreign key (userid) references users(userid)
);

create table transactions(
    userid number(10),
    customerid number(10),
    transactionid number(10),
    paymentid number(10),
    code varchar2(255),
    note varchar2(255),
    createddate date,
    modifieddate date,
    createdby varchar2(255),
    modifiedby varchar2(255),
    constraint PK_Transactions primary key(userid, customerid, transactionid),
    constraint FK_Transactions_userid foreign key(userid) references users(userid),
    constraint FK_Transactions_custromerid foreign key(customerid) references customers(customerid)
);

create table payments(
    paymentid number(10),
    transactionid number(10),
    userid number(10),
    customerid number(10),
    total number(19, 4),
    node varchar2(255),
    createddate date,
    createdby varchar2(255),
    modifieddate date,
    modifiedby varchar2(255),
    constraint PK_Payments primary key(paymentid, transactionid)
    --constraint FK_Payments_paymentid foreign key(paymentid) references transactions(paymentid),
    --constraint FK_Payments_transactionid foreign key(transactionid) references transactions(transactionid)
);

create table blogs(
    blogid number(10),
    blogcategoryid number(10),
    userid number(10),
    title varchar2(50),
    content clob,
    createddate date,
    createdby varchar2(255),
    modifieddate date,
    modifiedby varchar2(255), 
    constraint PK_Blogs primary key(blogid),
    constraint FK_Blogs_blogcategoryid foreign key(blogcategoryid)references blogcategories(blogcategoryid),
    constraint FK_BLogs_usrid foreign key(userid) references users(userid)
);


create table blogcategories(
    blogcategoryid number(10),
    name varchar2(255),
    code varchar2(255),
    createddate date,
    createdby varchar2(255),
    modifieddate date,
    modifiedby varchar2(255),
    constraint PK_Blogcategories primary key(blogcategoryid)
);

create table user_roles(
    userid number(10),
    roleid number(10),
    constraint PK_User_roles primary key(userid, roleid),
    constraint FK_User_roles_userid foreign key(userid) references users(userid),
    constraint FK_User_roles_roleid foreign key(roleid) references roles(roleid)
);

create table roles(
    roleid number(10),
    rolecode varchar2(255),
    rolename varchar2(255),
    constraint PK_Roles primary key(roleid)
);

create table roomassignments(
    userid number(10),
    roomid number(10),
    constraint PK_Roomassignment primary key(userid, roomid),
    constraint FK_Roomassignment_userid foreign key(userid) references users(userid),
    constraint FK_Roomassginment_roomid foreign key(roomid) references rooms(roomid)
);

create table rooms(
    roomid number(10),
    categoryroomid number(10),
    district varchar2(255),
    street varchar2(255),
    ward varchar2(255),
    deposit number(19, 4),
    payment varchar2(255),
    rentprice number(19, 4),
    area float(53),
    content clob,
    thumbnail clob,
    rentpricedescription varchar2(255),
    areadescription varchar2(255),
    createddate date,
    createdby varchar2(255),
    modifieddate date,
    modifiedby varchar2(255),
    constraint PK_Rooms primary key(roomid),
    constraint FK_Rooms_categoryroomid foreign key(categoryroomid) references categoryrooms(categoryroomid)
);

create table categoryrooms(
    categoryroomid number(10),
    name varchar2(255),
    code varchar2(255),
    createddate date,
    createdby varchar2(255),
    modifieddate date,
    modifiedby varchar2(255),
    constraint PK_Categoryrooms primary key(categoryroomid)
)




















