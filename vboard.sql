use bbs;
create table user_info(
	u_id varchar(20) primary key,
    u_pwd varchar(20),
    u_name varchar(20),
    u_sex varchar(6),
    u_birthday int,
    u_email varchar(40),
    u_phone_number varchar(12),
    u_email_active_key varchar(255),
    u_active_state tinyint(1),
	u_reg_date timestamp,
	u_latest_login_date timestamp,
	u_recommend_active_time timestamp
);

create table board_info(
	b_num int auto_increment primary key,
	b_title varchar(40),
	b_content text,
	b_writer varchar(20),
	b_hit int,
	b_recommend int,
	b_reg_date timestamp,
	b_reply_count int
);

create table reply_info(
	b_num int,
	reply_id varchar(20),
	reply_content text,
	reply_reg_date timestamp,
	reply_index int auto_increment primary key
);
ALTER TABLE reply_info ADD FOREIGN KEY (b_num) REFERENCES board_info (b_num) ON DELETE CASCADE ;
  
create table mp_file(
    file_no int primary key auto_increment,                         
    b_num int NOT NULL,                    
    org_file_name VARCHAR(260) NOT NULL,   
    stored_file_name VARCHAR(36) NOT NULL, 
    file_size int,                       
    regdate timestamp ,
    del_gb VARCHAR(1) DEFAULT 'N' NOT NULL
);
commit;
ALTER TABLE mp_file ADD FOREIGN KEY (b_num) REFERENCES board_info (b_num) ON DELETE CASCADE ;