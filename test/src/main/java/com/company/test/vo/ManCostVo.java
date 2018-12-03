package com.company.test.vo;

import java.util.Date;
import org.springframework.web.multipart.MultipartFile;

public class ManCostVo {
	
	public ManCostVo(){}
	
	public ManCostVo(int mc_work_seq,long mc_cost_37,long mc_cost_27,long mc_cost_28,long mc_cost_31,long mc_cost_30,long mc_cost_35,long mc_cost_34,long mc_cost_42)
	{
		super();
		this.mc_work_seq = mc_work_seq;
		this.mc_cost_37 = mc_cost_37;
		this.mc_cost_27 = mc_cost_27;
		this.mc_cost_28 = mc_cost_28;
		this.mc_cost_31 = mc_cost_31;
		this.mc_cost_30 = mc_cost_30;
		this.mc_cost_35 = mc_cost_35;
		this.mc_cost_34 = mc_cost_34;
		this.mc_cost_42 = mc_cost_42;
				
		
	}
	
	int mc_work_seq=0;
	long mc_cost_37=0; //설계
	long mc_cost_27=0; //선반
	long mc_cost_28=0; //밀링
	long mc_cost_31=0; //연마
	long mc_cost_30=0; //MCT 
	long mc_cost_35=0; //조립
	long mc_cost_34=0; //기타
	long mc_cost_42=0; //레디알
	
	public int getMc_work_seq() {
		return mc_work_seq;
	}

	public void setMc_work_seq(int mc_work_seq) {
		this.mc_work_seq = mc_work_seq;
	}

	public long getMc_cost_37() {
		return mc_cost_37;
	}

	public void setMc_cost_37(long mc_cost_37) {
		this.mc_cost_37 = mc_cost_37;
	}

	public long getMc_cost_27() {
		return mc_cost_27;
	}

	public void setMc_cost_27(long mc_cost_27) {
		this.mc_cost_27 = mc_cost_27;
	}

	public long getMc_cost_28() {
		return mc_cost_28;
	}

	public void setMc_cost_28(long mc_cost_28) {
		this.mc_cost_28 = mc_cost_28;
	}

	public long getMc_cost_31() {
		return mc_cost_31;
	}

	public void setMc_cost_31(long mc_cost_31) {
		this.mc_cost_31 = mc_cost_31;
	}

	public long getMc_cost_30() {
		return mc_cost_30;
	}

	public void setMc_cost_30(long mc_cost_30) {
		this.mc_cost_30 = mc_cost_30;
	}

	public long getMc_cost_35() {
		return mc_cost_35;
	}

	public void setMc_cost_35(long mc_cost_35) {
		this.mc_cost_35 = mc_cost_35;
	}

	public long getMc_cost_34() {
		return mc_cost_34;
	}

	public void setMc_cost_34(long mc_cost_34) {
		this.mc_cost_34 = mc_cost_34;
	}

	public long getMc_cost_42() {
		return mc_cost_42;
	}

	public void setMc_cost_42(long mc_cost_42) {
		this.mc_cost_42 = mc_cost_42;
	}

	
	
	
}
