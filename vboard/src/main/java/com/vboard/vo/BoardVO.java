package com.vboard.vo;

import java.sql.Timestamp;

public class BoardVO {
	private int b_num;
	private String b_title;
	private String b_content;
	private String b_writer;
	private int b_hit;
	private int b_recommend;
	private Timestamp b_reg_date;
	private int b_reply_count;

	public int getB_num() {
		return b_num;
	}

	public void setB_num(int b_num) {
		this.b_num = b_num;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public String getB_writer() {
		return b_writer;
	}

	public void setB_writer(String b_writer) {
		this.b_writer = b_writer;
	}

	public int getB_hit() {
		return b_hit;
	}

	public void setB_hit(int b_hit) {
		this.b_hit = b_hit;
	}

	public int getB_recommend() {
		return b_recommend;
	}

	public void setB_recommend(int b_recommend) {
		this.b_recommend = b_recommend;
	}

	public Timestamp getB_reg_date() {
		return b_reg_date;
	}

	public void setB_reg_date(Timestamp b_reg_date) {
		this.b_reg_date = b_reg_date;
	}

	public int getB_reply_count() {
		return b_reply_count;
	}

	public void setB_reply_count(int b_reply_count) {
		this.b_reply_count = b_reply_count;
	}

	@Override
	public String toString() {
		return "BoardVO [b_num=" + b_num + ", b_title=" + b_title + ", b_content=" + b_content + ", b_writer=" + b_writer + ", b_hit="
				+ b_hit + ", b_recommend=" + b_recommend + ", b_reg_date=" + b_reg_date + ", b_reply_count=" + b_reply_count + "]";
	}

}
