<#ftl encoding="UTF-8"/>
<#assign tiles=JspTaglibs["http://tiles.apache.org/tags-tiles"] />
<#setting number_format=",###">
<link rel="stylesheet" href="/resources/css/joil/buy.css"  />

<script>

$(function() {
	
	$("#tmp_start_date").datepicker({
		  dateFormat: 'yy-mm-dd',
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		     dayNamesMin: ['일','월','화','수','목','금','토'],
			 changeMonth: true, //월변경가능
		     changeYear: true, //년변경가능
		     yearRange: 'c-65:c+15',
			 showMonthAfterYear: true
			 //pos: {x: 10, y: 10, zIndex: 9999}
	}); 
	$("#tmp_end_date").datepicker({
		  dateFormat: 'yy-mm-dd',
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		     dayNamesMin: ['일','월','화','수','목','금','토'],
			 changeMonth: true, //월변경가능
		     changeYear: true, //년변경가능
		     yearRange: 'c-65:c+15',
			 showMonthAfterYear: true
			 //pos: {x: 10, y: 10, zIndex: 9999}
	}); 
});
	
	function searchFrm()
	{
		var frm = document.searchfrm;
		var start_date = $("#tmp_start_date").val();		
		var end_date = $("#tmp_end_date").val();
		
		frm.start_date.value= start_date;
		frm.end_date.value= end_date;
		frm.submit();					
	}
	
	
</script>


<form name="searchfrm" id="searchfrm" method="post" action="/BuyManage.joil?menuname=BuyBook">
	<input type="hidden" name="start_date" id= "start_date" />
	<input type="hidden" name="end_date" id= "end_date" />
</form>

 <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel" style="width:100%;">
                <div class="x_title">
                  <h2>${menutitle!}</h2>          
                  <ul class="nav navbar-right panel_toolbox">
                    <li>                    
	                    <div class="input-group" class="col-md-4 col-sm-4 col-xs-4">
	                      <input type="text" name="tmp_start_date" id ="tmp_start_date" class="form-control" style="width:100px;" placeholder="시작일자" value="${start_date!}">&nbsp;
	                      <label for="tmp_start_date"><span class="blind">시작일자</span></label>
                          <input type="text" name="tmp_end_date" id ="tmp_end_date" class="form-control" style="width:100px;" placeholder="종료일자" value="${end_date!}">
                          <label for="tmp_end_date"><span class="blind">종료일자</span></label>
                          <span class="input-group-btn" style="float:left;">
                              
                              <button type="button" class="btn btn-primary" onclick="searchFrm();return false;">검색</button>
                          </span>
                          
                        </div>
                    
                         &nbsp;
                    </li>
                  </ul>      
                  <div class="clearfix"></div>
                </div>
                <div class="x_content" id="x_content">
                	 
                	 <table class="table joiltable-bordered joiltable-striped buybookTable">
                	 <caption><span class="blind">매입 대장</span></caption>
                	 <thead></thead>
                	 	<tr class="buybookTR" style="text-align:center;">
                	 		<td  colspan="2" rowspan="2" style="border-right-color:white;width:200px;">
                	 			<img src="/resources/logo.png" alt="joil로고"/>
                	 		</td>
                	 		
                	 		<td colspan="3" rowspan="2">
                	 			<span>
                	 			<label for="month"><span class="blind">매입 현황</span></label>
                	 		    <input id="month" name="month" value="(00)월 매입 현황" type="text" size="15" style=" font-size:30px; background-color:transparent;border:0 solid black;width:300px;text-align:center;"  />
                	 		    </span>
                	 		    <br/>
                	 		    <div>
                	 				<font size="5">금형 사업부 </font>
                	 			</div>
                	 		</td>
                	 		<td rowspan="2" style="text-align:center;width:100px;">결<br/><br/><br/><br/>재</td>
                	 		<td style="width:120px;">작 성</td>
                	 		<td style="width:120px;">검 토</td>
                	 		<td style="width:120px;">승 인</td>
                	 	</tr>
                	 	<tr class="buybookTR">
                	 		<td style="height:75px;"></td>
                	 		<td></td>
                	 		<td></td>
                	 	</tr>
                	 	<tr class="buybookTR" style="text-align:center;">
                	 		<td style="width:100px;">구     분</td>
                	 		<td style="width:150px;">업 체 명</td>
                	 		<td style="width:130px;">주거래품목</td>
                	 		<td style="width:120px; ">공급가액</td>
                	 		<td style="width:120px;">합계(VAT포함)</td>
                	 		<td style="width:100px;"><font size="1">지급일</font></td>
                	 		<td style="width:100px;">원가율</td>
                	 		<td colspan="2" style="width:150px;">누 계</td>
                	 	</tr>
                	 	<#assign sum_total=0?number >
                	 	<#assign total=0?number >
                	 	
                	 	<#if List67?size &gt; 0>
                	 	    <#assign sum_total67=0?number >
                	 	    <#assign sum_vat_total=0?number >
                	 	    <#assign total67=0?number >
                	 		<#list List67 as Info>
                	 			<tr class="buybookTR_data">
                	 			
                	 				<#if Info_index+1 == 1>
                	 					<td style="width:100px; text-align:center;" rowspan="${List67_row+1!}">원재료</td>	
                	 				</#if>
			                	 	
			                	 	<td style="width:150px;<#if Info.oe_name?length &gt; 7>font-size:10px;</#if> ">${Info.oe_name!}</td>
			                	 	<td style="width:140px;<#if Info.sc_name?length &gt; 7>font-size:10px;</#if>">${Info.sc_name!}</td>
			                	 	<td style="width:130px; text-align:right;">${Info.sum!}</td>
			                	 	<#assign sum_total67 = sum_total67 + Info.sum >			                	 	
			                	 	<td style="width:130px; text-align:right;">${Info.sum_vat!}</td>
			                	 	<#assign total67 = total67 + Info.sum_vat >
			                	 	<td style="width:100px;"></td>
			                	 	<td style="width:100px;"></td>
			                	 	<td colspan="2" style="width:200px; text-align:right;">${total67!}</td>
		                	 	</tr>
                	 		</#list>
                	 		   <tr class="buybookTR_data_total">
			                	 	<td style="width:150px;" >&nbsp;</td>
			                	 	<td style="width:140px; text-align:center;"> 계 </td>
			                	 	<td style="width:130px; text-align:right;">${sum_total67!}</td>			                	 	
			                	 	<td style="width:130px; text-align:right;">${total67!}</td>			                	 	
			                	 	<td style="width:100px;"></td>
			                	 	<td style="width:100px;"></td>
			                	 	<td colspan="2" style="width:200px; text-align:right;">${total67!}</td>
		                	 	</tr>
		                	<#assign sum_total= sum_total + sum_total67 >
			                <#assign total= total + total67 >
                	 	</#if>
                	 	
                	 	<#if List68?size &gt; 0>
                	 	    <#assign sum_total68=0?number >
                	 	    <#assign sum_vat_total=0?number >
                	 	    <#assign total68=0?number >
                	 		<#list List68 as Info>
                	 			<tr class="buybookTR_data">
                	 				<#if Info_index+1 == 1>
                	 					<td style="width:100px; text-align:center;" rowspan="${List68_row+1!}">표준품</td>	
                	 				</#if>
			                	 	
			                	 	<td style="width:150px;<#if Info.oe_name?length &gt; 7>font-size:10px;</#if> ">${Info.oe_name!}</td>
			                	 	<td style="width:140px;<#if Info.sc_name?length &gt; 7>font-size:10px;</#if>">${Info.sc_name!}</td>
			                	 	<td style="width:130px; text-align:right;">${Info.sum!}</td>
			                	 	<#assign sum_total68 = sum_total68 + Info.sum >
			                	 	<td style="width:130px; text-align:right;">${Info.sum_vat!}</td>
			                	 	<#assign total68 = total68 + Info.sum_vat >
			                	 	<td style="width:100px;"></td>
			                	 	<td style="width:100px;"></td>
			                	 	<td colspan="2" style="width:200px; text-align:right;">${total68!}</td>
		                	 	</tr>
                	 		</#list>
                	 		   <tr class="buybookTR_data_total">
			                	 	<td style="width:150px;">&nbsp;</td>
			                	 	<td style="width:140px; text-align:center;"> 계 </td>
			                	 	<td style="width:130px; text-align:right;">${sum_total68!}</td>
			                	 	<td style="width:130px; text-align:right;">${total68!}</td>
			                	 	<td style="width:100px;"></td>
			                	 	<td style="width:100px;"></td>
			                	 	<td colspan="2" style="width:200px; text-align:right;">${total68!}</td>
		                	 	</tr>
		                	<#assign sum_total= sum_total + sum_total68 >
			                <#assign total= total + total68 >
                	 	</#if>
                	 	
                	 	
                	 	
                	 	<#if List91?size &gt; 0>
                	 	    <#assign sum_total91=0?number >
                	 	    <#assign sum_vat_total=0?number >
                	 	    <#assign total91=0?number >
                	 		<#list List91 as Info>
                	 			<tr class="buybookTR_data">
                	 				<#if Info_index+1 == 1>
                	 					<td style="width:100px; text-align:center;" rowspan="${List91_row+1!}">부자재</td>	
                	 				</#if>
			                	 	
			                	 	<td style="width:150px;<#if Info.oe_name?length &gt; 7>font-size:10px;</#if> ">${Info.oe_name!}</td>
			                	 	<td style="width:140px;<#if Info.sc_name?length &gt; 7>font-size:10px;</#if>">${Info.sc_name!}</td>
			                	 	<td style="width:130px; text-align:right;">${Info.sum!}</td>
			                	 	<#assign sum_total91 = sum_total91 + Info.sum >
			                	 	<td style="width:130px; text-align:right;">${Info.sum_vat!}</td>
			                	 	<#assign total91 = total91 + Info.sum_vat >
			                	 	<td style="width:100px;"></td>
			                	 	<td style="width:100px;"></td>
			                	 	<td colspan="2" style="width:200px; text-align:right;">${total91!}</td>
		                	 	</tr>
                	 		</#list>
                	 		   <tr class="buybookTR_data_total">
			                	 	<td style="width:150px;" >&nbsp;</td>
			                	 	<td style="width:140px; text-align:center;"> 계 </td>
			                	 	<td style="width:130px; text-align:right;">${sum_total91!}</td>
			                	 	<td style="width:130px; text-align:right;">${total91!}</td>
			                	 	<td style="width:100px;"></td>
			                	 	<td style="width:100px;"></td>
			                	 	<td colspan="2" style="width:200px; text-align:right;">${total91!}</td>
		                	 	</tr>
		                	 	<#assign sum_total= sum_total + sum_total91 >
			                <#assign total= total + total91 >
                	 	</#if>
                	 	
                	 	
                	 	
                	 	<#if List7078?size &gt; 0>
                	 	    <#assign sum_total7078=0?number >
                	 	    <#assign sum_vat_total=0?number >
                	 	    <#assign total7078=0?number >
                	 		<#list List7078 as Info>
                	 			<tr class="buybookTR_data">
                	 				<#if Info_index+1 == 1>
                	 					<td style="width:100px; text-align:center; font-size:10px; " rowspan="${List7078_row+1!}">외주가공비</td>	
                	 				</#if>
			                	 	
			                	 	<td style="width:150px;<#if Info.oe_name?length &gt; 7>font-size:10px;</#if> ">${Info.oe_name!}</td>
			                	 	<td style="width:140px;<#if Info.sc_name?length &gt; 7>font-size:10px;</#if>">${Info.sc_name!}</td>
			                	 	<td style="width:130px; text-align:right;">${Info.sum!}</td>
			                	 	<#assign sum_total7078 = sum_total7078 + Info.sum >
			                	 	<td style="width:130px; text-align:right;">${Info.sum_vat!}</td>
			                	 	<#assign total7078 = total7078 + Info.sum_vat >
			                	 	<td style="width:100px;"></td>
			                	 	<td style="width:100px;"></td>
			                	 	<td colspan="2" style="width:200px; text-align:right;">${total7078!}</td>
		                	 	</tr>
                	 		</#list>
                	 		   <tr class="buybookTR_data_total">
			                	 	<td style="width:150px;" >&nbsp;</td>
			                	 	<td style="width:140px; text-align:center;"> 계 </td>
			                	 	<td style="width:130px; text-align:right;">${sum_total7078!}</td>
			                	 	<td style="width:130px; text-align:right;">${total7078!}</td>
			                	 	<td style="width:100px;"></td>
			                	 	<td style="width:100px;"></td>
			                	 	<td colspan="2" style="width:200px; text-align:right;">${total7078!}</td>
		                	 	</tr>
		                	 	<#assign sum_total= sum_total + sum_total7078 >
			                <#assign total= total + total7078 >
                	 	</#if>
                	 	
                	 	
                	 	
                	 	<#if List69?size &gt; 0>
                	 	    <#assign sum_total69=0?number >
                	 	    <#assign sum_vat_total=0?number >
                	 	    <#assign total69=0?number >
                	 		<#list List69 as Info>
                	 			<tr class="buybookTR_data">
                	 				<#if Info_index+1 == 1>
                	 					<td style="width:100px; text-align:center;" rowspan="${List69_row+1!}">설계비</td>	
                	 				</#if>
			                	 	
			                	 	<td style="width:150px;<#if Info.oe_name?length &gt; 7>font-size:10px;</#if> ">${Info.oe_name!}</td>
			                	 	<td style="width:140px;<#if Info.sc_name?length &gt; 7>font-size:10px;</#if>">${Info.sc_name!}</td>
			                	 	<td style="width:130px; text-align:right;">${Info.sum!}</td>
			                	 	<#assign sum_total69 = sum_total69 + Info.sum >
			                	 	<td style="width:130px; text-align:right;">${Info.sum_vat!}</td>
			                	 	<#assign total69 = total69 + Info.sum_vat >
			                	 	<td style="width:100px;"></td>
			                	 	<td style="width:100px;"></td>
			                	 	<td colspan="2" style="width:200px; text-align:right;">${total69!}</td>
		                	 	</tr>
                	 		</#list>
                	 		   <tr class="buybookTR_data_total">
			                	 	<td style="width:150px;" >&nbsp;</td>
			                	 	<td style="width:140px; text-align:center;"> 계 </td>
			                	 	<td style="width:130px; text-align:right;">${sum_total69!}</td>
			                	 	<td style="width:130px; text-align:right;">${total69!}</td>
			                	 	<td style="width:100px;"></td>
			                	 	<td style="width:100px;"></td>
			                	 	<td colspan="2" style="width:200px; text-align:right;">${total69!}</td>
		                	 	</tr>
		                	 	<#assign sum_total= sum_total + sum_total69 >
			                <#assign total= total + total69 >
                	 	</#if>
                	 	
                	 	
                	 	
                	 	<#if List88?size &gt; 0>
                	 	    <#assign sum_total88=0?number >
                	 	    <#assign sum_vat_total=0?number >
                	 	    <#assign total88=0?number >
                	 		<#list List88 as Info>
                	 			<tr class="buybookTR_data">
                	 				<#if Info_index+1 == 1>
                	 					<td style="width:100px; text-align:center;" rowspan="${List88_row+1!}">관리비</td>	
                	 				</#if>
			                	 	
			                	 	<td style="width:150px;<#if Info.abe_name?length &gt; 7>font-size:10px;</#if>">${Info.abe_name!}</td>
			                	 	<td style="width:140px;<#if Info.abe_main?length &gt; 7>font-size:9px;</#if>">${Info.abe_main!}</td>
			                	 	<td style="width:130px; text-align:right;">${Info.ab_sum!}</td>
			                	 	<#assign sum_total88 = sum_total88 + Info.ab_sum >
			                	 	<td style="width:130px; text-align:right;">${Info.ab_sum_vat!}</td>
			                	 	<#assign total88 = total88 + Info.ab_sum_vat >
			                	 	<td style="width:100px;"></td>
			                	 	<td style="width:100px;"></td>
			                	 	<td colspan="2" style="width:200px; text-align:right;">${total88!}</td>
		                	 	</tr>
                	 		</#list>
                	 		   <tr class="buybookTR_data_total">
			                	 	<td style="width:150px;" >&nbsp;</td>
			                	 	<td style="width:140px; text-align:center;"> 계 </td>
			                	 	<td style="width:130px; text-align:right;">${sum_total88!}</td>
			                	 	<td style="width:130px; text-align:right;">${total88!}</td>
			                	 	<td style="width:100px;"></td>
			                	 	<td style="width:100px;"></td>
			                	 	<td colspan="2" style="width:200px; text-align:right;">${total88!}</td>
		                	 	</tr>
		                	 	<#assign sum_total= sum_total + sum_total88 >
			                <#assign total= total + total88 >
                	 	</#if>
                	 	
                	 	
                	 	<#if List89?size &gt; 0>
                	 	    <#assign sum_total89=0?number >
                	 	    <#assign sum_vat_total=0?number >
                	 	    <#assign total89=0?number >
                	 		<#list List89 as Info>
                	 			<tr class="buybookTR_data">
                	 				<#if Info_index+1 == 1>
                	 					<td style="width:100px; text-align:center;" rowspan="${List89_row+1!}">투자비</td>	
                	 				</#if>
			                	 	
			                	 	<td style="width:150px;<#if Info.abe_name?length &gt; 7>font-size:10px;</#if>">${Info.abe_name!}</td>
			                	 	<td style="width:140px;<#if Info.abe_main?length &gt; 7>font-size:9px;</#if>">${Info.abe_main!}</td>
			                	 	<td style="width:130px; text-align:right;">${Info.ab_sum!}</td>
			                	 	<#assign sum_total89 = sum_total89 + Info.ab_sum >
			                	 	<td style="width:130px; text-align:right;">${Info.ab_sum_vat!}</td>
			                	 	<#assign total89 = total89 + Info.ab_sum_vat >
			                	 	<td style="width:100px;"></td>
			                	 	<td style="width:100px;"></td>
			                	 	<td colspan="2" style="width:200px; text-align:right;">${total89!}</td>
		                	 	</tr>
                	 		</#list>
                	 		   <tr class="buybookTR_data_total">
			                	 	<td style="width:150px;" >&nbsp;</td>
			                	 	<td style="width:140px; text-align:center;"> 계 </td>
			                	 	<td style="width:130px; text-align:right;">${sum_total89!}</td>
			                	 	<td style="width:130px; text-align:right;">${total89!}</td>
			                	 	<td style="width:100px;"></td>
			                	 	<td style="width:100px;"></td>
			                	 	<td colspan="2" style="width:200px; text-align:right;">${total89!}</td>
		                	 	</tr>
		                	 	<#assign sum_total= sum_total + sum_total89 >
			                <#assign total= total + total89 >
                	 	</#if>
                	 	
                	 	
                	 	
                	 	<#if List90?size &gt; 0>
                	 	    <#assign sum_total90=0?number >
                	 	    <#assign sum_vat_total=0?number >
                	 	    <#assign total90=0?number >
                	 		<#list List90 as Info>
                	 			<tr class="buybookTR_data">
                	 				<#if Info_index+1 == 1>
                	 					<td style="width:100px; text-align:center;" rowspan="${List90_row+1!}">기타</td>
                	 				</#if>
			                	 	<td style="width:150px;<#if Info.abe_name?length &gt; 7>font-size:10px;</#if>">${Info.abe_name!}</td>
			                	 	<td style="width:140px;<#if Info.abe_main?length &gt; 7>font-size:9px;</#if>">${Info.abe_main!}</td>
			                	 	<td style="width:130px; text-align:right;">${Info.ab_sum!}</td>
			                	 	<#assign sum_total90 = sum_total90 + Info.ab_sum >
			                	 	<td style="width:130px; text-align:right;">${Info.ab_sum_vat!}</td>
			                	 	<#assign total90 = total90 + Info.ab_sum_vat >
			                	 	<td style="width:100px;"></td>
			                	 	<td style="width:100px;"></td>
			                	 	<td colspan="2" style="width:200px; text-align:right;">${total90!}</td>
		                	 	</tr>
                	 		</#list>
                	 		   <tr class="buybookTR_data_total">
			                	 	<td style="width:150px;" >&nbsp;</td>
			                	 	<td style="width:140px; text-align:center;"> 계 </td>
			                	 	<td style="width:130px; text-align:right;">${sum_total90!}</td>
			                	 	<td style="width:130px; text-align:right;">${total90!}</td>
			                	 	<td style="width:100px;"></td>
			                	 	<td style="width:100px;"></td>
			                	 	<td colspan="2" style="width:200px; text-align:right;">${total90!}</td>
		                	 	</tr>
		                	 	<#assign sum_total= sum_total + sum_total90 >
			                <#assign total= total + total90 >
                	 	</#if>
                	 	
                	 	
                	 	
                	 	<tr class="buybookTR_total">
			                	 	<td style="text-align:center;" colspan="3">합 계</td>
			                	 	<td style="text-align:right;">${sum_total}</td>
			                	 	<td style="text-align:right;">${total}</td>
			                	 	<td style=""></td>
			                	 	<td style=""></td>
			                	 	<td colspan="2" style="text-align:right;">${total}</td>
		                </tr>
                	 	
                	 </table>
		                  
                </div>
              </div>
            </div>
            


<script>
	
 
   
    
  </script>