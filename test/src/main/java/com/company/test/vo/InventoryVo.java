package com.company.test.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class InventoryVo {

	public InventoryVo(){}
	
	public InventoryVo(int il_seq,Date il_reg_date,String il_co_name,String il_item_name,String il_unit,String il_standard,
			int il_reg_amount,int il_inventory_amount,String il_etc,List<InventoryVo> detailList,
			int ide_seq,String ide_gubun,int ide_il_seq,Date ide_date,String ide_company,String ide_person,int ide_amount,
			String ide_etc,String use_yn,Date cre_date,Date mod_date,Date del_date,String del_yn)
	{
		super();
		this.il_seq= il_seq;
		this.il_reg_date = il_reg_date;
		this.il_co_name = il_co_name;
		this.il_item_name = il_item_name;
		this.il_unit = il_unit;
		this.il_standard = il_standard;
		this.il_reg_amount = il_reg_amount;
		this.il_inventory_amount = il_inventory_amount;
		this.il_etc = il_etc;

		this.ide_seq =ide_seq;
		this.ide_gubun =ide_gubun; 
		this.ide_il_seq =ide_il_seq;
		this.ide_date = ide_date;
		this.ide_company =ide_company; 
		this.ide_person = ide_person;
		this.ide_amount =ide_amount;
		this.ide_etc =ide_etc;
		
		this.use_yn=use_yn;
		this.cre_date=cre_date;
		this.mod_date=mod_date;
		this.del_date=del_date;
		this.del_yn=del_yn;
		
	}
	
	int il_seq=0;
	Date il_reg_date;
	String il_co_name="";
	String il_item_name="";
	String il_unit="";
	String il_standard ="";
	int il_reg_amount=0;
	int il_inventory_amount=0;
	String il_etc="";			
		
	String use_yn="";
	Date cre_date;
	Date mod_date;
	Date del_date;
	String del_yn="";
	
	
	int ide_seq =0;
	String ide_gubun =""; 
	int ide_il_seq =0;
	Date ide_date;
	String ide_company =""; 
	String ide_person = "";
	int ide_amount =0;
	String ide_etc ="";
	
	private List<InventoryVo> detailList;
	
	
	
	

	public List<InventoryVo> getDetailList() {
		return detailList;
	}

	public void setDetailList(List<InventoryVo> detailList) {
		this.detailList = detailList;
	}

	
	
	public int getIde_seq() {
		return ide_seq;
	}

	public void setIde_seq(int ide_seq) {
		this.ide_seq = ide_seq;
	}

	public String getIde_gubun() {
		return ide_gubun;
	}

	public void setIde_gubun(String ide_gubun) {
		this.ide_gubun = ide_gubun;
	}

	public int getIde_il_seq() {
		return ide_il_seq;
	}

	public void setIde_il_seq(int ide_il_seq) {
		this.ide_il_seq = ide_il_seq;
	}

	public Date getIde_date() {
		return ide_date;
	}

	public void setIde_date(Date ide_date) {
		this.ide_date = ide_date;
	}

	public String getIde_company() {
		return ide_company;
	}

	public void setIde_company(String ide_company) {
		this.ide_company = ide_company;
	}

	public String getIde_person() {
		return ide_person;
	}

	public void setIde_person(String ide_person) {
		this.ide_person = ide_person;
	}

	public int getIde_amount() {
		return ide_amount;
	}

	public void setIde_amount(int ide_amount) {
		this.ide_amount = ide_amount;
	}

	public String getIde_etc() {
		return ide_etc;
	}

	public void setIde_etc(String ide_etc) {
		this.ide_etc = ide_etc;
	}

	public int getIl_seq() {
		return il_seq;
	}

	public void setIl_seq(int il_seq) {
		this.il_seq = il_seq;
	}

	public Date getIl_reg_date() {
		return il_reg_date;
	}

	public void setIl_reg_date(Date il_reg_date) {
		this.il_reg_date = il_reg_date;
	}

	public String getIl_co_name() {
		return il_co_name;
	}

	public void setIl_co_name(String il_co_name) {
		this.il_co_name = il_co_name;
	}

	public String getIl_item_name() {
		return il_item_name;
	}

	public void setIl_item_name(String il_item_name) {
		this.il_item_name = il_item_name;
	}

	public String getIl_unit() {
		return il_unit;
	}

	public void setIl_unit(String il_unit) {
		this.il_unit = il_unit;
	}

	public String getIl_standard() {
		return il_standard;
	}

	public void setIl_standard(String il_standard) {
		this.il_standard = il_standard;
	}

	public int getIl_reg_amount() {
		return il_reg_amount;
	}

	public void setIl_reg_amount(int il_reg_amount) {
		this.il_reg_amount = il_reg_amount;
	}

	public int getIl_inventory_amount() {
		return il_inventory_amount;
	}

	public void setIl_inventory_amount(int il_inventory_amount) {
		this.il_inventory_amount = il_inventory_amount;
	}

	public String getIl_etc() {
		return il_etc;
	}

	public void setIl_etc(String il_etc) {
		this.il_etc = il_etc;
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
