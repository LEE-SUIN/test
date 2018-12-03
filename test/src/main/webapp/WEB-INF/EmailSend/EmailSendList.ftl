<#ftl encoding="UTF-8"/>
<#assign tiles=JspTaglibs["http://tiles.apache.org/tags-tiles"] />
<#setting number_format=",###">

<script>
function InsertFrm(){
	var frm = document.InFrm;
	if(frm.el_name_seq.value==null || frm.el_name_seq.value=="")
	{		
		alert("성명을 선택하십시오.");
		frm.el_name_seq.focus();
		return false;
	}
	if(frm.el_email.value==null || frm.el_email.value=="")
	{		
		alert("이메일을 입력하십시오.");
		frm.el_email.focus();
		return false;
	}
	if(frm.el_year.value==null || frm.el_year.value=="")
	{		
		alert("년차를 입력하십시오.");
		frm.el_year.focus();
		return false;
	}
	frm.action="/EmailSendInsertProc.joil";
	frm.submit();
	
}

function deleteCheck(el_seq)
{
	var frm = document.delFrm;
	if(confirm("삭제하시겠습니까?")){
		frm.el_seq.value=el_seq;
		frm.submit();	
	}
	
}

function EmailSendUpdate(el_seq)
{
	var frm = document.upFrm;	
	frm.el_seq.value=el_seq;
	frm.submit();	
		
}

</script>
<form id="delFrm" name="delFrm" method="post" action="/EmailSendDeleteProc.joil">
<input type="hidden" name="el_seq" id="el_seq" value="">
</form>

<form id="upFrm" name="upFrm" method="post" action="/EmailSend.joil?menuname=EmailSendUpdate">
<input type="hidden" name="el_seq" id="el_seq" value="">
</form>

 <div class="col-md-12 col-sm-12 col-xs-12" style="overflow:auto; overflow-y:hidden;">
              <div class="x_panel" >
                <div class="x_title">
                  <h2>${menutitle!}</h2>          
                  <ul class="nav navbar-right panel_toolbox">
                   <li>
                    	 <div class="input-group" class="col-md-4 col-sm-4 col-xs-4" >
	                      
                        </div>                    	
                    </li>                 
                    
                  </ul>      
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  
                  <form name="InFrm" id ="InFrm" method="post" >
                                     
                  <table class="table table-striped projects" summary="${menutitle!}">
                   <caption style="padding-top:0px;padding-bottom:0px;"><span class="blind">${menutitle!}</span></caption>
                    <thead align="center">
                      <tr>
                        <th style="width: 25%; text-align:center;">성명</th>
                        <th style="width: *%; text-align:center;">Email</th>
                        <th style="width: 10%; text-align:center;">년차</th>
                        <th style="width: 15%; text-align:center;">관리</th>
                      </tr>
                    </thead>
                    <tbody>
                    	<tr>
                    		<td>
                    			<select class="form-control" name="el_name_seq" id="el_name_seq" >
							  	<option value="">선택</option>
		                       	<#list UserList as aInfo>
		                      	 <option value="${aInfo.su_seq!}" >${aInfo.su_name!}</option>
		                        </#list>
		                      </select>
                    		</td>                    		
                    		<td>
                    			<label class="control-label" for="el_email"><span class="required blind">이메일 *</span></label>		
			                    <input type="text" id="el_email" name="el_email" required="required" class="form-control col-md-7 col-xs-12" value="">
                    		</td>
                    		<td>
                    			<label class="control-label" for="el_year"><span class="required blind">년차 *</span></label>		
			                    <input type="text" id="el_year" name="el_year" required="required" class="form-control col-md-7 col-xs-12" value="">
                    		</td>
                    		<td >
                    			<button type="button" class="btn btn-round btn-success" onclick="javascript:InsertFrm();return false;">등록</button>
                    		</td>
                    	</tr>
                    	</tbody>
                  </table>
                  </form>
                  <!-- start project list -->
                  <table class="table table-striped projects" summary="${menutitle!}">
                   <caption style="padding-top:0px;padding-bottom:0px;"><span class="blind">${menutitle!}</span></caption>
                    <thead>
                      <tr>                        
                       <th style="width: 25%; text-align:center;">성명</th>
                        <th style="width: *%; text-align:center;">Email</th>
                        <th style="width: 10%; text-align:center;">년차</th>
                        <th style="width: 10%; text-align:center;">총액</th>
                        <th style="width: 10%; text-align:center;">공제액합계</th>
                        <th style="width: 10%; text-align:center;">수령액</th>
                        <th style="width: 15%; text-align:center;">관리</th>
                      </tr>
                    </thead>
                    <tbody>
                    <#if List!?default('0')?size &gt; 0 >
                    <#list List as Info>
	                    <tr>	                      
	                       <td style="text-align:center;">${Info.el_name!}</td>
	                       <td style="text-align:center;">${Info.el_email!}</td>
	                       <td style="text-align:center;">${Info.el_year!}</td>
	                       <td style="text-align:center;">${Info.el_give_1 + Info.el_give_2 + Info.el_give_3 + Info.el_give_4 + Info.el_give_5 }</td>
	                       <td style="text-align:center;">${Info.el_deduct_1 + Info.el_deduct_2 + Info.el_deduct_3 + Info.el_deduct_4 + Info.el_deduct_5}</td>
	                       <td style="text-align:center;">${Info.el_give_1 + Info.el_give_2 + Info.el_give_3 + Info.el_give_4 + Info.el_give_5  - (Info.el_deduct_1 + Info.el_deduct_2 + Info.el_deduct_3 + Info.el_deduct_4 + Info.el_deduct_5) }</td>
	                       <td style="text-align:center;">	                          
	                          <button onclick="javascript:EmailSendUpdate('${Info.el_seq!}');" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> 수정 </button>
	                          <a href="javascript:deleteCheck('${Info.el_seq!}'); " class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> 삭제 </a>
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
