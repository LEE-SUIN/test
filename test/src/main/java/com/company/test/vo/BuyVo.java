package com.company.test.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class BuyVo {

	public BuyVo(){}
	
	public BuyVo(int ab_seq,int ab_e_seq,String ab_buy_name,long ab_price,long ab_amount,long ab_sum,long ab_sum_vat,String ab_e_name,String ab_e_group_name
			,String abe_name,String abe_main,int row_count,Date ab_date,String use_yn,Date cre_date,Date mod_date,Date del_date,String del_yn)
	{
		super();
		this.ab_seq=ab_seq;
		this.ab_e_seq=ab_e_seq;
		this.ab_buy_name=ab_buy_name;
		this.ab_price=ab_price;
		this.ab_amount=ab_amount;
		this.ab_sum=ab_sum;
		this.ab_sum_vat=ab_sum_vat;
		this.ab_date=ab_date;
		this.ab_e_name=ab_e_name;
		this.ab_e_group_name=ab_e_group_name;
		this.row_count=row_count;
		this.abe_name=abe_name;
		this.abe_main=abe_main;
		this.use_yn=use_yn;
		this.cre_date=cre_date;
		this.mod_date=mod_date;
		this.del_date=del_date;
		this.del_yn=del_yn;
		
	}
	
	int ab_seq=0;
	int ab_e_seq=0;
	String ab_e_name="";
	String ab_e_group_name="";
	String ab_buy_name="";
	long ab_price = 0;
	long ab_amount = 0;
	long ab_sum = 0;
	long ab_sum_vat = 0;
	Date ab_date;
		
	String use_yn="";
	Date cre_date;
	Date mod_date;
	Date del_date;
	String del_yn="";
	
	int row_count=0;
	String abe_name="";
	String abe_main="";
	
	
	
	
	
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

	public int getAb_seq() {
		return ab_seq;
	}

	public void setAb_seq(int ab_seq) {
		this.ab_seq = ab_seq;
	}

	public int getAb_e_seq() {
		return ab_e_seq;
	}

	public void setAb_e_seq(int ab_e_seq) {
		this.ab_e_seq = ab_e_seq;
	}

	public String getAb_buy_name() {
		return ab_buy_name;
	}

	public void setAb_buy_name(String ab_buy_name) {
		this.ab_buy_name = ab_buy_name;
	}

	public long getAb_price() {
		return ab_price;
	}

	public void setAb_price(long ab_price) {
		this.ab_price = ab_price;
	}

	public long getAb_amount() {
		return ab_amount;
	}

	public void setAb_amount(long ab_amount) {
		this.ab_amount = ab_amount;
	}

	public long getAb_sum() {
		return ab_sum;
	}

	public void setAb_sum(long ab_sum) {
		this.ab_sum = ab_sum;
	}

	public Date getAb_date() {
		return ab_date;
	}

	public void setAb_date(Date ab_date) {
		this.ab_date = ab_date;
	}

	public long getAb_sum_vat() {
		return ab_sum_vat;
	}

	public void setAb_sum_vat(long ab_sum_vat) {
		this.ab_sum_vat = ab_sum_vat;
	}

	public String getAb_e_name() {
		return ab_e_name;
	}

	public void setAb_e_name(String ab_e_name) {
		this.ab_e_name = ab_e_name;
	}

	public String getAb_e_group_name() {
		return ab_e_group_name;
	}

	public void setAb_e_group_name(String ab_e_group_name) {
		this.ab_e_group_name = ab_e_group_name;
	}

	public int getRow_count() {
		return row_count;
	}

	public void setRow_count(int row_count) {
		this.row_count = row_count;
	}

	public String getAbe_name() {
		return abe_name;
	}

	public void setAbe_name(String abe_name) {
		this.abe_name = abe_name;
	}

	public String getAbe_main() {
		return abe_main;
	}

	public void setAbe_main(String abe_main) {
		this.abe_main = abe_main;
	}
	
	
	
	
	
}
