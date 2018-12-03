package com.company.test.vo;

import java.util.Date;
import java.util.List;



public class NoticeBoardVo {

	public NoticeBoardVo(){}
	
	public NoticeBoardVo(int nl_seq,String nl_writer,Date nl_date,String nl_title,String nl_contents,int nl_hit,String nl_etc,List<UtilVo> filelist ,String use_yn,Date cre_date,Date mod_date,Date del_date,String del_yn)
	{
		super();
		this.nl_seq=nl_seq;
		this.nl_title=nl_title;
		this.nl_contents=nl_contents;
		this.nl_writer=nl_writer;
		this.nl_date=nl_date;
		this.nl_hit=nl_hit;
		this.nl_etc=nl_etc;		
		this.filelist= filelist;
		this.use_yn=use_yn;
		this.cre_date=cre_date;
		this.mod_date=mod_date;
		this.del_date=del_date;
		this.del_yn=del_yn;
		
	}
	
	int nl_seq=0;	
	String nl_title="";
	String nl_contents="";
	int nl_hit=0;
	String nl_etc="";
		
	String nl_writer="";
	Date nl_date;
	
	private List<UtilVo> filelist;
	
	String use_yn="";
	Date cre_date;
	Date mod_date;
	Date del_date;
	String del_yn="";
	public int getNl_seq() {
		return nl_seq;
	}

	public void setNl_seq(int nl_seq) {
		this.nl_seq = nl_seq;
	}

	public String getNl_title() {
		return nl_title;
	}

	public void setNl_title(String nl_title) {
		this.nl_title = nl_title;
	}

	public String getNl_contents() {
		return nl_contents;
	}

	public void setNl_contents(String nl_contents) {
		this.nl_contents = nl_contents;
	}

	public int getNl_hit() {
		return nl_hit;
	}

	public void setNl_hit(int nl_hit) {
		this.nl_hit = nl_hit;
	}

	public String getNl_etc() {
		return nl_etc;
	}

	public void setNl_etc(String nl_etc) {
		this.nl_etc = nl_etc;
	}

	public String getNl_writer() {
		return nl_writer;
	}

	public void setNl_writer(String nl_writer) {
		this.nl_writer = nl_writer;
	}

	public Date getNl_date() {
		return nl_date;
	}

	public void setNl_date(Date nl_date) {
		this.nl_date = nl_date;
	}

	public List<UtilVo> getFilelist() {
		return filelist;
	}

	public void setFilelist(List<UtilVo> filelist) {
		this.filelist = filelist;
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
