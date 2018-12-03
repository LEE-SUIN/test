<#ftl encoding="UTF-8"/>
<#assign tiles=JspTaglibs["http://tiles.apache.org/tags-tiles"] />
<#setting number_format=",###">


<script>
$(function() {	 
	
	$("#tmp_search_date").datepicker({
		  dateFormat: 'yy-mm-dd',
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		     dayNamesMin: ['일','월','화','수','목','금','토'],
			 changeMonth: true, //월변경가능
		     changeYear: true, //년변경가능
		     yearRange: 'c-10:c+20',
			 showMonthAfterYear: true
	  });
	  $("#il_reg_date").datepicker({
		  dateFormat: 'yy-mm-dd',
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		     dayNamesMin: ['일','월','화','수','목','금','토'],
			 changeMonth: true, //월변경가능
		     changeYear: true, //년변경가능
		     yearRange: 'c-10:c+20',
			 showMonthAfterYear: true
	  });
	  
	  
	  
	  
      <#list List as Info>
	   $("#ide_date${Info.il_seq!}").datepicker({
			  dateFormat: 'yy-mm-dd',
				monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			     dayNamesMin: ['일','월','화','수','목','금','토'],
				 changeMonth: true, //월변경가능
			     changeYear: true, //년변경가능
			     yearRange: 'c-10:c+20',
				 showMonthAfterYear: true
		  });
      </#list>
      
	  
	  
	  
	  
});

function InsertFrm()
{
	var infrm = document.InFrm;
	
	if(infrm.il_reg_date.value=="" || infrm.il_reg_date.value ==null)
	{
		alert("등록일자를 선택하세요.");
		infrm.il_reg_date.focus();
		return false;
	}
	if(infrm.il_item_name.value=="" || infrm.il_item_name.value ==null)
	{
		alert("품목명을 입력하세요.");
		infrm.il_item_name.focus();
		return false;
	}
	if(infrm.il_reg_amount.value=="" || infrm.il_reg_amount.value ==null || infrm.il_reg_amount.value == 0 )
	{
		alert("등록수량을 입력하세요.");
		infrm.il_reg_amount.focus();
		return false;
	}
	
	if(confirm("등록 하시겠습니까?"))
	{
		infrm.action="/InventoryInsertProc.joil";
		infrm.submit();	
	}
	
	
}


function test(seq)
{	
	var defrm = document.detFrm;
	
	if($("#ide_date"+seq).val()=="" || $("#ide_date"+seq).val() ==null)
	{
		alert("등록일자를 선택하세요.");
		$("#ide_date"+seq).focus();
		return false;
	}
	if($("#ide_company"+seq).val()=="" || $("#ide_company"+seq).val() ==null)
	{
		alert("입/출고처를 입력하세요.");
		$("#ide_company"+seq).focus();
		
		return false;
	}
	if($("#ide_person"+seq).val()=="" || $("#ide_person"+seq).val() ==null  )
	{
		alert("입/출고자 입력하세요.");
		$("#ide_person"+seq).focus();
		
		return false;
	}
	if($("#ide_amount"+seq).val()=="" || $("#ide_amount"+seq).val() ==null || $("#ide_amount"+seq).val() == 0 )
	{
		alert("수량을 입력하세요.");
		$("#ide_amount"+seq).focus();		
		return false;
	}
	
	
	if(confirm("등록 하시겠습니까?"))
	{	
		$("#ide_il_seq").val(seq);
		$("#ide_date").val($("#ide_date"+seq).val());
		$("#ide_gubun").val($("#ide_gubun"+seq).val());
		$("#ide_company").val($("#ide_company"+seq).val());
		$("#ide_person").val($("#ide_person"+seq).val());
		$("#ide_amount").val($("#ide_amount"+seq).val());
		$("#ide_etc").val($("#ide_etc"+seq).val());
		
		$("#detFrm").attr('action','/InventoryDetailInsertProc.joil');
		$("#detFrm").submit();
		
	}	
}
	
	
	function deleteCheck(seq)
	{
		var delfrm = document.delFrm;
		
		if(confirm("삭제하시겠습니까?\n세부내용도 함께 삭제됩니다."))
		{
			delfrm.il_seq.value= seq;
			delfrm.action="/InventoryDeleteProc.joil";
			delfrm.submit();
		}
	}
	
	function searchFrm()
	{
		
		var frm = document.sFrm;
		frm.search_date.value = $("#tmp_search_date").val();
		frm.search_word.value = $("#tmp_search_word").val();
		frm.submit();
	}
</script>

<form name="sFrm" id="sFrm" method="post">
<input type="hidden" name="search_word" id="search_word" >
<input type="hidden" name="search_date" id="search_date" >
</form>

<form name="delFrm" id="delFrm" method="post">
<input type="hidden" name="il_seq" id="il_seq" >
</form>

 <div class="col-md-12 col-sm-12 col-xs-12" >
              <div class="x_panel" >
                <div class="x_title">
                  <h2>${menutitle!}</h2>          
                  <ul class="nav navbar-right panel_toolbox">
                   <li>
                    	 <div class="input-group" class="col-md-4 col-sm-4 col-xs-4" >
	                      <label for="tmp_search_date"><span class="blind">등록일자</span></label>
	                      <input type="text" name="tmp_search_date" id ="tmp_search_date" class="form-control" style="width:100px;" placeholder="등록일자" value="${search_date!}">&nbsp;
	                      <label for="tmp_search_word"><span class="blind">검색어</span></label>
	                      <input type="text" name="tmp_search_word" id ="tmp_search_word" class="form-control" style="width:100px;" placeholder="품목명" value="${search_word!}">&nbsp;	                      
                          <span class="input-group-btn" style="float:left;">
                              <button type="button" class="btn btn-primary" onclick="javascript:searchFrm();return false;">검색</button>
                          </span>                         
                        </div>                    	
                    </li>                 
                    
                  </ul>      
                  <div class="clearfix"></div>
                </div>
                
                <form name="InFrm" id="InFrm" method="post" >                                                       
                  <table class="table table-striped projects" summary="${menutitle!}">
                   <caption ><span class="blind">${menutitle!}</span></caption>
                    <thead align="center">
                      <tr>
                        <th style="width: 5%; text-align:center;">등록일자</th>
                        <th style="width: 5%; text-align:center;">업체명</th>
                        <th style="width: 5%; text-align:center;">품목명</th>
                        <th style="width: 5%; text-align:center;">단위</th>
                        <th style="width: 5%; text-align:center;">규격</th>
                        <th style="width: 5%; text-align:center;">등록수량</th>
                        <th style="width: 5%; text-align:center;">재고수량</th>
                        <th style="width: 5%; text-align:center;">비고</th>
                        <th style="width: 5%; text-align:center;">관리</th>
                        
                      </tr>
                    </thead>
                    <tbody>
                    	<tr>                    	
                    		<td >
                    			<label class="control-label" for="il_reg_date"><span class="required blind">등록일자</span></label>		
			                    <input type="text" id="il_reg_date" name="il_reg_date" required="required" class="form-control col-md-7 col-xs-12" value="">
                    		</td>
                    		<td >
                    			<label class="control-label" for="il_co_name"><span class="required blind">업체명</span></label>		
			                    <input type="text" id="il_co_name" name="il_co_name" required="required" class="form-control col-md-7 col-xs-12" value="">
                    		</td>
                    		<td >
                    			<label class="control-label" for="il_item_name"><span class="required blind">품목명</span></label>		
			                    <input type="text" id="il_item_name" name="il_item_name" required="required" class="form-control col-md-7 col-xs-12" value="">
                    		</td>
                    		<td >
                    			<label class="control-label" for="il_unit"><span class="required blind">단위</span></label>		
			                    <input type="text" id="il_unit" name="il_unit" required="required" class="form-control col-md-7 col-xs-12" value="">
                    		</td>
                    		<td >
                    			<label class="control-label" for="il_standard"><span class="required blind">규격</span></label>		
			                    <input type="text" id="il_standard" name="il_standard" required="required" class="form-control col-md-7 col-xs-12" value="">
                    		</td>
                    		<td >
                    			<label class="control-label" for="il_reg_amount"><span class="required blind">등록수량</span></label>		
			                    <input type="text" id="il_reg_amount" name="il_reg_amount" required="required" class="form-control col-md-7 col-xs-12" value="0">
                    		</td>
                    		<td >
                    			<label class="control-label" for="il_inventory_amount"><span class="required blind">재고수량</span></label>		
			                    <input type="text" id="il_inventory_amount" name="il_inventory_amount" required="required" class="form-control col-md-7 col-xs-12" readonly="readonly" value="0">
                    		</td>
                    		<td >
                    			<label class="control-label" for="il_etc"><span class="required blind">비고</span></label>		
			                    <input type="text" id="il_etc" name="il_etc" required="required" class="form-control col-md-7 col-xs-12" value="">
                    		</td>
                    		<td>
	                          <button type="button" class="btn btn-round btn-success" onClick="javascript:InsertFrm();return false;">등록</button>
	                        </td>
                    	</tr>
                    	</tbody>
                  </table>
                  </form>
                
                <div class="x_content">
                  
                  
                  <!-- start project list -->
                  
                    
                  <table class="table table-striped projects" summary="${menutitle!}">
                   <caption style="padding-top:0px;padding-bottom:0px;"><span class="blind">${menutitle!}</span></caption>
                    <thead>
                      <tr>                        
                        <th style="width: 15%; text-align:center;">등록일자</th>
                        <th style="width: 15%; text-align:center;">업체명</th>
                        <th style="width: 10%; text-align:center;">품목명</th>
                        <th style="width: 10%; text-align:center;">등록수량</th>
                        <th style="width: 10%; text-align:center;">재고수량</th>
                        <th style="width: 10%; text-align:center;">규격</th>
                        <th style="width: 20%; text-align:center;">비고</th>
                        <th style="width: 5%; text-align:center;">관리</th>
                      </tr>
                    </thead>
                    <tbody>
                    <#if List!?default('0')?size &gt; 0 > 
                    <#list List as Info>
                   		<tr align="center">
                   			<td>${Info.il_reg_date?date}</td>
                   			<td>
                   				${Info.il_co_name!}
                   			</td>
                   			<td>
                   				
                   			<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".${Info.il_seq!}">${Info.il_item_name!}</button>
			                  <div class="modal fade ${Info.il_seq!}" tabindex="-1" role="dialog" aria-hidden="true">
			                    <div class="modal-dialog modal-lg">
			                      <div class="modal-content">	
			                        <div class="modal-header">
			                          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
			                          </button>
			                          <h4 class="modal-title" id="myModalLabel">${Info.il_item_name!} 재고 관리</h4>
			                        </div>
			                        <div class="modal-body">
			                        
			                        	<form name="detFrm" id="detFrm" method="post" >
			                        	<input type="hidden" name="ide_il_seq" id="ide_il_seq" >
			                        	<input type="hidden" name="ide_gubun" id="ide_gubun" >
			                        	<input type="hidden" name="ide_date" id="ide_date" >
			                        	<input type="hidden" name="ide_company" id="ide_company" >
			                        	<input type="hidden" name="ide_person" id="ide_person" >
			                        	<input type="hidden" name="ide_amount" id="ide_amount" >
			                        	<input type="hidden" name="ide_etc" id="ide_etc" >
			                        	
			                        	
			                        	<table class="table table-striped projects" summary="${menutitle!}">
						                   <caption style="padding-top:0px;padding-bottom:0px;"><span class="blind">${menutitle!} </span></caption>
						                    <thead>
						                      <tr align="center">
						                        <th style="width: 5%; text-align:center;">구분</th>
						                        <th style="width: 15%; text-align:center;">입/출고일자</th>
						                        <th style="width: 30%; text-align:center;">입/출고처</th>
						                        <th style="width: 20%; text-align:center;">입/출고자</th>
						                        <th style="width: 10%; text-align:center;">수량</th>
						                        <th style="width: 10%; text-align:center;">비고</th>
						                        <th style="width: 10%; text-align:center;">관리</th>
						                      </tr>
						                    </thead>
						                    <tbody>
						                    	<tr>
						                    		<td >
							                    			<select class="form-control" name="ide_gubun${Info.il_seq!}" id="ide_gubun${Info.il_seq!}" style="width:80px;">                        	
	                      										<option value="1">입고</option>
	                      										<option value="2">출고</option>
	                        								</select>
						                    		</td>
						                    		<td>
						                    			<label class="control-label" for="ide_date${Info.il_seq!}"><span class="required blind">입/출고일자</span></label>		
			                    						<input type="text" id="ide_date${Info.il_seq!}" name="ide_date${Info.il_seq!}" class="form-control col-md-7 col-xs-12" >
						                    		</td>
						                    		<td>
						                    			<label class="control-label" for="ide_company${Info.il_seq!}"><span class="required blind">입/출고처</span></label>		
			                    						<input type="text" id="ide_company${Info.il_seq!}" name="ide_company${Info.il_seq!}" class="form-control col-md-7 col-xs-12" >
						                    		</td>
						                    		<td>
						                    			<label class="control-label" for="ide_person${Info.il_seq!}"><span class="required blind">입/출고자</span></label>		
			                    						<input type="text" id="ide_person${Info.il_seq!}" name="ide_person${Info.il_seq!}" class="form-control col-md-7 col-xs-12" >
						                    		</td>
						                    		<td>	
						                    			<label class="control-label" for="ide_amount${Info.il_seq!}"><span class="required blind">수량</span></label>		
			                    						<input type="text" id="ide_amount${Info.il_seq!}" name="ide_amount${Info.il_seq!}" class="form-control col-md-7 col-xs-12" >
						                    		</td>
						                    		<td>
						                    			<label class="control-label" for="ide_etc${Info.il_seq!}"><span class="required blind">비고</span></label>		
			                    						<input type="text" id="ide_etc${Info.il_seq!}" name="ide_etc${Info.il_seq!}" class="form-control col-md-7 col-xs-12" >
						                    		</td>
						                    		<td>
						                    			<button type="button" class="btn btn-round btn-success" onclick="javascript:test(${Info.il_seq!});return false;">등록</button>
						                    		</td>
						                    	</tr>
						                    </tbody>
						                </table>
			                        	</form>
			                        	
			                        	
			                        	
			                        	<table class="table table-striped projects" summary="${menutitle!}">
						                   <caption style="padding-top:0px;padding-bottom:0px;"><span class="blind">${menutitle!} </span></caption>
						                    <thead>
						                      <tr align="center">
						                        <th style="width: 5%; text-align:center;">구분</th>
						                        <th style="width: 15%; text-align:center;">입/출고일자</th>
						                        <th style="width: 30%; text-align:center;">입/출고처</th>
						                        <th style="width: 20%; text-align:center;">입/출고자</th>
						                        <th style="width: 10%; text-align:center;">수량</th>
						                        <th style="width: 10%; text-align:center;">비고</th>
						                        
						                      </tr>
						                    </thead>
						                    <tbody>
						                    	<#assign count =0 > 
						                    	<#if Info.detailList??>
												<#list Info.detailList as DetailInfo>
						                    	<tr align="center">
						                    		<td><#if DetailInfo.ide_gubun! = '1' >입고 <#else> 출고 </#if></td>
						                    		<td>${DetailInfo.ide_date!?date }</td>
						                    		<td>${DetailInfo.ide_company! }</td>
						                    		<td>${DetailInfo.ide_person! }</td>
						                    		<td>${DetailInfo.ide_amount! }${Info.il_unit!}</td>
						                    		<td>${DetailInfo.ide_etc! }</td>
						                   		</tr>
						                   		<#assign count = count + DetailInfo.ide_amount > 
						                   		</#list>
						                		</#if>
						                 	</tbody>
						                 </table>
						                   		
						                    		
			                        	
			                        </div>
			                        
			                        <div class="modal-footer">
			                          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			                          <!-- <button type="button" class="btn btn-primary">Save changes</button> -->
			                        </div>
			
			                      </div>
			                    </div>
			                    
			                    
			                    
			                  </div>	
                   			</td>
                   			<td>${Info.il_reg_amount!}${Info.il_unit!}</td>
                   			<td>${Info.il_reg_amount + count }${Info.il_unit!}</td>
                   			<td>${Info.il_standard!}</td>
                   			<td>${Info.il_etc!}</td>
                   			<td>
                     		  <#-- <button onclick="location.href='/Inventory.joil?menuname=ItemUpdate&seq=${Info.pi_seq!?replace(',','')}'" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> 수정 </button> -->
	                          <a href="javascript:deleteCheck('${Info.il_seq!?replace(',','')}'); " class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> 삭제 </a>
	                      </td>
                   		</tr>
                   	</#list>
                   	</#if>
                    </tbody>
                  </table>
                  <!-- end project list -->

                </div>
                
                
               
                
              </div>
            </div>
