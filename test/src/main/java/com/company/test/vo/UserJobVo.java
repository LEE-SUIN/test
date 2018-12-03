package com.company.test.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class UserJobVo {

	public UserJobVo(){}
	
	public UserJobVo(int sj_seq,int sj_user_seq,int sj_group_seq,int sj_sc_seq,String sj_name)
	{
		super();
		this.sj_seq = sj_seq;
		this.sj_user_seq = sj_user_seq;
		this.sj_group_seq = sj_group_seq;
		this.sj_sc_seq = sj_sc_seq;
		this.sj_name = sj_name;
		
	}
	
	private int sj_seq = 0;
	private int sj_user_seq = 0;
	private int sj_group_seq = 0;
	private int sj_sc_seq = 0;
	private String sj_name = "";
	public int getSj_seq() {
		return sj_seq;
	}

	public void setSj_seq(int sj_seq) {
		this.sj_seq = sj_seq;
	}

	public int getSj_user_seq() {
		return sj_user_seq;
	}

	public void setSj_user_seq(int sj_user_seq) {
		this.sj_user_seq = sj_user_seq;
	}

	public int getSj_group_seq() {
		return sj_group_seq;
	}

	public void setSj_group_seq(int sj_group_seq) {
		this.sj_group_seq = sj_group_seq;
	}

	public int getSj_sc_seq() {
		return sj_sc_seq;
	}

	public void setSj_sc_seq(int sj_sc_seq) {
		this.sj_sc_seq = sj_sc_seq;
	}

	public String getSj_name() {
		return sj_name;
	}

	public void setSj_name(String sj_name) {
		this.sj_name = sj_name;
	}
	
	

	
	
}
