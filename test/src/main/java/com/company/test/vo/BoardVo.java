package com.company.test.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class BoardVo {

	public BoardVo(){}
	
	public BoardVo(int bl_seq,String bl_title,String bl_contents,int bl_hit,String bl_etc,List<UtilVo> filelist ,String use_yn,Date cre_date,Date mod_date,Date del_date,String del_yn)
	{
		super();
		this.bl_seq=bl_seq;
		this.bl_title=bl_title;
		this.bl_contents=bl_contents;
		this.bl_hit=bl_hit;
		this.bl_etc=bl_etc;
		this.filelist= filelist;
		this.use_yn=use_yn;
		this.cre_date=cre_date;
		this.mod_date=mod_date;
		this.del_date=del_date;
		this.del_yn=del_yn;
		
	}
	
	int bl_seq=0;	
	String bl_title="";
	String bl_contents="";
	int bl_hit=0;
	String bl_etc="";
		
	private List<UtilVo> filelist;
	
	String use_yn="";
	Date cre_date;
	Date mod_date;
	Date del_date;
	String del_yn="";
	
	
	
	public List<UtilVo> getFilelist() {
		return filelist;
	}

	public void setFilelist(List<UtilVo> filelist) {
		this.filelist = filelist;
	}

	public int getBl_seq() {
		return bl_seq;
	}

	public void setBl_seq(int bl_seq) {
		this.bl_seq = bl_seq;
	}

	public String getBl_title() {
		return bl_title;
	}

	public void setBl_title(String bl_title) {
		this.bl_title = bl_title;
	}

	public String getBl_contents() {
		return bl_contents;
	}

	public void setBl_contents(String bl_contents) {
		this.bl_contents = bl_contents;
	}

	public int getBl_hit() {
		return bl_hit;
	}

	public void setBl_hit(int bl_hit) {
		this.bl_hit = bl_hit;
	}

	public String getBl_etc() {
		return bl_etc;
	}

	public void setBl_etc(String bl_etc) {
		this.bl_etc = bl_etc;
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
