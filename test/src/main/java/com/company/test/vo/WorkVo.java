package com.company.test.vo;

import java.util.Date;
import org.springframework.web.multipart.MultipartFile;

public class WorkVo extends UserVo{
	
	public WorkVo(){}
	
	public WorkVo(String se_code,String se_name,int pw_seq,int pw_su_seq,int pw_su_job ,int pw_se_seq,String pw_se_group,String pw_se_group_temp,int pw_select_work,int pw_pi_seq,int pw_pi_job,int pw_pi_job_time,Date pw_work_date,String pw_work,String pw_etc1,String pw_etc2,String pw_etc3,String use_yn,Date cre_date,Date mod_date,Date del_date,String del_yn,String sc_name,String joil_number,String e_number)
	{
		super();
		this.pw_seq = pw_seq;
		this.pw_su_seq = pw_su_seq;		
		this.pw_su_job = pw_su_job;
		this.pw_se_seq = pw_se_seq;
		this.pw_se_group = pw_se_group;
		this.pw_se_group_temp = pw_se_group_temp;
		this.pw_select_work = pw_select_work;
		this.pw_pi_seq = pw_pi_seq;
		this.pw_pi_job = pw_pi_job;
		this.pw_pi_job_time = pw_pi_job_time;
		this.pw_work_date = pw_work_date;
		this.pw_work = pw_work;
		this.pw_etc1 = pw_etc1;
		this.pw_etc2 = pw_etc2;
		this.pw_etc3 = pw_etc3;
		this.use_yn = use_yn;
		this.cre_date = cre_date;
		this.mod_date = mod_date;
		this.del_date = del_date;
		this.del_yn = del_yn;
		this.sc_name = sc_name;
		this.joil_number = joil_number;
		this.e_number = e_number;
	}
	
	int pw_seq=0;
	int pw_su_seq=0;
	int pw_su_job =0;
	int pw_se_seq=0;
	String pw_se_group="";
	String pw_se_group_temp="";	
	int pw_select_work=0;
	int pw_pi_seq=0;
	int pw_pi_job=0;
	int pw_pi_job_time=0;
	Date pw_work_date;
	String pw_work="";
	String pw_etc1="";
	String pw_etc2="";
	String pw_etc3="";
	String use_yn="";
	Date cre_date;
	Date mod_date;
	Date del_date;
	String del_yn="";
	String sc_name ="";
	String joil_number="";
	String e_number="";
	
	String se_code="";
	String se_name="";
	
	/* 통계 변수 */
	int sum_37=0; //설계
	int sum_27=0; //선반
	int sum_28=0; //밀링
	int sum_30=0; //MCT 
	int sum_31=0; //연마
	int sum_34=0; //기타가공
	int sum_35=0; //조립
	int sum_42=0; //레디알
	
	
	
	public int getPw_seq() {
		return pw_seq;
	}

	public void setPw_seq(int pw_seq) {
		this.pw_seq = pw_seq;
	}

	public int getPw_su_seq() {
		return pw_su_seq;
	}

	public void setPw_su_seq(int pw_su_seq) {
		this.pw_su_seq = pw_su_seq;
	}

	

	public int getPw_se_seq() {
		return pw_se_seq;
	}

	public void setPw_se_seq(int pw_se_seq) {
		this.pw_se_seq = pw_se_seq;
	}

	public String getPw_se_group() {
		return pw_se_group;
	}

	public void setPw_se_group(String pw_se_group) {
		this.pw_se_group = pw_se_group;
	}

	public String getPw_se_group_temp() {
		return pw_se_group_temp;
	}

	public void setPw_se_group_temp(String pw_se_group_temp) {
		this.pw_se_group_temp = pw_se_group_temp;
	}

	

	public int getPw_pi_seq() {
		return pw_pi_seq;
	}

	public void setPw_pi_seq(int pw_pi_seq) {
		this.pw_pi_seq = pw_pi_seq;
	}

	

	public int getPw_pi_job_time() {
		return pw_pi_job_time;
	}

	public void setPw_pi_job_time(int pw_pi_job_time) {
		this.pw_pi_job_time = pw_pi_job_time;
	}

	public Date getPw_work_date() {
		return pw_work_date;
	}

	public void setPw_work_date(Date pw_work_date) {
		this.pw_work_date = pw_work_date;
	}

	

	public String getPw_etc1() {
		return pw_etc1;
	}

	public void setPw_etc1(String pw_etc1) {
		this.pw_etc1 = pw_etc1;
	}

	public String getPw_etc2() {
		return pw_etc2;
	}

	public void setPw_etc2(String pw_etc2) {
		this.pw_etc2 = pw_etc2;
	}

	public String getPw_etc3() {
		return pw_etc3;
	}

	public void setPw_etc3(String pw_etc3) {
		this.pw_etc3 = pw_etc3;
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

	public String getSc_name() {
		return sc_name;
	}

	public void setSc_name(String sc_name) {
		this.sc_name = sc_name;
	}

	public int getPw_select_work() {
		return pw_select_work;
	}

	public void setPw_select_work(int pw_select_work) {
		this.pw_select_work = pw_select_work;
	}

	public int getPw_su_job() {
		return pw_su_job;
	}

	public void setPw_su_job(int pw_su_job) {
		this.pw_su_job = pw_su_job;
	}

	public int getPw_pi_job() {
		return pw_pi_job;
	}

	public void setPw_pi_job(int pw_pi_job) {
		this.pw_pi_job = pw_pi_job;
	}

	public String getPw_work() {
		return pw_work;
	}

	public void setPw_work(String pw_work) {
		this.pw_work = pw_work;
	}

	public String getJoil_number() {
		return joil_number;
	}

	public void setJoil_number(String joil_number) {
		this.joil_number = joil_number;
	}

	public String getE_number() {
		return e_number;
	}

	public void setE_number(String e_number) {
		this.e_number = e_number;
	}

	public int getSum_37() {
		return sum_37;
	}

	public void setSum_37(int sum_37) {
		this.sum_37 = sum_37;
	}

	public int getSum_27() {
		return sum_27;
	}

	public void setSum_27(int sum_27) {
		this.sum_27 = sum_27;
	}

	public int getSum_28() {
		return sum_28;
	}

	public void setSum_28(int sum_28) {
		this.sum_28 = sum_28;
	}

	public int getSum_30() {
		return sum_30;
	}

	public void setSum_30(int sum_30) {
		this.sum_30 = sum_30;
	}

	public int getSum_31() {
		return sum_31;
	}

	public void setSum_31(int sum_31) {
		this.sum_31 = sum_31;
	}

	public int getSum_34() {
		return sum_34;
	}

	public void setSum_34(int sum_34) {
		this.sum_34 = sum_34;
	}

	public int getSum_35() {
		return sum_35;
	}

	public void setSum_35(int sum_35) {
		this.sum_35 = sum_35;
	}

	public int getSum_42() {
		return sum_42;
	}

	public void setSum_42(int sum_42) {
		this.sum_42 = sum_42;
	}

	public String getSe_code() {
		return se_code;
	}

	public void setSe_code(String se_code) {
		this.se_code = se_code;
	}

	public String getSe_name() {
		return se_name;
	}

	public void setSe_name(String se_name) {
		this.se_name = se_name;
	}

	
	
	
}
