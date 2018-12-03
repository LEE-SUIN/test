package com.company.test.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class CodeVo {

	public CodeVo(){}
	
	public CodeVo(int sc_seq,int sc_group_seq,String sc_group_name,String sc_name,String sc_use_yn,int sc_int_etc1,String sc_string_etc1)
	{
		super();		
		this.sc_seq = sc_seq;
		this.sc_group_seq = sc_group_seq;
		this.sc_group_name = sc_group_name;
		this.sc_name = sc_name;
		this.sc_use_yn = sc_use_yn;
		this.sc_int_etc1 = sc_int_etc1;
		this.sc_string_etc1 = sc_string_etc1;
	}
	
	public int sc_seq=0;
	public int sc_group_seq=0;
	public String sc_group_name="";
	public String sc_name="";
	public String sc_use_yn="";
	public int sc_int_etc1=0;
	public String sc_string_etc1="";
	
	public int getSc_seq() {
		return sc_seq;
	}

	public void setSc_seq(int sc_seq) {
		this.sc_seq = sc_seq;
	}

	public int getSc_group_seq() {
		return sc_group_seq;
	}

	public void setSc_group_seq(int sc_group_seq) {
		this.sc_group_seq = sc_group_seq;
	}

	public String getSc_group_name() {
		return sc_group_name;
	}

	public void setSc_group_name(String sc_group_name) {
		this.sc_group_name = sc_group_name;
	}

	public String getSc_name() {
		return sc_name;
	}

	public void setSc_name(String sc_name) {
		this.sc_name = sc_name;
	}

	public String getSc_use_yn() {
		return sc_use_yn;
	}

	public void setSc_use_yn(String sc_use_yn) {
		this.sc_use_yn = sc_use_yn;
	}

	public int getSc_int_etc1() {
		return sc_int_etc1;
	}

	public void setSc_int_etc1(int sc_int_etc1) {
		this.sc_int_etc1 = sc_int_etc1;
	}

	public String getSc_string_etc1() {
		return sc_string_etc1;
	}

	public void setSc_string_etc1(String sc_string_etc1) {
		this.sc_string_etc1 = sc_string_etc1;
	}
	
	
	
	
	
	
}
