package com.company.test.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class EnterpriseVo {

	public EnterpriseVo(){}
	
	public EnterpriseVo(int se_seq,String se_name,String se_group,String se_code,String se_owner,String se_address,String se_conumber,String se_tel,String se_man,String se_mannumber,String use_yn,Date cre_date,Date mod_date,Date del_date,String del_yn)
	{
		super();
		this.se_seq = se_seq;
		this.se_name = se_name;
		this.se_group = se_group;
		this.se_code = se_code;
		this.se_owner = se_owner;
		this.se_address = se_address;
		this.se_conumber = se_conumber;
		this.se_tel = se_tel;
		this.se_man = se_man;
		this.se_mannumber =  se_mannumber;
		this.use_yn  = use_yn;
		this.cre_date = cre_date;
		this.mod_date = mod_date;
		this.del_date = del_date;
		this.del_yn = del_yn;
	}
	
	public int se_seq =0;
	public String se_name ="";
	public String se_group ="";
	public String se_code ="";
	public String se_owner ="";
	public String se_address ="";
	public String se_conumber ="";
	public String se_tel ="";
	public String se_man ="";
	public String se_mannumber =""; 
	public String use_yn =""; 
	public Date cre_date;
	public Date mod_date;
	public Date del_date;
	public String del_yn ="";
	public int getSe_seq() {
		return se_seq;
	}

	public void setSe_seq(int se_seq) {
		this.se_seq = se_seq;
	}

	public String getSe_name() {
		return se_name;
	}

	public void setSe_name(String se_name) {
		this.se_name = se_name;
	}

	public String getSe_code() {
		return se_code;
	}

	public void setSe_code(String se_code) {
		this.se_code = se_code;
	}

	public String getSe_owner() {
		return se_owner;
	}

	public void setSe_owner(String se_owner) {
		this.se_owner = se_owner;
	}

	public String getSe_address() {
		return se_address;
	}

	public void setSe_address(String se_address) {
		this.se_address = se_address;
	}

	public String getSe_conumber() {
		return se_conumber;
	}

	public void setSe_conumber(String se_conumber) {
		this.se_conumber = se_conumber;
	}

	public String getSe_tel() {
		return se_tel;
	}

	public void setSe_tel(String se_tel) {
		this.se_tel = se_tel;
	}

	public String getSe_man() {
		return se_man;
	}

	public void setSe_man(String se_man) {
		this.se_man = se_man;
	}

	public String getSe_mannumber() {
		return se_mannumber;
	}

	public void setSe_mannumber(String se_mannumber) {
		this.se_mannumber = se_mannumber;
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

	public String getSe_group() {
		return se_group;
	}

	public void setSe_group(String se_group) {
		this.se_group = se_group;
	} 
	

	
	
	
	
	
	
	
	
	
}
