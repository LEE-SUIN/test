<#ftl encoding="UTF-8"/>
<#assign tiles=JspTaglibs["http://tiles.apache.org/tags-tiles"] />
<#setting number_format=",###">

<script>
$(document).ready(function(){
	
$("#check_all").click(function() {
	$("input:checkbox[name=check_row]").prop("checked", true);
});

$("#uncheck_all").click(function() {
	$("input:checkbox[name=check_row]").prop("checked", false);
});

});

function emailsend()
{
	var frm = document.subFrm;
	var i, sum=0;
	var tot = frm.check_row.length;
	var chkbox = frm.check_row;
	
	    for (i = 0; i < tot; i++) {
	     if(chkbox[i].checked)
	    	 {
	    	 	alert(i);
	    	 }
	    }
	 
	//if(confirm("발송 하시겠습니까?"))	{	} 
}

</script>

 <div class="col-md-12 col-sm-12 col-xs-12" style="overflow:auto; overflow-y:hidden;">
              <div class="x_panel" >
                <div class="x_title">
                  <h2>${menutitle!}</h2>          
                  <ul class="nav navbar-right panel_toolbox">
                   <li>
                    	<div class="input-group" class="col-md-4 col-sm-4 col-xs-4" >
	                    	  <button type="button" class="btn btn-round btn-success" onclick="javascript:emailsend();">발송</button>
                        </div>                    	
                    </li>                 
                    
                  </ul>      
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  
                <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2><i class="fa fa-align-left"></i>발송 목록</h2>
                    	<button type="button" class="btn btn-round btn-primary" id="check_all" >전체 선택</button>
                    	<button type="button" class="btn btn-round btn-warning" id="uncheck_all" >전체 취소</button>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
					<form name="subFrm" id="subFrm">
                    <!-- start accordion -->
                    <div class="accordion" id="accordion" role="tablist" aria-multiselectable="true">
                    <#if List!?default('0')?size &gt; 0 >
                    <#list List as Info>
                      <div class="panel" id="email${Info.el_seq!}" >
                      <a style="width:50%;" class="panel-heading"><input type="checkbox" name="check_row" id="check_${Info.el_seq!}" value="${Info.el_seq!}"></a>
                        <a style="width:50%;" class="panel-heading" role="tab" id="headingOne" data-toggle="collapse" data-parent="#accordion" href="#${Info.el_name!}${Info.el_seq!}" aria-expanded="true" aria-controls="collapseOne">
                          <h4 class="panel-title">${Info.el_name!}&nbsp;</h4>
                                                    
                        </a>
                        
                        
                        <div style="width:500px;" id="${Info.el_name!}${Info.el_seq!}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                          <div class="panel-body">
                            <h2 class="panel-title" align="right">급여명세서 (${.now?date?string('MM')}월) (수고 하셨습니다.)<br/>${Info.el_name!}</h2>
                            <br/>
                            <table class="table table-bordered" style="text-align:center;">
                              <thead>
                                <tr >
                                  <th colspan="2" style="text-align:center;">지급내역</th>
                                  <th colspan="2" style="text-align:center;">공제내역</th>
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                	<td>기본급</td><td>${Info.el_give_1!}</td>
                                    <td>갑근세</td><td>${Info.el_deduct_1!}</td>
                                </tr>
                                <tr>
                                	<td>직책수당</td><td>${Info.el_give_2!}</td>
                                    <td>주민세</td><td>${Info.el_deduct_2!}</td>
                                </tr>
                                <tr>
                                	<td>식대</td><td>${Info.el_give_3!}</td>
                                    <td>국민연금</td><td>${Info.el_deduct_3!}</td>
                                </tr>
                                <tr>
                                	<td>잔업,특근</td><td>${Info.el_give_4!}</td>
                                    <td>건강보험</td><td>${Info.el_deduct_4!}</td>
                                </tr>
                                <tr>
                                	<td>교통비</td><td>${Info.el_give_5!}</td>
                                    <td>고용보험</td><td>${Info.el_deduct_5!}</td>
                                </tr>   
                                <tr >
                                	<td>&nbsp;</td><td>&nbsp;</td>
                                	<td>&nbsp;</td><td>&nbsp;</td>
                                </tr>  
                                <tr>
                                	<td>총액</td><td>${Info.el_give_1 + Info.el_give_2 + Info.el_give_3 + Info.el_give_4 + Info.el_give_5 }</td>
                                    <td>공제액합계</td><td>${Info.el_deduct_1 + Info.el_deduct_2 + Info.el_deduct_3 + Info.el_deduct_4 + Info.el_deduct_5}</td>
                                </tr> 
                                <tr>
                                	<td colspan="2" style="text-align:center;"><b>수령액</b></td>
                                	<td colspan="2">${Info.el_give_1 + Info.el_give_2 + Info.el_give_3 + Info.el_give_4 + Info.el_give_5  - (Info.el_deduct_1 + Info.el_deduct_2 + Info.el_deduct_3 + Info.el_deduct_4 + Info.el_deduct_5) }</td>
                                </tr>                                                      
                              </tbody>
                            </table>
                            <h3 class="panel-title" align="right">년차   ${Info.el_year!} 개&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(주) 조 일</h3>  
                          </div>
                        </div>
                      </div>
                      </#list>
                    </#if> 
                    </div>
                    <!-- end of accordion -->

					</form>
                  </div>
                </div>
              </div>
                 

                </div>                
               
              </div>
            </div>
