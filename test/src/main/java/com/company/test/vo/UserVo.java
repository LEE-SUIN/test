package com.company.test.vo;

import java.util.Date;
import java.util.List;



import com.company.test.vo.UtilVo;

public class UserVo extends UtilVo{

	public UserVo(){}
	
	public UserVo(int su_seq,String su_name,Date su_birth,String su_address,String su_tel,String su_mobile,Date su_join_date,
			Date su_leave_date,String su_file_name,String su_file_path,String su_file_rename,String su_file_ext,String su_position,String su_rank
			,String su_job,String su_id,String su_password,String su_menu_auth,String use_yn,int su_depart,int pw_sum,List<UtilVo> filelist,
			int pw_su_seq,String pi_joil_number,String pi_name,String sc_name,String f_save_name,String f_save_path,String f_file_ext,
			String su_etc1,String su_etc2,
			Date cre_date,Date mod_date,Date del_date,String del_yn,String su_position_name,String su_rank_name)
	{
		super();
		this.su_seq = su_seq;
		this.su_name = su_name;
		this.su_birth = su_birth;
		this.su_address = su_address;
		this.su_tel = su_tel;
		this.su_mobile = su_mobile;
		this.su_join_date = su_join_date;
		this.su_leave_date = su_leave_date;
		this.su_file_name = su_file_name;
		this.su_file_path = su_file_path;
		this.su_file_ext = su_file_ext;
		this.su_depart= su_depart;
		this.su_position = su_position;
		this.su_position_name = su_position_name;
		this.su_rank = su_rank;
		this.su_rank_name = su_rank_name;
		this.su_id = su_id;
		this.su_password = su_password;
		this.su_menu_auth = su_menu_auth;
		this.use_yn = use_yn;
		this.su_file_rename = su_file_rename;
		this.pw_sum = pw_sum;
		this.pw_su_seq=pw_su_seq;
		this.pi_joil_number=pi_joil_number;
		this.pi_name=pi_name;
		this.sc_name=sc_name;
		this.f_save_path=f_save_path;
		this.f_save_name=f_save_name;
		this.f_file_ext=f_file_ext;
		this.filelist = filelist;
		this.su_etc1=su_etc1;
		this.su_etc2=su_etc2;
		this.cre_date = cre_date;
		this.mod_date = mod_date;
		this.del_date = del_date;
		this.del_yn = del_yn;
		
	}
	
	private int su_seq = 0;
	private String su_name = "";
	private Date su_birth;
	private String su_address = "";
	private String su_tel = "";
	private String su_mobile = "";
	private Date su_join_date;
	private Date su_leave_date;
	private String su_file_name = "";
	private String su_file_path = "";
	private String su_file_ext = "";
	private String su_position = "";
	private String su_position_name = "";
	private String su_rank = "";
	private String su_rank_name = "";
	private String su_job = "";
	private String su_id = "";
	private String su_password = "";
	private String su_menu_auth = "";	
	private String use_yn = "";
	private String su_file_rename="";
	private List<UtilVo> filelist;
	private int su_depart=0;
	private int pw_sum=0;
	
	private int pw_su_seq=0;
	private String pi_joil_number="";
	private String pi_name ="";
	private String sc_name="";
	
	private String f_save_path="";
	private String f_save_name="";
	private String f_file_ext="";
	
	private String su_etc1="";
	private String su_etc2="";
	
	/* 공통 부분 */
	
	
		
	private Date cre_date;
	private Date mod_date;
	private Date del_date;
	private String del_yn = "";
	
	
	public int getSu_seq() {
		return su_seq;
	}

	public void setSu_seq(int su_seq) {
		this.su_seq = su_seq;
	}

	public String getSu_name() {
		return su_name;
	}

	public void setSu_name(String su_name) {
		this.su_name = su_name;
	}

	

	public Date getSu_birth() {
		return su_birth;
	}

	public void setSu_birth(Date su_birth) {
		this.su_birth = su_birth;
	}

	public String getSu_address() {
		return su_address;
	}

	public void setSu_address(String su_address) {
		this.su_address = su_address;
	}

	public String getSu_tel() {
		return su_tel;
	}

	public void setSu_tel(String su_tel) {
		this.su_tel = su_tel;
	}

	public String getSu_mobile() {
		return su_mobile;
	}

	public void setSu_mobile(String su_mobile) {
		this.su_mobile = su_mobile;
	}

	public Date getSu_join_date() {
		return su_join_date;
	}

	public void setSu_join_date(Date su_join_date) {
		this.su_join_date = su_join_date;
	}

	public Date getSu_leave_date() {
		return su_leave_date;
	}

	public void setSu_leave_date(Date su_leave_date) {
		this.su_leave_date = su_leave_date;
	}

	public String getSu_file_name() {
		return su_file_name;
	}

	public void setSu_file_name(String su_file_name) {
		this.su_file_name = su_file_name;
	}

	public String getSu_file_path() {
		return su_file_path;
	}

	public void setSu_file_path(String su_file_path) {
		this.su_file_path = su_file_path;
	}

	public String getSu_file_ext() {
		return su_file_ext;
	}

	public void setSu_file_ext(String su_file_ext) {
		this.su_file_ext = su_file_ext;
	}

	public String getSu_position() {
		return su_position;
	}

	public void setSu_position(String su_position) {
		this.su_position = su_position;
	}

	public String getSu_rank() {
		return su_rank;
	}

	public void setSu_rank(String su_rank) {
		this.su_rank = su_rank;
	}

	public String getSu_job() {
		return su_job;
	}

	public void setSu_job(String su_job) {
		this.su_job = su_job;
	}

	public String getSu_id() {
		return su_id;
	}

	public void setSu_id(String su_id) {
		this.su_id = su_id;
	}

	public String getSu_password() {
		return su_password;
	}

	public void setSu_password(String su_password) {
		this.su_password = su_password;
	}

	public String getSu_menu_auth() {
		return su_menu_auth;
	}

	public void setSu_menu_auth(String su_menu_auth) {
		this.su_menu_auth = su_menu_auth;
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

	public String getSu_file_rename() {
		return su_file_rename;
	}

	public void setSu_file_rename(String su_file_rename) {
		this.su_file_rename = su_file_rename;
	}

	public String getSu_position_name() {
		return su_position_name;
	}

	public void setSu_position_name(String su_position_name) {
		this.su_position_name = su_position_name;
	}

	public String getSu_rank_name() {
		return su_rank_name;
	}

	public void setSu_rank_name(String su_rank_name) {
		this.su_rank_name = su_rank_name;
	}

	public int getSu_depart() {
		return su_depart;
	}

	public void setSu_depart(int su_depart) {
		this.su_depart = su_depart;
	}

	public int getPw_sum() {
		return pw_sum;
	}

	public void setPw_sum(int pw_sum) {
		this.pw_sum = pw_sum;
	}

	public int getPw_su_seq() {
		return pw_su_seq;
	}

	public void setPw_su_seq(int pw_su_seq) {
		this.pw_su_seq = pw_su_seq;
	}

	public String getPi_joil_number() {
		return pi_joil_number;
	}

	public void setPi_joil_number(String pi_joil_number) {
		this.pi_joil_number = pi_joil_number;
	}

	public String getPi_name() {
		return pi_name;
	}

	public void setPi_name(String pi_name) {
		this.pi_name = pi_name;
	}

	public String getSc_name() {
		return sc_name;
	}

	public void setSc_name(String sc_name) {
		this.sc_name = sc_name;
	}

	public String getF_save_path() {
		return f_save_path;
	}

	public void setF_save_path(String f_save_path) {
		this.f_save_path = f_save_path;
	}

	public String getF_save_name() {
		return f_save_name;
	}

	public void setF_save_name(String f_save_name) {
		this.f_save_name = f_save_name;
	}

	public String getF_file_ext() {
		return f_file_ext;
	}

	public void setF_file_ext(String f_file_ext) {
		this.f_file_ext = f_file_ext;
	}

	public List<UtilVo> getFilelist() {
		return filelist;
	}

	public void setFilelist(List<UtilVo> filelist) {
		this.filelist = filelist;
	}

	public String getSu_etc1() {
		return su_etc1;
	}

	public void setSu_etc1(String su_etc1) {
		this.su_etc1 = su_etc1;
	}

	public String getSu_etc2() {
		return su_etc2;
	}

	public void setSu_etc2(String su_etc2) {
		this.su_etc2 = su_etc2;
	}

	
	
	
	
	
	
	
	
	
}
