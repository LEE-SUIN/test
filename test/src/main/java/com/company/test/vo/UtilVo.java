package com.company.test.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.company.test.dao.UserJobDao;

public class UtilVo {

	public UtilVo(){}
	
	public UtilVo(int f_seq,int f_menu,int f_menu_detail,String f_menu_name,int f_data_seq,
			String f_ori_name,String f_save_name,String f_save_path,String f_file_ext,int f_file_size,String f_etc1,
			String use_yn,Date cre_date,Date mod_date,Date del_date,String del_yn)
	{
		super();
		this.f_seq=f_seq;
		this.f_menu=f_menu;
		this.f_menu_detail=f_menu_detail;
		this.f_menu_name=f_menu_name;
		this.f_data_seq=f_data_seq;
		this.f_ori_name=f_ori_name;
		this.f_save_name=f_save_name;
		this.f_save_path=f_save_path;
		this.f_file_ext=f_file_ext;
		this.f_file_size = f_file_size;
		this.f_etc1 = f_etc1;
		this.cre_date = cre_date;
		this.mod_date = mod_date;
		this.del_date = del_date;
		this.del_yn = del_yn;
		
	}
	
	int f_seq=0;
	int f_menu=0;
	int f_menu_detail=0;
	String f_menu_name="";
	int f_data_seq=0;
	String f_ori_name="";
	String f_save_name="";
	String f_save_path="";
	String f_file_ext="";
	int f_file_size=0;
	String f_etc1="";
	String use_yn="";
	Date cre_date;
	Date mod_date;
	Date del_date;
	String del_yn="";
	public int getF_seq() {
		return f_seq;
	}

	public void setF_seq(int f_seq) {
		this.f_seq = f_seq;
	}

	public int getF_menu() {
		return f_menu;
	}

	public void setF_menu(int f_menu) {
		this.f_menu = f_menu;
	}

	public int getF_menu_detail() {
		return f_menu_detail;
	}

	public void setF_menu_detail(int f_menu_detail) {
		this.f_menu_detail = f_menu_detail;
	}

	public String getF_menu_name() {
		return f_menu_name;
	}

	public void setF_menu_name(String f_menu_name) {
		this.f_menu_name = f_menu_name;
	}

	public int getF_data_seq() {
		return f_data_seq;
	}

	public void setF_data_seq(int f_data_seq) {
		this.f_data_seq = f_data_seq;
	}

	public String getF_ori_name() {
		return f_ori_name;
	}

	public void setF_ori_name(String f_ori_name) {
		this.f_ori_name = f_ori_name;
	}

	public String getF_save_name() {
		return f_save_name;
	}

	public void setF_save_name(String f_save_name) {
		this.f_save_name = f_save_name;
	}

	public String getF_save_path() {
		return f_save_path;
	}

	public void setF_save_path(String f_save_path) {
		this.f_save_path = f_save_path;
	}

	public String getF_file_ext() {
		return f_file_ext;
	}

	public void setF_file_ext(String f_file_ext) {
		this.f_file_ext = f_file_ext;
	}

	public int getF_file_size() {
		return f_file_size;
	}

	public void setF_file_size(int f_file_size) {
		this.f_file_size = f_file_size;
	}

	public String getF_etc1() {
		return f_etc1;
	}

	public void setF_etc1(String f_etc1) {
		this.f_etc1 = f_etc1;
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

	
	
	
	
		
}
