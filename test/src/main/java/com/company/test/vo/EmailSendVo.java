package com.company.test.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class EmailSendVo {

	public EmailSendVo(){}
	
	public EmailSendVo(int el_seq,int el_name_seq,String el_name,String el_email,int el_year,int el_give_1 ,int el_give_2,int el_give_3,int el_give_4,int el_give_5
			,int el_deduct_1,int el_deduct_2,int el_deduct_3,int el_deduct_4,int el_deduct_5
			,int el_give_6 ,int el_give_7,int el_give_8,int el_give_9,int el_give_10,int el_give_sum,int el_bonus
			,int el_deduct_6,int el_deduct_7,int el_deduct_8,int el_deduct_9,int el_deduct_sum,String el_grade,String el_depart
			,int ec_seq,String ec_group,String ec_text,int ec_order,String ec_title,String el_department
			,int el_bonus_1,int el_bonus_2,int el_bonus_percent
			,String use_yn,Date cre_date,Date mod_date,Date del_date,String del_yn)
	{
		super();
		this.el_seq=el_seq;
		this.el_name_seq=el_name_seq;
		this.el_name=el_name;
		this.el_email=el_email;
		this.el_year=el_year;
		this.el_give_1=el_give_1;
		this.el_give_2=el_give_2;
		this.el_give_3=el_give_3;
		this.el_give_4=el_give_4;
		this.el_give_5=el_give_5;
		this.el_give_6=el_give_6;
		this.el_give_7=el_give_7;
		this.el_give_8=el_give_8;
		this.el_give_9=el_give_9;
		this.el_give_10=el_give_10;
		this.el_give_sum=el_give_sum;
		this.el_deduct_1=el_deduct_1;
		this.el_deduct_2=el_deduct_2;
		this.el_deduct_3=el_deduct_3;
		this.el_deduct_4=el_deduct_4;
		this.el_deduct_5=el_deduct_5;
		this.el_deduct_6=el_deduct_6;
		this.el_deduct_7=el_deduct_7;
		this.el_deduct_8=el_deduct_8;
		this.el_deduct_9=el_deduct_9;
		this.el_deduct_sum=el_deduct_sum;
		this.el_grade=el_grade;
		this.el_depart=el_depart;
		this.ec_title = ec_title;
		this.el_department=el_department;
		this.ec_seq=ec_seq;
		this.ec_group=ec_group;
		this.ec_text=ec_text;
		this.ec_order=ec_order;
		this.el_bonus=el_bonus;
		this.el_bonus_1=el_bonus_1;
		this.el_bonus_2=el_bonus_2;
		this.el_bonus_percent=el_bonus_percent;
		this.use_yn=use_yn;
		this.cre_date=cre_date;
		this.mod_date=mod_date;
		this.del_date=del_date;
		this.del_yn=del_yn;
		
	}
	String el_depart="";
	int el_seq=0;
	int el_name_seq=0;
	String el_name="";
	String el_email="";
	String el_grade=""; //직책
	int el_year=0;
	int el_give_1=0;
	int el_give_2=0;
	int el_give_3=0;
	int el_give_4=0;
	int el_give_5=0;
	int el_give_6=0;
	int el_give_7=0;
	int el_give_8=0;
	int el_give_9=0;
	int el_give_10=0;
	int el_give_sum=0;
	int el_deduct_1=0;
	int el_deduct_2=0;
	int el_deduct_3=0;
	int el_deduct_4=0;
	int el_deduct_5=0;
	int el_deduct_6=0;
	int el_deduct_7=0;
	int el_deduct_8=0;
	int el_deduct_9=0;
	int el_deduct_sum=0;
	int el_bonus=0;
	int el_bonus_1=0;
	int el_bonus_2=0;
	int el_bonus_percent=0;
	
	
	String ec_title="";
	String el_department="";
	
	/* 코드 관리 */
	int ec_seq=0;
	String ec_group="";
	String ec_text="";
	int ec_order=0;
	
	String use_yn="";
	Date cre_date;
	Date mod_date;
	Date del_date;
	String del_yn="";
	
	
	
	public int getEl_give_10() {
		return el_give_10;
	}

	public void setEl_give_10(int el_give_10) {
		this.el_give_10 = el_give_10;
	}

	public int getEl_bonus_1() {
		return el_bonus_1;
	}

	public void setEl_bonus_1(int el_bonus_1) {
		this.el_bonus_1 = el_bonus_1;
	}

	public int getEl_bonus_2() {
		return el_bonus_2;
	}

	public void setEl_bonus_2(int el_bonus_2) {
		this.el_bonus_2 = el_bonus_2;
	}

	public int getEl_bonus_percent() {
		return el_bonus_percent;
	}

	public void setEl_bonus_percent(int el_bonus_percent) {
		this.el_bonus_percent = el_bonus_percent;
	}

	public int getEl_bonus() {
		return el_bonus;
	}

	public void setEl_bonus(int el_bonus) {
		this.el_bonus = el_bonus;
	}

	public String getEc_title() {
		return ec_title;
	}

	public void setEc_title(String ec_title) {
		this.ec_title = ec_title;
	}

	public String getEl_department() {
		return el_department;
	}

	public void setEl_department(String el_department) {
		this.el_department = el_department;
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

	public int getEl_seq() {
		return el_seq;
	}

	public void setEl_seq(int el_seq) {
		this.el_seq = el_seq;
	}

	public String getEl_name() {
		return el_name;
	}

	public void setEl_name(String el_name) {
		this.el_name = el_name;
	}

	public String getEl_email() {
		return el_email;
	}

	public void setEl_email(String el_email) {
		this.el_email = el_email;
	}

	public int getEl_year() {
		return el_year;
	}

	public void setEl_year(int el_year) {
		this.el_year = el_year;
	}

	public int getEl_give_1() {
		return el_give_1;
	}

	public void setEl_give_1(int el_give_1) {
		this.el_give_1 = el_give_1;
	}

	public int getEl_give_2() {
		return el_give_2;
	}

	public void setEl_give_2(int el_give_2) {
		this.el_give_2 = el_give_2;
	}

	public int getEl_give_3() {
		return el_give_3;
	}

	public void setEl_give_3(int el_give_3) {
		this.el_give_3 = el_give_3;
	}

	public int getEl_give_4() {
		return el_give_4;
	}

	public void setEl_give_4(int el_give_4) {
		this.el_give_4 = el_give_4;
	}

	public int getEl_give_5() {
		return el_give_5;
	}

	public void setEl_give_5(int el_give_5) {
		this.el_give_5 = el_give_5;
	}

	public int getEl_deduct_1() {
		return el_deduct_1;
	}

	public void setEl_deduct_1(int el_deduct_1) {
		this.el_deduct_1 = el_deduct_1;
	}

	public int getEl_deduct_2() {
		return el_deduct_2;
	}

	public void setEl_deduct_2(int el_deduct_2) {
		this.el_deduct_2 = el_deduct_2;
	}

	public int getEl_deduct_3() {
		return el_deduct_3;
	}

	public void setEl_deduct_3(int el_deduct_3) {
		this.el_deduct_3 = el_deduct_3;
	}

	public int getEl_deduct_4() {
		return el_deduct_4;
	}

	public void setEl_deduct_4(int el_deduct_4) {
		this.el_deduct_4 = el_deduct_4;
	}

	public int getEl_deduct_5() {
		return el_deduct_5;
	}

	public void setEl_deduct_5(int el_deduct_5) {
		this.el_deduct_5 = el_deduct_5;
	}

	public int getEl_name_seq() {
		return el_name_seq;
	}

	public void setEl_name_seq(int el_name_seq) {
		this.el_name_seq = el_name_seq;
	}

	public String getEl_grade() {
		return el_grade;
	}

	public void setEl_grade(String el_grade) {
		this.el_grade = el_grade;
	}

	public int getEl_give_6() {
		return el_give_6;
	}

	public void setEl_give_6(int el_give_6) {
		this.el_give_6 = el_give_6;
	}

	public int getEl_give_7() {
		return el_give_7;
	}

	public void setEl_give_7(int el_give_7) {
		this.el_give_7 = el_give_7;
	}

	public int getEl_give_8() {
		return el_give_8;
	}

	public void setEl_give_8(int el_give_8) {
		this.el_give_8 = el_give_8;
	}

	public int getEl_give_9() {
		return el_give_9;
	}

	public void setEl_give_9(int el_give_9) {
		this.el_give_9 = el_give_9;
	}

	public int getEl_give_sum() {
		return el_give_sum;
	}

	public void setEl_give_sum(int el_give_sum) {
		this.el_give_sum = el_give_sum;
	}

	public int getEl_deduct_6() {
		return el_deduct_6;
	}

	public void setEl_deduct_6(int el_deduct_6) {
		this.el_deduct_6 = el_deduct_6;
	}

	public int getEl_deduct_7() {
		return el_deduct_7;
	}

	public void setEl_deduct_7(int el_deduct_7) {
		this.el_deduct_7 = el_deduct_7;
	}

	public int getEl_deduct_8() {
		return el_deduct_8;
	}

	public void setEl_deduct_8(int el_deduct_8) {
		this.el_deduct_8 = el_deduct_8;
	}

	public int getEl_deduct_9() {
		return el_deduct_9;
	}

	public void setEl_deduct_9(int el_deduct_9) {
		this.el_deduct_9 = el_deduct_9;
	}

	public int getEl_deduct_sum() {
		return el_deduct_sum;
	}

	public void setEl_deduct_sum(int el_deduct_sum) {
		this.el_deduct_sum = el_deduct_sum;
	}

	public String getEl_depart() {
		return el_depart;
	}

	public void setEl_depart(String el_depart) {
		this.el_depart = el_depart;
	}

	public int getEc_seq() {
		return ec_seq;
	}

	public void setEc_seq(int ec_seq) {
		this.ec_seq = ec_seq;
	}

	public String getEc_group() {
		return ec_group;
	}

	public void setEc_group(String ec_group) {
		this.ec_group = ec_group;
	}

	public String getEc_text() {
		return ec_text;
	}

	public void setEc_text(String ec_text) {
		this.ec_text = ec_text;
	}

	public int getEc_order() {
		return ec_order;
	}

	public void setEc_order(int ec_order) {
		this.ec_order = ec_order;
	}
	
	
	
	
	
	
	
}
