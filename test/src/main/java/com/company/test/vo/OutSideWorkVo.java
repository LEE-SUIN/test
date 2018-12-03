package com.company.test.vo;

import java.util.Date;
import org.springframework.web.multipart.MultipartFile;

public class OutSideWorkVo {
	
	public OutSideWorkVo(){}
	
	public OutSideWorkVo(int ow_seq,int ow_sc_seq,String ow_no,String ow_name,String ow_pl_name,String ow_group,String ow_etc1,String ow_etc2,String ow_etc3,
			String use_yn,Date cre_date,Date mod_date,Date del_date,String del_yn,String ow_sc_seq_name,String ow_group_name)
	{
		super();
		this.ow_seq=ow_seq;
		this.ow_sc_seq=ow_sc_seq;
		this.ow_no=ow_no;
		this.ow_name=ow_name;
		this.ow_pl_name=ow_pl_name;
		this.ow_group=ow_group;
		this.ow_etc1=ow_etc1;
		this.ow_etc2=ow_etc2;
		this.ow_etc3=ow_etc3;		
		this.ow_sc_seq_name=ow_sc_seq_name;
		this.ow_group_name=ow_group_name;
		this.use_yn = use_yn;
		this.cre_date = cre_date;
		this.mod_date = mod_date;
		this.del_date = del_date;
		this.del_yn = del_yn;
		
	}
	
	
	int ow_seq=0;
	int ow_sc_seq=0;
	String ow_no="";
	String ow_name="";
	String ow_pl_name="";
	String ow_group="";
	String ow_etc1="";
	String ow_etc2="";
	String ow_etc3="";
	String use_yn="";
	String ow_sc_seq_name="";
	String ow_group_name="";
	
	Date cre_date;
	Date mod_date;
	Date del_date;
	String del_yn="";
	public int getOw_seq() {
		return ow_seq;
	}

	public void setOw_seq(int ow_seq) {
		this.ow_seq = ow_seq;
	}

	public int getOw_sc_seq() {
		return ow_sc_seq;
	}

	public void setOw_sc_seq(int ow_sc_seq) {
		this.ow_sc_seq = ow_sc_seq;
	}

	public String getOw_no() {
		return ow_no;
	}

	public void setOw_no(String ow_no) {
		this.ow_no = ow_no;
	}

	public String getOw_name() {
		return ow_name;
	}

	public void setOw_name(String ow_name) {
		this.ow_name = ow_name;
	}

	public String getOw_pl_name() {
		return ow_pl_name;
	}

	public void setOw_pl_name(String ow_pl_name) {
		this.ow_pl_name = ow_pl_name;
	}

	public String getOw_group() {
		return ow_group;
	}

	public void setOw_group(String ow_group) {
		this.ow_group = ow_group;
	}

	public String getOw_etc1() {
		return ow_etc1;
	}

	public void setOw_etc1(String ow_etc1) {
		this.ow_etc1 = ow_etc1;
	}

	public String getOw_etc2() {
		return ow_etc2;
	}

	public void setOw_etc2(String ow_etc2) {
		this.ow_etc2 = ow_etc2;
	}

	public String getOw_etc3() {
		return ow_etc3;
	}

	public void setOw_etc3(String ow_etc3) {
		this.ow_etc3 = ow_etc3;
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

	public String getOw_sc_seq_name() {
		return ow_sc_seq_name;
	}

	public void setOw_sc_seq_name(String ow_sc_seq_name) {
		this.ow_sc_seq_name = ow_sc_seq_name;
	}

	public String getOw_group_name() {
		return ow_group_name;
	}

	public void setOw_group_name(String ow_group_name) {
		this.ow_group_name = ow_group_name;
	}

	
	
	
	
	
	
}
