<#ftl encoding="UTF-8"/>
<#assign tiles=JspTaglibs["http://tiles.apache.org/tags-tiles"] />
<#setting number_format=",###">


<script>
$(function() {	 
	  $("#tmp_search_start_date").datepicker({
		  dateFormat: 'yy-mm-dd',
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		     dayNamesMin: ['일','월','화','수','목','금','토'],
			 changeMonth: true, //월변경가능
		     changeYear: true, //년변경가능
		     yearRange: 'c-10:c+20',
			 showMonthAfterYear: true
	  });
	  $("#tmp_search_end_date").datepicker({
		  dateFormat: 'yy-mm-dd',
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		     dayNamesMin: ['일','월','화','수','목','금','토'],
			 changeMonth: true, //월변경가능
		     changeYear: true, //년변경가능
		     yearRange: 'c-10:c+20',
			 showMonthAfterYear: true
	  }); 
	  
	  $("#tmp_ab_date").datepicker({
		  dateFormat: 'yy-mm-dd',
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		     dayNamesMin: ['일','월','화','수','목','금','토'],
			 changeMonth: true, //월변경가능
		     changeYear: true, //년변경가능
		     yearRange: 'c-10:c+20',
			 showMonthAfterYear: true
			
	  }); 

	  getEnterPriseList();
	  getSearch();
	  
});

	function InpuOnlyNumber(obj) 
	{
	    if (event.keyCode >= 48 && event.keyCode <= 57) { //숫자키만 입력
	        return true;
	    } else {
	        event.returnValue = false;
	    }
	}
	
	function cal1()
	{
		var frm = document.InFrm;
		frm.tmp_ab_sum.value = Number(frm.tmp_ab_price.value) * Number(frm.tmp_ab_amount.value) ;
		frm.tmp_ab_sum_vat.value = Number(frm.tmp_ab_sum.value) + Math.ceil(Number(frm.tmp_ab_sum.value) / 10);
	}
	
	function cal2()
	{
		var frm = document.InFrm;		
		frm.tmp_ab_sum.value = Number(frm.tmp_ab_price.value) * Number(frm.tmp_ab_amount.value) ;
		frm.tmp_ab_sum_vat.value = Number(frm.tmp_ab_sum.value) + Math.ceil(Number(frm.tmp_ab_sum.value) / 10);
		
	}

	function cal11(ab_seq)
	{
		$("#ab_sum"+ab_seq).val( Number( $("#ab_price"+ab_seq).val() )  *  Number( $("#ab_amount"+ab_seq).val() ) );
		$("#ab_sum_vat"+ab_seq).val( Number( $("#ab_sum"+ab_seq).val() )  +  Math.ceil( Number( $("#ab_sum"+ab_seq).val()  / 10 ) )     ) ;
				
	}
	
	function cal22(ab_seq)
	{			
		$("#ab_sum"+ab_seq).val( Number( $("#ab_price"+ab_seq).val() )  *  Number( $("#ab_amount"+ab_seq).val() ) );
		$("#ab_sum_vat"+ab_seq).val( Number( $("#ab_sum"+ab_seq).val() )  +  Math.ceil( Number( $("#ab_sum"+ab_seq).val()  / 10 ) )     ) ;
		
	}

	function deleteCheck(seq)
	{
		var frm = document.delfrm;
		if(confirm("삭제하시겠습니까?"))
		{
			frm.seq.value=seq;
			frm.submit();
		}
		
	}
	function searchFrm()
	{
		
		var frm = document.sFrm;
		frm.search_group.value = $("#tmp_search_group").val();
		frm.search_enterprise.value = $("#tmp_search_enterprise").val();
		frm.search_start_date.value = $("#tmp_search_start_date").val();
		frm.search_end_date.value = $("#tmp_search_end_date").val();
		frm.search_word.value = $("#tmp_search_word").val();
		
		frm.submit();
	}
	
	function goPage(val)
	{
		var frm = document.pagingfrm;
		frm.pageNo.value=val;
		frm.submit();
	}
	
	function getEnterPriseList()
	{	
		$("#tmp_e_seq").empty();
		var ab_group = $("#ab_group").val();		 
		$.ajax({
	        type: "post",
	        url : "/getEnterPriseInfo.joil",
	        dataType : "json",
	        data: {
	        	ab_group : ab_group
	        },
	      success : function(data) {	    	  
	    	  var listsize = data.eList.length;	 
	    	  var list = data.eList;
	    	  for(var i=0;i<listsize;i++)
	    	  {       		  
	    		  $("#tmp_e_seq").append("<option value='"+list[i].abe_seq+"' >"+list[i].abe_name +"</option>");
	    	  }
	      },
	      
	      error : function(xhr, status, error) {
	            alert("에러발생");
	      }
	 	});
		
	}
	
	
	function getSearch()
	{	
		$("#tmp_search_enterprise").empty();
		var ab_group = $("#tmp_search_group").val();		 
		$.ajax({
	        type: "post",
	        url : "/getEnterPriseInfo.joil",
	        dataType : "json",
	        data: {
	        	ab_group : ab_group
	        },
	      success : function(data) {	    	  
	    	  var listsize = data.eList.length;	 
	    	  var list = data.eList;
	    	  $("#tmp_search_enterprise").append("<option value=''>없음</option>");
	    	  
	    	  for(var i=0;i<listsize;i++)
	    	  {   
	    		  
	    		  $("#tmp_search_enterprise").append("<option value='"+list[i].abe_seq+"' >"+list[i].abe_name +"</option>");
	    	  }
	    	  if("${search_enterprise!}" != "" &&  "${search_enterprise!}" != null)
	    	  {
	    		$("#tmp_search_enterprise").val("${search_enterprise!}");  
	    	  }
	    	  
	      },
	      
	      error : function(xhr, status, error) {
	            alert("에러발생");
	      }
	 	});
		
	}
	
	function InsertFrm()
	{
		var frm = document.InFrm;
		frm.ab_e_seq.value = frm.tmp_e_seq.value;
		frm.ab_buy_name.value = frm.tmp_ab_buy_name.value;
		frm.ab_price.value = frm.tmp_ab_price.value;
		frm.ab_amount.value = frm.tmp_ab_amount.value;
		frm.ab_sum.value = frm.tmp_ab_sum.value;
		frm.ab_sum_vat.value = frm.tmp_ab_sum_vat.value;
		frm.ab_date.value = frm.tmp_ab_date.value;
		if(frm.tmp_ab_date.value == "" || frm.tmp_ab_date.value == null){
			alert("일자를 선택하여 주십시오.");
			frm.tmp_ab_date.focus();
			return false;
		}
		if(frm.tmp_ab_buy_name.value == "" || frm.tmp_ab_buy_name.value == null){
			alert("품목명을 입력하여 주십시오.");
			frm.tmp_ab_buy_name.focus();
			return false;
		}
		frm.action="/BuyInsertProc.joil";

		frm.submit();
	}
	
	function BuyUpdate(ab_seq)
	{
		if(confirm("수정 하시겠습니까?"))
		{
			var frm = document.updatefrm;
			frm.update_ab_seq.value = ab_seq;
			frm.update_ab_buy_name.value = $("#ab_buy_name"+ab_seq).val(); 
			frm.update_ab_price.value = $("#ab_price"+ab_seq).val();
			frm.update_ab_amount.value = $("#ab_amount"+ab_seq).val();
			frm.update_ab_sum.value = $("#ab_sum"+ab_seq).val();
			frm.update_ab_sum_vat.value = $("#ab_sum_vat"+ab_seq).val();
			frm.update_ab_date.value = $("#ab_date"+ab_seq).val();
			
			if(frm.update_ab_date.value == "" ||  frm.update_ab_date.value == null){
				alert("일자를 선택하여 주십시오.");
				$("#ab_date"+ab_seq).focus();
				return false;
			}
			if(frm.update_ab_buy_name.value == "" || frm.update_ab_buy_name.value == null){
				alert("품목명을 입력하여 주십시오.");
				$("#ab_buy_name"+ab_seq).focus();
				return false;
			}
			frm.submit();
			
		}
		
		
	}
	
</script>

<form name="updatefrm" id="updatefrm" method="post" action="/BuyUpdateProc.joil">
	<input type="hidden" name="update_ab_seq" id="update_ab_seq" value="" />
    <input type="hidden" name="update_ab_buy_name" id="update_ab_buy_name" value="" />
    <input type="hidden" name="update_ab_price" id="update_ab_price" value="" />
    <input type="hidden" name="update_ab_amount" id="update_ab_amount" value="" />
    <input type="hidden" name="update_ab_sum" id="update_ab_sum" value="" />
    <input type="hidden" name="update_ab_sum_vat" id="update_ab_sum_vat" value="" />
    <input type="hidden" name="update_ab_date" id="update_ab_date" value="" />
</form>



<form name="delfrm" id="delfrm" method="post" action="/BuyDeleteProc.joil">
	<input type="hidden" name="seq" id="seq" value="" />
</form>
<form name="pagingfrm" id="pagingfrm" method="post" action="">
	<input type="hidden" name="pageNo" id="pageNo" value="" />
	<input type="hidden" name="search_group" id="search_group" value="${search_group!}" />
	<input type="hidden" name="search_enterprise" id="search_enterprise" value="${search_enterprise!}" />
	<input type="hidden" name="search_start_date" id="search_start_date" value="${search_start_date!}" />
	<input type="hidden" name="search_end_date" id="search_end_date" value="${search_end_date!}" />
	<input type="hidden" name="search_word" id="search_word" value="${search_word!}" />
</form>
<form name="sFrm" id="sFrm" method="post" action="">
	<input type="hidden" name="pageNo" id="pageNo" value="1" />
	
	<input type="hidden" name="search_group" id="search_group" value="" />
	<input type="hidden" name="search_enterprise" id="search_enterprise" value="" />
	<input type="hidden" name="search_start_date" id="search_start_date" value="" />
	<input type="hidden" name="search_end_date" id="search_end_date" value="" />
	<input type="hidden" name="search_word" id="search_word" value="" />
</form>

 <div class="col-md-12 col-sm-12 col-xs-12" style="overflow:auto; overflow-y:hidden;">
              <div class="x_panel" >
                <div class="x_title">
                  <h2>${menutitle!}</h2>          
                  <ul class="nav navbar-right panel_toolbox">
                   <li>
                    	 <div class="input-group" class="col-md-4 col-sm-4 col-xs-4" >
	                      
		                      <label for="tmp_search_group"><span class="blind">매입종류</span></label>
							  <select class="form-control" name="tmp_search_group" id="tmp_search_group" style="width:100px;" onchange="getSearch();">
							  	<option value="">없음</option>
		                       	<#list aList as aInfo>
		                      	 <option value="${aInfo.sc_seq!}" <#if aInfo.sc_seq!?string == search_group! >selected</#if> >${aInfo.sc_name!}</option>
		                        </#list>
		                      </select>
		                      
		                      <label for="tmp_search_enterprise"><span class="blind">업체</span></label>
							  <select class="form-control" name="tmp_search_enterprise" id="tmp_search_enterprise" style="width:140px;" >
							  	<option value="">없음</option>
		                       	
		                      </select>
	                      
	                      
	                      <label for="tmp_search_start_date"><span class="blind">시작일자</span></label>
	                      <input type="text" name="tmp_search_start_date" id ="tmp_search_start_date" class="form-control" style="width:100px;" placeholder="시작일자" value="${search_start_date!}">&nbsp;
	                      <label for="tmp_search_end_date"><span class="blind">종료일자</span></label>
	                      <input type="text" name="tmp_search_end_date" id ="tmp_search_end_date" class="form-control" style="width:100px;" placeholder="종료일자" value="${search_end_date!}">&nbsp;
	                      <label for="tmp_search_word"><span class="blind">검색어</span></label>
	                      <input type="text" name="tmp_search_word" id ="tmp_search_word" class="form-control" style="width:100px;" placeholder="품목명" value="${search_word!}">&nbsp;
	                      
                          <span class="input-group-btn" style="float:left;">
                              <button type="button" class="btn btn-primary" onclick="javascript:searchFrm();return false;">검색</button>
                          </span>
                          <!-- <span class="input-group-btn">
	                          <a href="/BuyManage.joil?menuname=BuyInsert">
	                    		<button type="button" class="btn btn-primary">등록</button>
	                    	</a>
                    	  </span> -->
                        </div>                    	
                    </li>                 
                    
                  </ul>      
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  
                  <form name="InFrm" id ="InFrm" method="post" >
                  <input type="hidden" name="ab_e_seq" id="ab_e_seq" value="" />
                  <input type="hidden" name="ab_buy_name" id="ab_buy_name" value="" />
                  <input type="hidden" name="ab_price" id="ab_price" value="" />
                  <input type="hidden" name="ab_amount" id="ab_amount" value="" />
                  <input type="hidden" name="ab_sum" id="ab_sum" value="" />
                  <input type="hidden" name="ab_sum_vat" id="ab_sum_vat" value="" />
                  <input type="hidden" name="ab_date" id="ab_date" value="" />
                                     
                  <table class="table table-striped projects" summary="${menutitle!}">
                   <caption style="padding-top:0px;padding-bottom:0px;"><span class="blind">${menutitle!}</span></caption>
                    <thead align="center">
                      <tr>
                        <th style="width: 5%; text-align:center;">일자</th>
                        <th style="width: 5%; text-align:center;">종류</th>
                        <th style="width: 10%; text-align:center;">업체명</th>
                        <th style="width: 10%; text-align:center;">품목명</th>
                        <th style="width: 6%; text-align:center;">가격</th>
                        <th style="width: 5%; text-align:center;">수량</th>
                        <th style="width: 6%; text-align:center;">합계</th>
                        <th style="width: 6%; text-align:center;">합계(VAT)</th>
                        <th style="width: *; text-align:center;">관리</th>
                      </tr>
                    </thead>
                    <tbody>
                    	<tr>
                    		<td >
                    			<label class="control-label" for="tmp_ab_date"><span class="required blind">일자 *</span></label>		
			                    <input style="width:100px;" type="text" id="tmp_ab_date" name="tmp_ab_date" required="required" class="form-control col-md-7 col-xs-12" value="">
                    		</td>
                    		<td >
                    			<label class="control-label"  for="ab_group" style="display:inline;"><span class="blind">종류</span></label>
                    			<select style="width:100px;" class="form-control" name="ab_group" id="ab_group" onchange="getEnterPriseList();">
			                       	<#list aList as aInfo>
			                      	 <option value="${aInfo.sc_seq!}" <#if aInfo.sc_seq!?string == search_group! >selected</#if> >${aInfo.sc_name!}</option>
			                        </#list>
		                        </select>
                    		</td>
                    		<td >
                    			<label class="control-label" for="tmp_e_seq" style="display:inline;"><span class="required blind">업체명</span></label>		
			                    <select style="width:140px;" class="form-control" name="tmp_e_seq" id="tmp_e_seq" >
			                    
			                    </select>
                    		</td>
                    		<td >
                    			<label class="control-label" for="tmp_ab_buy_name"><span class="required blind">품목명</span></label>		
			                    <input style="width:140px;" type="text" id="tmp_ab_buy_name" name="tmp_ab_buy_name" required="required" class="form-control col-md-7 col-xs-12" value="">
                    		</td>
                    		<td>
                    			<label class="control-label" for="tmp_ab_price"><span class="required blind">가격</span></label>		
			                    <input style="width:100px;" type="text" id="tmp_ab_price" name="tmp_ab_price" required="required" class="form-control col-md-7 col-xs-12" value="0" onkeyup="javascript:cal1();" onkeyPress="InpuOnlyNumber(this);" style="ime-mode:disabled" >
                    		</td>
                    		<td >
                    			<label class="control-label" for="tmp_ab_amount"><span class="required blind">수량</span></label>		
			                    <input style="width:50px;" type="text" id="tmp_ab_amount" name="tmp_ab_amount" required="required" class="form-control col-md-7 col-xs-12" value="1" onkeyup="javascript:cal2();" onkeyPress="InpuOnlyNumber(this);" style="ime-mode:disabled">
                    		</td>
                    		<td >
                    			<label class="control-label" for="tmp_ab_sum"><span class="required blind">합계</span></label>		
			                    <input style="width:120px;" type="text" id="tmp_ab_sum" name="tmp_ab_sum" required="required" class="form-control col-md-7 col-xs-12" value="0" onkeyPress="InpuOnlyNumber(this);" style="ime-mode:disabled">
                    		</td>
                    		<td >
                    			<label class="control-label" for="tmp_ab_sum_vat"><span class="required blind">합계(VAT)</span></label>		
			                    <input style="width:120px;" type="text" id="tmp_ab_sum_vat" name="tmp_ab_sum_vat" required="required" class="form-control col-md-7 col-xs-12" value="0" onkeyPress="InpuOnlyNumber(this);" style="ime-mode:disabled">
                    		</td>
                    		<td style="width:112px;">
                    			<button type="button" class="btn btn-round btn-success" onclick="javascript:InsertFrm();return false;">등록</button>
                    		</td>
                    	</tr>
                    	</tbody>
                  </table>
                  </form>
                  <!-- start project list -->
                  <p>총 게시물 수 : ${totalCount!?default('0')} </p>
                  <table class="table table-striped projects" summary="${menutitle!}">
                   <caption style="padding-top:0px;padding-bottom:0px;"><span class="blind">${menutitle!}</span></caption>
                    <thead>
                      <tr>                        
                        <th style="width: 5%; text-align:center;">일자</th>
                        <th style="width: 5%; text-align:center;">종류</th>
                        <th style="width: 10%; text-align:center;">업체명</th>
                        <th style="width: 10%; text-align:center;">품목명</th>
                        <th style="width: 6%; text-align:center;">가격</th>
                        <th style="width: 5%; text-align:center;">수량</th>
                        <th style="width: 6%; text-align:center;">합계</th>
                        <th style="width: 6%; text-align:center;">합계(VAT)</th>
                        <th style="width: *; text-align:center;">관리</th>
                      </tr>
                    </thead>
                    <tbody>
                    <#if List!?default('0')?size &gt; 0 > 
                    <#list List as Info>
	                    <tr>	                      
	                        <td> 
			                    <label class="control-label" for="ab_date${Info.ab_seq!}"><span class="required blind">일자</span></label>
			                    <input style="width:100px;" type="text" id="ab_date${Info.ab_seq!}" name="ab_date${Info.ab_seq!}" required="required" class="form-control col-md-7 col-xs-12" value="${Info.ab_date!?date?string('yyyy-MM-dd')}">
	                        </td>
	                        <td style="width:100px;">
	                        	<input readonly="readonly" style="width:100px;" type="text" value="${Info.ab_e_group_name!}" class="form-control col-md-7 col-xs-12" />
                    		</td>
                    		<td style="width:100px;">
                    			<input readonly="readonly" style="width:140px;" type="text" value="${Info.ab_e_name!}" class="form-control col-md-7 col-xs-12" />
                    		</td>
                    		<td>
                    			<label class="control-label" for="ab_buy_name${Info.ab_seq!}"><span class="required blind">품목명</span></label>		
			                    <input style="width:140px;" type="text" id="ab_buy_name${Info.ab_seq!}" name="ab_buy_name${Info.ab_seq!}" required="required" class="form-control col-md-7 col-xs-12" value="${Info.ab_buy_name!}">
                    		</td>
                    		<td>
                    			<label class="control-label" for="ab_price${Info.ab_seq!}"><span class="required blind">가격</span></label>		
			                    <input style="width:100px;" type="text" id="ab_price${Info.ab_seq!}" name="ab_price${Info.ab_seq!}" required="required" class="form-control col-md-7 col-xs-12" value="${Info.ab_price!}" onkeyup="javascript:cal11('${Info.ab_seq!}');" onkeyPress="InpuOnlyNumber(this);" style="ime-mode:disabled" >
                    		</td>
                    		<td>
                    			<label class="control-label" for="ab_amount${Info.ab_seq!}"><span class="required blind">수량</span></label>		
			                    <input style="width:50px;" type="text" id="ab_amount${Info.ab_seq!}" name="ab_amount${Info.ab_seq!}" required="required" class="form-control col-md-7 col-xs-12" value="${Info.ab_amount!}" onkeyup="javascript:cal22('${Info.ab_seq!}');" onkeyPress="InpuOnlyNumber(this);" style="ime-mode:disabled">
                    		</td>
                    		<td>
                    			<label class="control-label" for="ab_sum${Info.ab_seq!}"><span class="required blind">합계</span></label>		
			                    <input style="width:120px;" type="text" id="ab_sum${Info.ab_seq!}" name="ab_sum${Info.ab_seq!}" required="required" class="form-control col-md-7 col-xs-12" value="${Info.ab_sum!}" onkeyPress="InpuOnlyNumber(this);" style="ime-mode:disabled">
                    		</td>
                    		<td>
                    			<label class="control-label" for="ab_sum_vat${Info.ab_seq!}"><span class="required blind">합계(VAT)</span></label>		
			                    <input style="width:120px;" type="text" id="ab_sum_vat${Info.ab_seq!}" name="ab_sum_vat${Info.ab_seq!}" required="required" class="form-control col-md-7 col-xs-12" value="${Info.ab_sum_vat!}" onkeyPress="InpuOnlyNumber(this);" style="ime-mode:disabled">
                    		</td>
	                        <td style="width:112px;" nowrap>	                          
	                          <button onclick="javascript:BuyUpdate('${Info.ab_seq!}');" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> 수정 </button>
	                          <a href="javascript:deleteCheck('${Info.ab_seq!}'); " class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> 삭제 </a>
	                        </td>
	                      </tr>
					</#list>
                    </#if>  
                     
                    </tbody>
                  </table>
                  <!-- end project list -->

                </div>
                
                
                <div class="dataTables_paginate paging_simple_numbers" style="width:100%;text-align:center;">
                	<ul class="pagination">
                		<li class="pagination">
                			<a tabindex="0" aria-controls="datatable" href="javascript:goPage(${paging.firstPageNo});" data-dt-idx="${paging.firstPageNo}">
                				처음
                			</a>
                		</li>
                		<li class="pagination">
                			<a tabindex="0" aria-controls="datatable" href="javascript:goPage(${paging.prevPageNo});" data-dt-idx="${paging.prevPageNo}">
                				이전
                			</a>
                		</li>
                		<#list paging.startPageNo..paging.endPageNo as i>
                			<li class="pagination <#if paging.pageNo == i>active </#if>">
                				<a tabindex="0" aria-controls="datatable" href="javascript:goPage(${i!});" data-dt-idx="${i!}}"> 
                					${i!}
                				</a>
                			</li>
                		</#list>
                		<li class="pagination">
                			<a tabindex="0" aria-controls="datatable" href="javascript:goPage(${paging.nextPageNo});" data-dt-idx="${paging.nextPageNo}">
                				다음
                			</a>
                		</li>
                		<li class="pagination">
                			<a tabindex="0" aria-controls="datatable" href="javascript:goPage(${paging.finalPageNo});" data-dt-idx="${paging.finalPageNo}">
                				마지막
                			</a>
                		</li>
                	</ul>
                	<#-- <a id="pageFirst" class="paginate_button" href="javascript:goPage(${paging.firstPageNo});">처음</a>
                	<a id="pagePre" class="paginate_button" href="javascript:goPage(${paging.prevPageNo});">이전</a>
                	<span>
                		<#list paging.startPageNo..paging.endPageNo as i>
                			<a class="paginate_button" id="pageNo" href="javascript:goPage(${i!});"> ${i!}</a>
                		</#list>
                	</span>
                	<a id="pageNext" class="paginate_button" href="javascript:goPage(${paging.nextPageNo});">다음</a>
                	<a id="pageEnd" class="paginate_button" href="javascript:goPage(${paging.finalPageNo});">마지막</a> --#>
                </div>
                
              </div>
            </div>
