package com.company.test.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class BuyManageVo {

	public BuyManageVo(){}
	
	public BuyManageVo(int abe_seq,String abe_name,String abe_owner,String abe_co_number,String abe_tel,String abe_address,
	int abe_group,String abe_main, String use_yn,Date cre_date,Date mod_date,Date del_date,String del_yn)
	{
		super();
		this.abe_name  = abe_name;
		this.abe_owner =abe_owner;
		this.abe_co_number =abe_co_number;
		this.abe_tel=abe_tel;
		this.abe_address= abe_address;
		this.abe_group=abe_group;
		this.abe_main=abe_main;
		this.use_yn=use_yn;
		this.cre_date=cre_date;
		this.mod_date=mod_date;
		this.del_date=del_date;
		this.del_yn=del_yn;
		
	}
	
	
	int abe_seq=0;
	String abe_name = ""; 
	String abe_owner = ""; 
	String abe_co_number= ""; 
	String abe_tel = "";
	String abe_address=""; 
	int abe_group=0;
	String abe_main="";
	
	String use_yn="";
	Date cre_date;
	Date mod_date;
	Date del_date;
	String del_yn="";
	
	
	
	
	public int getAbe_seq() {
		return abe_seq;
	}

	public void setAbe_seq(int abe_seq) {
		this.abe_seq = abe_seq;
	}

	public String getAbe_name() {
		return abe_name;
	}

	public void setAbe_name(String abe_name) {
		this.abe_name = abe_name;
	}

	public String getAbe_owner() {
		return abe_owner;
	}

	public void setAbe_owner(String abe_owner) {
		this.abe_owner = abe_owner;
	}

	public String getAbe_co_number() {
		return abe_co_number;
	}

	public void setAbe_co_number(String abe_co_number) {
		this.abe_co_number = abe_co_number;
	}

	public String getAbe_tel() {
		return abe_tel;
	}

	public void setAbe_tel(String abe_tel) {
		this.abe_tel = abe_tel;
	}

	public String getAbe_address() {
		return abe_address;
	}

	public void setAbe_address(String abe_address) {
		this.abe_address = abe_address;
	}

	public int getAbe_group() {
		return abe_group;
	}

	public void setAbe_group(int abe_group) {
		this.abe_group = abe_group;
	}

	public String getUse_yn() {
		return use_yn;
	}

	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}

	public Date getCre_date() {
		return cre_date;
	}

	public void setCre_date(Date cre_date) {
		this.cre_date = cre_date;
	}

	public Date getMod_date() {
		return mod_date;
	}

	public void setMod_date(Date mod_date) {
		this.mod_date = mod_date;
	}

	public Date getDel_date() {
		return del_date;
	}

	public void setDel_date(Date del_date) {
		this.del_date = del_date;
	}

	public String getDel_yn() {
		return del_yn;
	}

	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}

	public String getAbe_main() {
		return abe_main;
	}

	public void setAbe_main(String abe_main) {
		this.abe_main = abe_main;
	}
	
	
	
	
	
	
}
