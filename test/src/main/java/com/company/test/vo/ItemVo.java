package com.company.test.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ItemVo {

	public ItemVo(){}
	
	public ItemVo(int pi_seq,int pi_e_seq,String pi_e_name,String pi_group,String pi_group_temp,String pi_e_code,int pi_process,String pi_joil_number,String pi_e_number,String pi_name,long pi_dis_price,
			List<UtilVo> filelist,long pi_ma_price,long pi_order_price,Date pi_order_date,String pi_progress,int pi_percent,String pi_progress_money,String pi_man,String pi_etc1,
			String pi_etc2,String pi_etc3,String pi_whole_number,String use_yn,Date cre_date,Date mod_date,Date del_date,String del_yn)
	{
		super();
		this.pi_seq = pi_seq;
		this.pi_e_seq = pi_e_seq;
		this.pi_e_name = pi_e_name;
		this.pi_group= pi_group;
		this.pi_group_temp= pi_group_temp;
		this.pi_e_code= pi_e_code;
		this.pi_process = pi_process;		
		this.pi_joil_number= pi_joil_number;
		this.pi_e_number= pi_e_number;
		this.pi_name= pi_name;
		this.pi_dis_price= pi_dis_price;
		this.pi_ma_price= pi_ma_price;
		this.pi_order_price= pi_order_price;
		this.pi_order_date= pi_order_date;
		this.pi_progress=pi_progress;
		this.pi_percent= pi_percent;
		this.pi_progress_money = pi_progress_money;
		this.pi_man=pi_man;
		this.pi_etc1=pi_etc1;
		this.pi_etc2=pi_etc2;
		this.pi_etc3=pi_etc3;
		this.pi_whole_number = pi_whole_number;
		this.filelist= filelist;
		this.use_yn=use_yn;
		this.cre_date=cre_date;
		this.mod_date=mod_date;
		this.del_date=del_date;
		this.del_yn=del_yn;
		
	}
	
	int pi_seq=0;
	int pi_e_seq=0;
	String pi_whole_number="";	
	String pi_e_name="";
	String pi_group="";
	String pi_group_temp="";
	String pi_e_code="";
	int pi_process=0;
	String pi_joil_number="";
	String pi_e_number="";
	String pi_name="";
	long pi_dis_price=0;
	long pi_ma_price=0;
	long pi_order_price=0;
	Date pi_order_date;
	String pi_progress="";
	int pi_percent=0;
	String pi_progress_money="";
	String pi_man="";
	String pi_etc1="";
	String pi_etc2="";
	String pi_etc3="";
		
	private List<UtilVo> filelist;
	
	String use_yn="";
	Date cre_date;
	Date mod_date;
	Date del_date;
	String del_yn="";
	public int getPi_seq() {
		return pi_seq;
	}

	public void setPi_seq(int pi_seq) {
		this.pi_seq = pi_seq;
	}

	public int getPi_e_seq() {
		return pi_e_seq;
	}

	public void setPi_e_seq(int pi_e_seq) {
		this.pi_e_seq = pi_e_seq;
	}

	public String getPi_group() {
		return pi_group;
	}

	public void setPi_group(String pi_group) {
		this.pi_group = pi_group;
	}

	public String getPi_e_code() {
		return pi_e_code;
	}

	public void setPi_e_code(String pi_e_code) {
		this.pi_e_code = pi_e_code;
	}

	public String getPi_joil_number() {
		return pi_joil_number;
	}

	public void setPi_joil_number(String pi_joil_number) {
		this.pi_joil_number = pi_joil_number;
	}

	public String getPi_e_number() {
		return pi_e_number;
	}

	public void setPi_e_number(String pi_e_number) {
		this.pi_e_number = pi_e_number;
	}

	public String getPi_name() {
		return pi_name;
	}

	public void setPi_name(String pi_name) {
		this.pi_name = pi_name;
	}

	public long getPi_dis_price() {
		return pi_dis_price;
	}

	public void setPi_dis_price(long pi_dis_price) {
		this.pi_dis_price = pi_dis_price;
	}

	public long getPi_ma_price() {
		return pi_ma_price;
	}

	public void setPi_ma_price(long pi_ma_price) {
		this.pi_ma_price = pi_ma_price;
	}

	public long getPi_order_price() {
		return pi_order_price;
	}

	public void setPi_order_price(long pi_order_price) {
		this.pi_order_price = pi_order_price;
	}

	public Date getPi_order_date() {
		return pi_order_date;
	}

	public void setPi_order_date(Date pi_order_date) {
		this.pi_order_date = pi_order_date;
	}

	public String getPi_progress() {
		return pi_progress;
	}

	public void setPi_progress(String pi_progress) {
		this.pi_progress = pi_progress;
	}

	public int getPi_percent() {
		return pi_percent;
	}

	public void setPi_percent(int pi_percent) {
		this.pi_percent = pi_percent;
	}

	public String getPi_man() {
		return pi_man;
	}

	public void setPi_man(String pi_man) {
		this.pi_man = pi_man;
	}

	public String getPi_etc1() {
		return pi_etc1;
	}

	public void setPi_etc1(String pi_etc1) {
		this.pi_etc1 = pi_etc1;
	}

	public String getPi_etc2() {
		return pi_etc2;
	}

	public void setPi_etc2(String pi_etc2) {
		this.pi_etc2 = pi_etc2;
	}

	public String getPi_etc3() {
		return pi_etc3;
	}

	public void setPi_etc3(String pi_etc3) {
		this.pi_etc3 = pi_etc3;
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

	public String getPi_e_name() {
		return pi_e_name;
	}

	public void setPi_e_name(String pi_e_name) {
		this.pi_e_name = pi_e_name;
	}

	public String getPi_group_temp() {
		return pi_group_temp;
	}

	public void setPi_group_temp(String pi_group_temp) {
		this.pi_group_temp = pi_group_temp;
	}

	public String getPi_whole_number() {
		return pi_whole_number;
	}

	public void setPi_whole_number(String pi_whole_number) {
		this.pi_whole_number = pi_whole_number;
	}

	public int getPi_process() {
		return pi_process;
	}

	public void setPi_process(int pi_process) {
		this.pi_process = pi_process;
	}

	public String getPi_progress_money() {
		return pi_progress_money;
	}

	public void setPi_progress_money(String pi_progress_money) {
		this.pi_progress_money = pi_progress_money;
	}

	public List<UtilVo> getFilelist() {
		return filelist;
	}

	public void setFilelist(List<UtilVo> filelist) {
		this.filelist = filelist;
	}

	
	
	
	
	
	
	
	
}
