package com.vboard.vo;

import java.sql.Timestamp;

public class UserVO {

	private String u_id;
	private String u_pwd;
	private String u_name;
	private String u_sex;
	private int u_birthday;
	private String u_email;
	private String u_phone_number;
	private String u_email_active_key;
	private int u_active_state;
	private Timestamp u_reg_date;
	private Timestamp u_latest_login_date;
	private Timestamp u_recommend_active_time;

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_pwd() {
		return u_pwd;
	}

	public void setU_pwd(String u_pwd) {
		this.u_pwd = u_pwd;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_sex() {
		return u_sex;
	}

	public void setU_sex(String u_sex) {
		this.u_sex = u_sex;
	}

	public int getU_birthday() {
		return u_birthday;
	}

	public void setU_birthday(int u_birthday) {
		this.u_birthday = u_birthday;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public String getU_phone_number() {
		return u_phone_number;
	}

	public void setU_phone_number(String u_phone_number) {
		this.u_phone_number = u_phone_number;
	}

	public String getU_email_active_key() {
		return u_email_active_key;
	}

	public void setU_email_active_key(String u_email_active_key) {
		this.u_email_active_key = u_email_active_key;
	}

	public int getU_active_state() {
		return u_active_state;
	}

	public void setU_active_state(int u_active_state) {
		this.u_active_state = u_active_state;
	}

	public Timestamp getU_reg_date() {
		return u_reg_date;
	}

	public void setU_reg_date(Timestamp u_reg_date) {
		this.u_reg_date = u_reg_date;
	}

	public Timestamp getU_latest_login_date() {
		return u_latest_login_date;
	}

	public void setU_latest_login_date(Timestamp u_latest_login_date) {
		this.u_latest_login_date = u_latest_login_date;
	}

	public Timestamp getU_recommend_active_time() {
		return u_recommend_active_time;
	}

	public void setU_recommend_active_time(Timestamp u_recommend_active_time) {
		this.u_recommend_active_time = u_recommend_active_time;
	}

	@Override
	public String toString() {
		return "UserVO [u_id=" + u_id + ", u_pwd=" + u_pwd + ", u_name=" + u_name + ", u_sex=" + u_sex + ", u_birthday=" + u_birthday + ", u_email=" + u_email
				+ ", u_phone_number=" + u_phone_number + ", u_email_active_key=" + u_email_active_key + ", u_active_state=" + u_active_state + ", u_reg_date="
				+ u_reg_date + ", u_latest_login_date=" + u_latest_login_date + ", u_recommend_active_time=" + u_recommend_active_time + "]";
	}

}
