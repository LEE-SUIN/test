package com.company.test.vo;

import java.util.Date;

public class ProductCostVo extends ItemVo{
	
	public ProductCostVo(){}
	
	public ProductCostVo(int pl_seq,int pl_se_seq,int pl_pi_seq,int pl_sc_seq,int pl_ow_group,String pl_ow_group_detail,int pl_oe_seq,
			Date pl_date,long pl_price,String pl_etc1,String pl_etc2,String pl_etc3,int pl_amount,
			String se_name,String sc_name,String pi_joil_number,String pi_name,String ow_group_name,
			String ow_group_detail_name,String oe_name,long outside_67,long outside_68,long outside_69,long outside_70,
			long outside_71,long outside_72,long outside_73,long outside_74,long outside_75,long outside_76,long outside_77,long outside_78,long outside_85,
			long inside_37,long inside_27,long inside_28,long inside_30,long inside_31,long inside_34,long inside_35,long inside_42,long total_sum,
			long outside_sum,long inside_sum,long outside_total,long inside_total,
			long sum,long sum_vat,long total,long list_sum,long list_sum_vat,long list_total,int row_count,
			Date pi_67_plan,Date pi_67_real,Date pi_68_plan,Date pi_68_real,Date pi_69_plan,Date pi_69_real,
			Date pi_70_plan,Date pi_70_real,Date pi_71_plan,Date pi_71_real,Date pi_72_plan,Date pi_72_real,
			Date pi_73_plan,Date pi_73_real,Date pi_74_plan,Date pi_74_real,Date pi_75_plan,Date pi_75_real,
			Date pi_76_plan,Date pi_76_real,Date pi_77_plan,Date pi_77_real,Date pi_78_plan,Date pi_78_real,
			String pi_67_company,String pi_68_company,String pi_69_company,String pi_70_company,String pi_71_company,
			String pi_72_company,String pi_73_company,String pi_74_company,String pi_75_company,String pi_76_company,
			String pi_77_company,String pi_78_company,String tmp_string,
			String use_yn,
			Date cre_date,
			Date mod_date,
			Date del_date,
			String del_yn)
	{
		super();
		
		this.pl_seq =pl_seq ;
		this.pl_se_seq=pl_se_seq;
		this.pl_pi_seq=pl_pi_seq;
		this.pl_sc_seq=pl_sc_seq;
		this.pl_ow_group=pl_ow_group;
		this.pl_ow_group_detail=pl_ow_group_detail;
		this.pl_oe_seq=pl_oe_seq;
		this.pl_date=pl_date;
		this.pl_price=pl_price;
		this.pl_amount=pl_amount;
		this.pl_etc1=pl_etc1;
		this.pl_etc2=pl_etc2;
		this.pl_etc3=pl_etc3;
		this.se_name=se_name;
		this.sc_name=sc_name;
		this.pi_joil_number=pi_joil_number;
		this.pi_name=pi_name;
		this.ow_group_name=ow_group_name;
		this.ow_group_detail_name=ow_group_detail_name;
		this.oe_name=oe_name;
		this.outside_67=outside_67;
		this.outside_68=outside_68;
		this.outside_69=outside_69;
		this.outside_70=outside_70;
		this.outside_71=outside_71;
		this.outside_72=outside_72;
		this.outside_73=outside_73;
		this.outside_74=outside_74;
		this.outside_75=outside_75;
		this.outside_76=outside_76;
		this.outside_77=outside_77;
		this.outside_78=outside_78;
		this.outside_85=outside_85;
		this.inside_37=inside_37;
		this.inside_27=inside_27;
		this.inside_28=inside_28;
		this.inside_30=inside_30;
		this.inside_31=inside_31;
		this.inside_34=inside_34;
		this.inside_35=inside_35;
		this.inside_42=inside_42;
		this.outside_sum=outside_sum;
		this.inside_sum=inside_sum;
		this.outside_total=outside_total;
		this.inside_total=inside_total;
		this.total_sum=total_sum;
		
		this.pi_67_plan		=pi_67_plan;
		this.pi_67_real     =pi_67_real;
		this.pi_68_plan     =pi_68_plan;
		this.pi_68_real     =pi_68_real;
		this.pi_69_plan     =pi_69_plan;
		this.pi_69_real     =pi_69_real;
		this.pi_70_plan     =pi_70_plan;
		this.pi_70_real     =pi_70_real;
		this.pi_71_plan     =pi_71_plan;
		this.pi_71_real     =pi_71_real;
		this.pi_72_plan     =pi_72_plan;
		this.pi_72_real     =pi_72_real;
		this.pi_73_plan     =pi_73_plan;
		this.pi_73_real     =pi_73_real;
		this.pi_74_plan     =pi_74_plan;
		this.pi_74_real     =pi_74_real;
		this.pi_75_plan     =pi_75_plan;
		this.pi_75_real     =pi_75_real;
		this.pi_76_plan     =pi_76_plan;
		this.pi_76_real     =pi_76_real;
		this.pi_77_plan     =pi_77_plan;
		this.pi_77_real     =pi_77_real;
		this.pi_78_plan     =pi_78_plan;
		this.pi_78_real     =pi_78_real;
		this.pi_67_company  =pi_67_company;
		this.pi_68_company  =pi_68_company;
		this.pi_69_company  =pi_69_company;
		this.pi_70_company  =pi_70_company;
		this.pi_71_company  =pi_71_company;
		this.pi_72_company  =pi_72_company;
		this.pi_73_company  =pi_73_company;
		this.pi_74_company  =pi_74_company;
		this.pi_75_company  =pi_75_company;
		this.pi_76_company  =pi_76_company;
		this.pi_77_company  =pi_77_company;
		this.pi_78_company  =pi_78_company;

		
		this.sum=sum;
		this.sum_vat=sum_vat;
		this.total=total;

		this.list_sum= list_sum;
		this.list_sum_vat=list_sum_vat;
		this.list_total=list_total;
		
		this.row_count = row_count;
		
		this.use_yn = use_yn;
		this.cre_date = cre_date;
		this.mod_date = mod_date;
		this.del_date = del_date;
		this.del_yn = del_yn;
		this.tmp_string=tmp_string;
	}

	
	int pl_seq=0;
	int pl_se_seq=0;
	int pl_pi_seq=0;
	int pl_sc_seq=0;
	int pl_ow_group=0;
	String pl_ow_group_detail=""; 
	
	int pl_oe_seq=0;
	Date pl_date;
	long pl_price=0;
	int pl_amount=0;
	
	/* 매입 대장 관련  */
	
	long sum=0; //공급가액
	long sum_vat=0; //VAT포함
	long total=0; //누계
	
	long list_sum=0; 
	long list_sum_vat=0;
	long list_total=0;
	
	int row_count=0;
	
	/* 매입 대장 관련  */
	
	String pl_etc1="";
	String pl_etc2="";
	String pl_etc3="";
	
	String se_name="";
	String sc_name="";
	String pi_joil_number="";
	String pi_name="";
	String ow_group_name="";
	String ow_group_detail_name="";
	String oe_name="";

	
	/* 원가 대장  외주 */
	long outside_67=0; //원재료
	long outside_68=0; //표준품 
	long outside_69=0; //설계비
	long outside_70=0; //면삭,제관
	long outside_71=0; //선반
	long outside_72=0; //밀링
	long outside_73=0; //와이어
	long outside_74=0; //MCT
	long outside_75=0; //연마
	long outside_76=0; //블록
	long outside_77=0; //열,표면처리
	long outside_78=0; //기타가공
	long outside_85=0; //트라이아웃
	
	/* 원가 대장  사내 */
	long inside_37=0; //설계
	long inside_27=0; //선반
	long inside_28=0; //밀링
	long inside_30=0; //MCT
	long inside_31=0; //연마
	long inside_34=0; //기타가공
	long inside_35=0; //조립
	long inside_42=0; //레디알
	
	long total_sum=0;//외주,사내 총합
	long outside_sum=0;
	long inside_sum=0;
	long outside_total=0;
	long inside_total=0;
	
	String pi_67_company ="";
	String pi_68_company ="";
	String pi_69_company ="";
	String pi_70_company ="";
	String pi_71_company ="";
	String pi_72_company ="";
	String pi_73_company ="";
	String pi_74_company ="";
	String pi_75_company ="";
	String pi_76_company ="";
	String pi_77_company ="";
	String pi_78_company ="";

	
	Date pi_67_plan;
	Date pi_67_real;
	Date pi_68_plan;
	Date pi_68_real;
	Date pi_69_plan;
	Date pi_69_real;
	Date pi_70_plan;
	Date pi_70_real;
	Date pi_71_plan;
	Date pi_71_real;
	Date pi_72_plan;
	Date pi_72_real;
	Date pi_73_plan;
	Date pi_73_real;
	Date pi_74_plan;
	Date pi_74_real;
	Date pi_75_plan;
	Date pi_75_real;
	Date pi_76_plan;
	Date pi_76_real;
	Date pi_77_plan;
	Date pi_77_real;
	Date pi_78_plan;
	Date pi_78_real;
	
	/* 공통변수 */
	String use_yn="";
	Date cre_date;
	Date mod_date;
	Date del_date;
	String del_yn="";
	String tmp_string="";
	
	public String getTmp_string() {
		return tmp_string;
	}

	public void setTmp_string(String tmp_string) {
		this.tmp_string = tmp_string;
	}

	public int getPl_seq() {
		return pl_seq;
	}

	public void setPl_seq(int pl_seq) {
		this.pl_seq = pl_seq;
	}

	public int getPl_se_seq() {
		return pl_se_seq;
	}

	public void setPl_se_seq(int pl_se_seq) {
		this.pl_se_seq = pl_se_seq;
	}

	public int getPl_pi_seq() {
		return pl_pi_seq;
	}

	public void setPl_pi_seq(int pl_pi_seq) {
		this.pl_pi_seq = pl_pi_seq;
	}

	public int getPl_sc_seq() {
		return pl_sc_seq;
	}

	public void setPl_sc_seq(int pl_sc_seq) {
		this.pl_sc_seq = pl_sc_seq;
	}

	

	public int getPl_ow_group() {
		return pl_ow_group;
	}

	public void setPl_ow_group(int pl_ow_group) {
		this.pl_ow_group = pl_ow_group;
	}

	public int getPl_oe_seq() {
		return pl_oe_seq;
	}

	public void setPl_oe_seq(int pl_oe_seq) {
		this.pl_oe_seq = pl_oe_seq;
	}

	public Date getPl_date() {
		return pl_date;
	}

	public void setPl_date(Date pl_date) {
		this.pl_date = pl_date;
	}

	public long getPl_price() {
		return pl_price;
	}

	public void setPl_price(long pl_price) {
		this.pl_price = pl_price;
	}

	public String getPl_etc1() {
		return pl_etc1;
	}

	public void setPl_etc1(String pl_etc1) {
		this.pl_etc1 = pl_etc1;
	}

	public String getPl_etc2() {
		return pl_etc2;
	}

	public void setPl_etc2(String pl_etc2) {
		this.pl_etc2 = pl_etc2;
	}

	public String getPl_etc3() {
		return pl_etc3;
	}

	public void setPl_etc3(String pl_etc3) {
		this.pl_etc3 = pl_etc3;
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

	public String getPl_ow_group_detail() {
		return pl_ow_group_detail;
	}

	public void setPl_ow_group_detail(String pl_ow_group_detail) {
		this.pl_ow_group_detail = pl_ow_group_detail;
	}

	public int getPl_amount() {
		return pl_amount;
	}

	public void setPl_amount(int pl_amount) {
		this.pl_amount = pl_amount;
	}

	public String getSe_name() {
		return se_name;
	}

	public void setSe_name(String se_name) {
		this.se_name = se_name;
	}

	public String getSc_name() {
		return sc_name;
	}

	public void setSc_name(String sc_name) {
		this.sc_name = sc_name;
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

	public String getOe_name() {
		return oe_name;
	}

	public void setOe_name(String oe_name) {
		this.oe_name = oe_name;
	}

	public long getOutside_67() {
		return outside_67;
	}

	public void setOutside_67(long outside_67) {
		this.outside_67 = outside_67;
	}

	public long getOutside_68() {
		return outside_68;
	}

	public void setOutside_68(long outside_68) {
		this.outside_68 = outside_68;
	}

	public long getOutside_69() {
		return outside_69;
	}

	public void setOutside_69(long outside_69) {
		this.outside_69 = outside_69;
	}

	public long getOutside_70() {
		return outside_70;
	}

	public void setOutside_70(long outside_70) {
		this.outside_70 = outside_70;
	}

	public long getOutside_71() {
		return outside_71;
	}

	public void setOutside_71(long outside_71) {
		this.outside_71 = outside_71;
	}

	public long getOutside_72() {
		return outside_72;
	}

	public void setOutside_72(long outside_72) {
		this.outside_72 = outside_72;
	}

	public long getOutside_73() {
		return outside_73;
	}

	public void setOutside_73(long outside_73) {
		this.outside_73 = outside_73;
	}

	public long getOutside_74() {
		return outside_74;
	}

	public void setOutside_74(long outside_74) {
		this.outside_74 = outside_74;
	}

	public long getOutside_75() {
		return outside_75;
	}

	public void setOutside_75(long outside_75) {
		this.outside_75 = outside_75;
	}

	public long getOutside_76() {
		return outside_76;
	}

	public void setOutside_76(long outside_76) {
		this.outside_76 = outside_76;
	}

	public long getOutside_77() {
		return outside_77;
	}

	public void setOutside_77(long outside_77) {
		this.outside_77 = outside_77;
	}

	public long getOutside_78() {
		return outside_78;
	}

	public void setOutside_78(long outside_78) {
		this.outside_78 = outside_78;
	}

	public long getOutside_85() {
		return outside_85;
	}

	public void setOutside_85(long outside_85) {
		this.outside_85 = outside_85;
	}

	public long getInside_37() {
		return inside_37;
	}

	public void setInside_37(long inside_37) {
		this.inside_37 = inside_37;
	}

	public long getInside_27() {
		return inside_27;
	}

	public void setInside_27(long inside_27) {
		this.inside_27 = inside_27;
	}

	public long getInside_28() {
		return inside_28;
	}

	public void setInside_28(long inside_28) {
		this.inside_28 = inside_28;
	}

	public long getInside_30() {
		return inside_30;
	}

	public void setInside_30(long inside_30) {
		this.inside_30 = inside_30;
	}

	public long getInside_31() {
		return inside_31;
	}

	public void setInside_31(long inside_31) {
		this.inside_31 = inside_31;
	}

	public long getInside_34() {
		return inside_34;
	}

	public void setInside_34(long inside_34) {
		this.inside_34 = inside_34;
	}

	public long getInside_35() {
		return inside_35;
	}

	public void setInside_35(long inside_35) {
		this.inside_35 = inside_35;
	}

	public long getInside_42() {
		return inside_42;
	}

	public void setInside_42(long inside_42) {
		this.inside_42 = inside_42;
	}

	public long getTotal_sum() {
		return total_sum;
	}

	public void setTotal_sum(long total_sum) {
		this.total_sum = total_sum;
	}

	public long getOutside_sum() {
		return outside_sum;
	}

	public void setOutside_sum(long outside_sum) {
		this.outside_sum = outside_sum;
	}

	public long getInside_sum() {
		return inside_sum;
	}

	public void setInside_sum(long inside_sum) {
		this.inside_sum = inside_sum;
	}

	public long getOutside_total() {
		return outside_total;
	}

	public void setOutside_total(long outside_total) {
		this.outside_total = outside_total;
	}

	public long getInside_total() {
		return inside_total;
	}

	public void setInside_total(long inside_total) {
		this.inside_total = inside_total;
	}

	public long getSum() {
		return sum;
	}

	public void setSum(long sum) {
		this.sum = sum;
	}

	public long getSum_vat() {
		return sum_vat;
	}

	public void setSum_vat(long sum_vat) {
		this.sum_vat = sum_vat;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public long getList_sum() {
		return list_sum;
	}

	public void setList_sum(long list_sum) {
		this.list_sum = list_sum;
	}

	public long getList_sum_vat() {
		return list_sum_vat;
	}

	public void setList_sum_vat(long list_sum_vat) {
		this.list_sum_vat = list_sum_vat;
	}

	public long getList_total() {
		return list_total;
	}

	public void setList_total(long list_total) {
		this.list_total = list_total;
	}

	public int getRow_count() {
		return row_count;
	}

	public void setRow_count(int row_count) {
		this.row_count = row_count;
	}

	public String getPi_67_company() {
		return pi_67_company;
	}

	public void setPi_67_company(String pi_67_company) {
		this.pi_67_company = pi_67_company;
	}

	public String getPi_68_company() {
		return pi_68_company;
	}

	public void setPi_68_company(String pi_68_company) {
		this.pi_68_company = pi_68_company;
	}

	public String getPi_69_company() {
		return pi_69_company;
	}

	public void setPi_69_company(String pi_69_company) {
		this.pi_69_company = pi_69_company;
	}

	public String getPi_70_company() {
		return pi_70_company;
	}

	public void setPi_70_company(String pi_70_company) {
		this.pi_70_company = pi_70_company;
	}

	public String getPi_71_company() {
		return pi_71_company;
	}

	public void setPi_71_company(String pi_71_company) {
		this.pi_71_company = pi_71_company;
	}

	public String getPi_72_company() {
		return pi_72_company;
	}

	public void setPi_72_company(String pi_72_company) {
		this.pi_72_company = pi_72_company;
	}

	public String getPi_73_company() {
		return pi_73_company;
	}

	public void setPi_73_company(String pi_73_company) {
		this.pi_73_company = pi_73_company;
	}

	public String getPi_74_company() {
		return pi_74_company;
	}

	public void setPi_74_company(String pi_74_company) {
		this.pi_74_company = pi_74_company;
	}

	public String getPi_75_company() {
		return pi_75_company;
	}

	public void setPi_75_company(String pi_75_company) {
		this.pi_75_company = pi_75_company;
	}

	public String getPi_76_company() {
		return pi_76_company;
	}

	public void setPi_76_company(String pi_76_company) {
		this.pi_76_company = pi_76_company;
	}

	public String getPi_77_company() {
		return pi_77_company;
	}

	public void setPi_77_company(String pi_77_company) {
		this.pi_77_company = pi_77_company;
	}

	public String getPi_78_company() {
		return pi_78_company;
	}

	public void setPi_78_company(String pi_78_company) {
		this.pi_78_company = pi_78_company;
	}

	public Date getPi_67_plan() {
		return pi_67_plan;
	}

	public void setPi_67_plan(Date pi_67_plan) {
		this.pi_67_plan = pi_67_plan;
	}

	public Date getPi_67_real() {
		return pi_67_real;
	}

	public void setPi_67_real(Date pi_67_real) {
		this.pi_67_real = pi_67_real;
	}

	public Date getPi_68_plan() {
		return pi_68_plan;
	}

	public void setPi_68_plan(Date pi_68_plan) {
		this.pi_68_plan = pi_68_plan;
	}

	public Date getPi_68_real() {
		return pi_68_real;
	}

	public void setPi_68_real(Date pi_68_real) {
		this.pi_68_real = pi_68_real;
	}

	public Date getPi_69_plan() {
		return pi_69_plan;
	}

	public void setPi_69_plan(Date pi_69_plan) {
		this.pi_69_plan = pi_69_plan;
	}

	public Date getPi_69_real() {
		return pi_69_real;
	}

	public void setPi_69_real(Date pi_69_real) {
		this.pi_69_real = pi_69_real;
	}

	public Date getPi_70_plan() {
		return pi_70_plan;
	}

	public void setPi_70_plan(Date pi_70_plan) {
		this.pi_70_plan = pi_70_plan;
	}

	public Date getPi_70_real() {
		return pi_70_real;
	}

	public void setPi_70_real(Date pi_70_real) {
		this.pi_70_real = pi_70_real;
	}

	public Date getPi_71_plan() {
		return pi_71_plan;
	}

	public void setPi_71_plan(Date pi_71_plan) {
		this.pi_71_plan = pi_71_plan;
	}

	public Date getPi_71_real() {
		return pi_71_real;
	}

	public void setPi_71_real(Date pi_71_real) {
		this.pi_71_real = pi_71_real;
	}

	public Date getPi_72_plan() {
		return pi_72_plan;
	}

	public void setPi_72_plan(Date pi_72_plan) {
		this.pi_72_plan = pi_72_plan;
	}

	public Date getPi_72_real() {
		return pi_72_real;
	}

	public void setPi_72_real(Date pi_72_real) {
		this.pi_72_real = pi_72_real;
	}

	public Date getPi_73_plan() {
		return pi_73_plan;
	}

	public void setPi_73_plan(Date pi_73_plan) {
		this.pi_73_plan = pi_73_plan;
	}

	public Date getPi_73_real() {
		return pi_73_real;
	}

	public void setPi_73_real(Date pi_73_real) {
		this.pi_73_real = pi_73_real;
	}

	public Date getPi_74_plan() {
		return pi_74_plan;
	}

	public void setPi_74_plan(Date pi_74_plan) {
		this.pi_74_plan = pi_74_plan;
	}

	public Date getPi_74_real() {
		return pi_74_real;
	}

	public void setPi_74_real(Date pi_74_real) {
		this.pi_74_real = pi_74_real;
	}

	public Date getPi_75_plan() {
		return pi_75_plan;
	}

	public void setPi_75_plan(Date pi_75_plan) {
		this.pi_75_plan = pi_75_plan;
	}

	public Date getPi_75_real() {
		return pi_75_real;
	}

	public void setPi_75_real(Date pi_75_real) {
		this.pi_75_real = pi_75_real;
	}

	public Date getPi_76_plan() {
		return pi_76_plan;
	}

	public void setPi_76_plan(Date pi_76_plan) {
		this.pi_76_plan = pi_76_plan;
	}

	public Date getPi_76_real() {
		return pi_76_real;
	}

	public void setPi_76_real(Date pi_76_real) {
		this.pi_76_real = pi_76_real;
	}

	public Date getPi_77_plan() {
		return pi_77_plan;
	}

	public void setPi_77_plan(Date pi_77_plan) {
		this.pi_77_plan = pi_77_plan;
	}

	public Date getPi_77_real() {
		return pi_77_real;
	}

	public void setPi_77_real(Date pi_77_real) {
		this.pi_77_real = pi_77_real;
	}

	public Date getPi_78_plan() {
		return pi_78_plan;
	}

	public void setPi_78_plan(Date pi_78_plan) {
		this.pi_78_plan = pi_78_plan;
	}

	public Date getPi_78_real() {
		return pi_78_real;
	}

	public void setPi_78_real(Date pi_78_real) {
		this.pi_78_real = pi_78_real;
	}

	
	
		
}
