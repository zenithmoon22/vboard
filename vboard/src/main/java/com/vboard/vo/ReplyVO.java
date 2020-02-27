package com.vboard.vo;

import java.sql.Timestamp;

public class ReplyVO {
	private int b_num;
	private String reply_id;
	private String reply_content;
	private Timestamp reply_reg_date;
	private int reply_index;

	public int getB_num() {
		return b_num;
	}

	public void setB_num(int b_num) {
		this.b_num = b_num;
	}

	public String getReply_id() {
		return reply_id;
	}

	public void setReply_id(String reply_id) {
		this.reply_id = reply_id;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public Timestamp getReply_reg_date() {
		return reply_reg_date;
	}

	public void setReply_reg_date(Timestamp reply_reg_date) {
		this.reply_reg_date = reply_reg_date;
	}

	public int getReply_index() {
		return reply_index;
	}

	public void setReply_index(int reply_index) {
		this.reply_index = reply_index;
	}

	@Override
	public String toString() {
		return "ReplyVO [b_num=" + b_num + ", reply_id=" + reply_id + ", reply_content=" + reply_content + ", reply_reg_date="
				+ reply_reg_date + ", reply_index=" + reply_index + "]";
	}

}
