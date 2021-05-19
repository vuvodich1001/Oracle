
--SCRIPT
-- create sequence
create sequence seq_book 
start with 1
increment by 1;

create sequence seq_book_order 
start with 1
increment by 1;

create sequence seq_category
start with 1
increment by 1;

create sequence seq_customer 
start with 1
increment by 1;

create sequence seq_order_detail 
start with 1
increment by 1;

create sequence seq_review
start with 1
increment by 1;

create sequence seq_usr 
start with 1
increment by 1;
/*==============================================================*/
/* Table: BOOK                                                  */
/*==============================================================*/
create table BOOK 
(
   BOOK_ID              NUMBER(19) DEFAULT SEQ_BOOK.NEXTVAL NOT NULL,
   CATEGORY_ID          NUMBER(19) NOT NULL,
   TITLE                VARCHAR2(128),
   AUTHOR               VARCHAR2(64),
   DESCRIPTION          VARCHAR2(200),
   ISBN                 VARCHAR2(15),
   IMAGE                VARCHAR2(100),
   PRICE                FLOAT,
   PUBLISH_DATE         DATE,
   LAST_UPDATE          DATE DEFAULT SYSDATE NOT NULL,
   constraint PK_BOOK primary key (BOOK_ID)
);

/*==============================================================*/
/* Index: IN_FK                                                 */
/*==============================================================*/
create index IN_FK on BOOK (
   CATERGORY_ID ASC
);

/*==============================================================*/
/* Table: BOOK_ORDER                                            */
/*==============================================================*/
create table BOOK_ORDER 
(
   ORDER_ID             NUMBER(19) DEFAULT SEQ_BOOK_ORDER.NEXTVAL NOT NULL,
   CUSTOMER_ID          NUMBER(19) NOT NULL,
   ORDER_DATE           DATE DEFAULT SYSDATE NOT NULL,
   SHIPPING_ADDRESS     VARCHAR2(256),
   RECIPENT_NAME        VARCHAR2(30),
   RECIPENT_PHONE       VARCHAR2(15),
   PAYMENT_METHOD       VARCHAR2(20),
   TOTAL                FLOAT,
   STATUS               VARCHAR2(20),
   constraint PK_BOOK_ORDER primary key (ORDER_ID)
);

/*==============================================================*/
/* Index: HAVE_FK                                               */
/*==============================================================*/
create index HAVE_FK on BOOK_ORDER (
   CUSTOMER_ID ASC
);

/*==============================================================*/
/* Table: CATEGORY                                              */
/*==============================================================*/
create table CATEGORY 
(
   CATEGORY_ID          NUMBER(19) DEFAULT SEQ_CATEGORY.NEXTVAL NOT NULL,
   NAME                 VARCHAR2(30),
   constraint PK_CATEGORY primary key (CATEGORY_ID)
);

/*==============================================================*/
/* Table: CUSTOMER                                              */
/*==============================================================*/
create table CUSTOMER 
(
   CUSTOMER_ID          NUMBER(19) DEFAULT SEQ_CUSTOMER.NEXTVAL NOT NULL,
   EMAIL                VARCHAR2(30),
   FULL_NAME            VARCHAR2(30),
   ADDRESS              VARCHAR2(64),
   CITY                 VARCHAR2(64),
   COUNTRY              VARCHAR2(64),
   PHONE                VARCHAR2(15),
   ZIPCODE              VARCHAR2(24),
   PASSWORD             VARCHAR2(16),
   REGISTER_DATE        DATE DEFAULT SYSDATE NOT NULL,
   constraint PK_CUSTOMER primary key (CUSTOMER_ID)
);

/*==============================================================*/
/* Table: ORDER_DETAIL                                          */
/*==============================================================*/
create table ORDER_DETAIL 
(
   ORDER_ID             NUMBER(19) DEFAULT SEQ_ORDER_DETAIL.NEXTVAL NOT NULL,
   BOOK_ID              NUMBER(19) NOT NULL,
   QUANTITY             NUMBER(19),
   SUBTOTAL             FLOAT,
   constraint PK_ORDER_DETAIL primary key (ORDER_ID, BOOK_ID)
);

/*==============================================================*/
/* Index: CREATE_FK                                             */
/*==============================================================*/
create index CREATE_FK on ORDER_DETAIL (
   ORDER_ID ASC
);

/*==============================================================*/
/* Index: INCLUDE_FK                                            */
/*==============================================================*/
create index INCLUDE_FK on ORDER_DETAIL (
   BOOK_ID ASC
);

/*==============================================================*/
/* Table: REVIEW                                                */
/*==============================================================*/
create table REVIEW 
(
   REVIEW_ID            NUMBER(19) DEFAULT SEQ_REVIEW.NEXTVAL NOT NULL,
   CUSTOMER_ID          NUMBER(19) NOT NULL,
   RATING               NUMBER(19) NOT NULL,
   HEADLINE             VARCHAR2(128),
   "COMMENT"            VARCHAR2(500),
   REVIEW_TIME          DATE DEFAULT SYSDATE NOT NULL,
   constraint PK_REVIEW primary key (REVIEW_ID)
);

/*==============================================================*/
/* Index: VOTE_FK                                               */
/*==============================================================*/
create index VOTE_FK on REVIEW (
   CUSTOMER_ID ASC
);

/*==============================================================*/
/* Table: "usr"                                                */
/*==============================================================*/
create table "USR" 
(
   USR_ID               NUMBER(19) DEFAULT SEQ_USR.NEXTVAL NOT NULL,
   EMAIL                VARCHAR2(30),
   PASSWORD             VARCHAR2(16),
   FULL_NAME            VARCHAR2(30),
   constraint PK_USR primary key (USR_ID)
);

alter table BOOK
   add constraint FK_BOOK_IN_CATEGORY foreign key (CATEGORY_ID)
      references CATEGORY (CATEGORY_ID);

alter table BOOK_ORDER
   add constraint FK_BOOK_ORD_HAVE_CUSTOMER foreign key (CUSTOMER_ID)
      references CUSTOMER (CUSTOMER_ID);

alter table ORDER_DETAIL
   add constraint FK_ORDER_DE_ORDER_DET_BOOK_ORD foreign key (ORDER_ID)
      references BOOK_ORDER (ORDER_ID);

alter table ORDER_DETAIL
   add constraint FK_ORDER_DE_ORDER_DET_BOOK foreign key (BOOK_ID)
      references BOOK (BOOK_ID);

alter table REVIEW
   add constraint FK_REVIEW_VOTE_CUSTOMER foreign key (CUSTOMER_ID)
      references CUSTOMER (CUSTOMER_ID);




