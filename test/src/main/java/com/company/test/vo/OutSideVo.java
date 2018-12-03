package com.company.test.vo;

import java.util.Date;

public class OutSideVo {
	
	public OutSideVo(){}
	
	public OutSideVo(int oe_seq,String oe_type,String oe_name,String oe_items,String oe_address,String oe_tel,String oe_etc1,
			String oe_etc2,String oe_etc3,String oe_main,String use_yn,Date cre_date,Date mod_date,Date del_date,String del_yn,
			String pi_joil_number,String pi_name,String sc_name,String ow_group_name,String ow_group_detail_name,
			long pl_price,int pl_amount,long pl_sum,Date pl_date
			)
	{
		super();
		this.oe_seq = oe_seq;
		this.oe_type = oe_type;
		this.oe_name = oe_name;
		this.oe_items = oe_items;
		this.oe_address = oe_address;
		this.oe_tel = oe_tel;
		this.oe_etc1 = oe_etc1;
		this.oe_etc2 = oe_etc2;
		this.oe_etc3 = oe_etc3;
		this.oe_main = oe_main;
		this.use_yn = use_yn;
		this.cre_date = cre_date;
		this.mod_date = mod_date;
		this.del_date = del_date;
		this.del_yn = del_yn;
		this.pi_joil_number=pi_joil_number;
		this.pi_name=pi_name;
		this.sc_name=sc_name;
		this.ow_group_name=ow_group_name;
		this.ow_group_detail_name=ow_group_detail_name;
		this.pl_price=pl_price;
		this.pl_amount=pl_amount;
		this.pl_sum=pl_sum;
		this.pl_date=pl_date;
		
	}

	/* 업체관리 시작 */
	int oe_seq=0;
	String oe_type="";
	String oe_name="";
	String oe_items="";
	String oe_address="";
	String oe_tel="";
	String oe_etc1="";
	String oe_etc2="";
	String oe_etc3="";
	String oe_main="";
	/* 업체관리 끝 */
	
	/* 공통변수 */
	String use_yn="";
	Date cre_date;
	Date mod_date;
	Date del_date;
	String del_yn="";
	
	String pi_joil_number="";
	String pi_name="";
	String sc_name="";
	String ow_group_name="";
	String ow_group_detail_name="";
	long pl_price=0;
	int pl_amount=0;
	long pl_sum=0;
	Date pl_date;
	
	public int getoe_seq() {
		return oe_seq;
	}

	public void setoe_seq(int oe_seq) {
		this.oe_seq = oe_seq;
	}

	public String getoe_type() {
		return oe_type;
	}

	public void setoe_type(String oe_type) {
		this.oe_type = oe_type;
	}

	public String getoe_name() {
		return oe_name;
	}

	public void setoe_name(String oe_name) {
		this.oe_name = oe_name;
	}

	public String getoe_items() {
		return oe_items;
	}

	public void setoe_items(String oe_items) {
		this.oe_items = oe_items;
	}

	public String getoe_address() {
		return oe_address;
	}

	public void setoe_address(String oe_address) {
		this.oe_address = oe_address;
	}

	public String getoe_tel() {
		return oe_tel;
	}

	public void setoe_tel(String oe_tel) {
		this.oe_tel = oe_tel;
	}

	public String getoe_etc1() {
		return oe_etc1;
	}

	public void setoe_etc1(String oe_etc1) {
		this.oe_etc1 = oe_etc1;
	}

	public String getoe_etc2() {
		return oe_etc2;
	}

	public void setoe_etc2(String oe_etc2) {
		this.oe_etc2 = oe_etc2;
	}

	public String getoe_etc3() {
		return oe_etc3;
	}

	public void setoe_etc3(String oe_etc3) {
		this.oe_etc3 = oe_etc3;
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

	public String getOw_group_name() {
		return ow_group_name;
	}

	public void setOw_group_name(String ow_group_name) {
		this.ow_group_name = ow_group_name;
	}

	public String getOw_group_detail_name() {
		return ow_group_detail_name;
	}

	public void setOw_group_detail_name(String ow_group_detail_name) {
		this.ow_group_detail_name = ow_group_detail_name;
	}

	public long getPl_price() {
		return pl_price;
	}

	public void setPl_price(long pl_price) {
		this.pl_price = pl_price;
	}

	public int getPl_amount() {
		return pl_amount;
	}

	public void setPl_amount(int pl_amount) {
		this.pl_amount = pl_amount;
	}

	public long getPl_sum() {
		return pl_sum;
	}

	public void setPl_sum(long pl_sum) {
		this.pl_sum = pl_sum;
	}

	public Date getPl_date() {
		return pl_date;
	}

	public void setPl_date(Date pl_date) {
		this.pl_date = pl_date;
	}

	public String getOe_main() {
		return oe_main;
	}

	public void setOe_main(String oe_main) {
		this.oe_main = oe_main;
	}
	
	
	
		
}
