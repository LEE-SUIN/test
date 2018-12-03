<#ftl encoding="UTF-8"/>
<#assign tiles=JspTaglibs["http://tiles.apache.org/tags-tiles"] />
<#setting number_format=",###">

<script>	
$(document).ready(function(){
	$(".bulk-result").hide(); 	
});
function result()
{	
}

function emailsend()
{	
	var chk = document.getElementsByName("table_records");
	var i=0,sum=0;
	var result=0;
	if(confirm("발송하시겠습니까?"))
	{
		for(i=0;i<chk.length;i++)
		{
			if(chk[i].checked == true)
			{				
				var email = $("#email"+chk[i].value).val();
				var contents= $("#data"+chk[i].value).html();
				var title= "상여금 명세서"+"("+$("#el_bonus_percent"+chk[i].value).val()+" %)";
				result = result + sendProc(email,contents,title);				
				sum++;
			}
		}		
		if(sum==0){alert("발송할 인원을 체크해주세요."); return false;}
		if(result == 0)
		{
				alert("발송 완료하였습니다.");
		}
	}
	
	//alert();
				
}

function sendProc(email,contents,title)
{	
	
	var result=1;
	$.ajax({
        type: "post",
        url : "/EmailSendBonusProc.joil",
        dataType : "json", 
        async: false,
        data: {
        	email : email,
        	contents : contents,
        	title : title
        },
      success : function(data) {    	  
    	  if(data.resultCnt != 1 )
    	  {
    		  alert(data.email+"메일이 정상적으로 발송되지 않았습니다.");
    	  }else //성공적
    	  {
    		  result=0;
    	  }
      },
      error : function(xhr, status, error) {
            alert("에러발생");
      }
 	});	
	return result;
}

function ModifyFrm(el_seq)
{
	var frm = document.mFrm;
	if(confirm("수정하시겠습니까?"))
	{
		frm.el_seq.value= el_seq;
		frm.el_bonus.value = $("#el_bonus"+el_seq).val().replace(/,/g, '');
		frm.el_bonus_1.value = $("#el_bonus_1"+el_seq).val().replace(/,/g, '');
		frm.el_bonus_2.value = $("#el_bonus_2"+el_seq).val().replace(/,/g, '');
		frm.el_bonus_percent.value = $("#el_bonus_percent"+el_seq).val().replace(/,/g, '');

		
		frm.action="/EmailSendBonusUpdateProc.joil";
		frm.submit();
	}
	
}


</script>

<form name="mFrm" id="mFrm" method="post">
	<input type="hidden" name="el_seq" id="el_seq" />
	<input type="hidden" name="el_bonus" id="el_bonus" />
	<input type="hidden" name="el_bonus_1" id="el_bonus_1" />
	<input type="hidden" name="el_bonus_2" id="el_bonus_2" />
	<input type="hidden" name="el_bonus_percent" id="el_bonus_percent" />		
</form>


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
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
						 <p>발송할 인원을 체크해주세요.</p>

                    <div class="table-responsive">
                      <table class="table table-striped jambo_table bulk_action">
                        <thead>
                          <tr class="headings">
                            <th>
                              <input type="checkbox" id="check-all" class="flat">
                            </th>
                            <th class="column-title">성명 </th>                           
                            <th class="column-title">상여금 </th>
                            <th class="column-title no-link last"><span class="nobr">내용</span>
                            </th>                            
                            <th class="bulk-actions" colspan="7">
                              <a class="antoo" style="color:#fff; font-weight:500;">Bulk Actions ( <span class="action-cnt"> </span> ) <i class="fa fa-chevron-down"></i></a>
                            </th>
                          </tr>
                        </thead>


                        <tbody>
                        <#if List!?default('0')?size &gt; 0 >
                  		<#list List as Info>
                  		<input type="hidden" name="email${Info.el_seq!}" id="email${Info.el_seq!}" value="${Info.el_email!}" />
                          <tr class="even pointer">
                            <td class="a-center ">
                              <input type="checkbox" class="flat" name="table_records" value="${Info.el_seq!}">
                            </td>
                            <td class=" ">${Info.el_name!}</td>                            
                            <td class="a-right a-right ">${Info.el_bonus - (Info.el_bonus_1 + Info.el_bonus_2)}</td>
                            <td class=" last"><a data-toggle="modal" data-target=".${Info.el_seq!}">보기</a></td>
                          </tr>
                          </#list>
                  		  </#if>
                          
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
                 

                </div>                
               
              </div>
            </div>
            
            <!-- 모달 팝업   -->
            <!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">Large modal</button> -->
            <#assign month = .now?date?string('MM') />
            <#assign year = .now?date?string('YY') />
            
            <#assign el_give_sum = 0 ?int >
			<#assign el_deduct_sum= 0 ?int >
			
			<#if List!?default('0')?size &gt; 0 > 
            <#list List as Info>
                  <div  class="modal fade ${Info.el_seq!}" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                      <div class="modal-content" style="width:600px;">
                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                          </button>
                          <h4 class="modal-title" id="myModalLabel">${Info.el_name!} </h4>
                        </div>
                        <div class="modal-body " id="data${Info.el_seq!}" style="width:500px;">
                          <h2 style="width:500px;" class="panel-title" align="center"><font color="black" size="5">상여금 명세서 ( <input type="number" name="el_bonus_percent${Info.el_seq!}" id="el_bonus_percent${Info.el_seq!}" value="${Info.el_bonus_percent!}" style="border:none;text-align:right;width:50px;font-size:25px;" /> %)</font></h2>
                            <br/>
                            
                            <table style="text-align:center; width:500px; height:80px; font-color:black; border-collapse: collapse; border:3px black solid; "cellpadding="5" cellspacing="0"" >
                            	<tr>
                            		<td style="text-align:center;border:1px black solid;width:100px;"><font color="black" size="3">성 명</font></td><td style="text-align:center;border:1px black solid;width:150px;"><font color="black" size="3">${Info.el_name!}</font></td>
                            		<td style="text-align:center;border:1px black solid;width:100px;"><font color="black" size="3">회 사 명</font></td><td style="text-align:center;border:1px black solid;width:150px;"><font color="black" size="3">(주) 조 일</font></td>
                            		
                            	</tr>
                            	<tr>
                            		<td style="text-align:center;border:1px black solid;width:100px;"><font color="black" size="3">직 책</font></td><td style="text-align:center;border:1px black solid;width:150px;"><font color="black" size="3">${Info.el_grade!}</font></td>
                            		<td style="text-align:center;border:1px black solid;width:100px;"><font color="black" size="3">소 속</font></td><td style="text-align:center;border:1px black solid;width:150px;"><font color="black" size="3"><input type="text" id="el_department${Info.el_seq!}" name="el_department${Info.el_seq!}" value="${Info.el_department!}" style="border:none;text-align:center;width:125px;font-size:3;"></font></td>
                            	</tr>
                            </table>
                            <br/><br/>
                            	                       
                            <table style="text-align:center; width:500px; height:500px; font-color:black; border-collapse: collapse; border:3px black solid; "cellpadding="5" cellspacing="0"" >
                              <thead>
                                <tr>
                                  <th colspan="2" style="text-align:center;border:1px black solid; width:250px;"><font color="black" size="4">급 여 내 역</font></th>
                                  <th colspan="2" style="text-align:center;border:1px black solid; width:250px;"><font color="black" size="4">공 제 내 역</font></th>
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                	<td style="border:1px black solid;width:125px;"><font color="black" size="3">상여금</font></td><td style="border:1px black solid;width:125px;"><font color="black" size="3"><input type="number" name="el_bonus${Info.el_seq!}" id="el_bonus${Info.el_seq!}" value="${Info.el_bonus!}" style="border:none;text-align:right;width:100px;" />&nbsp;&nbsp;</font></td>
                                    <td style="border:1px black solid;width:125px;"><font color="black" size="3">갑근세</font></td><td style="border:1px black solid;width:125px;"><font color="black" size="3"><input type="number" name="el_bonus_1${Info.el_seq!}" id="el_bonus_1${Info.el_seq!}" value="${Info.el_bonus_1!}" style="border:none;text-align:right;width:100px;" />&nbsp;&nbsp;</font></td>
                                </tr>
                                <tr>
                                	<td style="border:1px black solid;width:125px;"><font color="black" size="3"></font></td><td style="border:1px black solid;width:125px;"><font color="black" size="3"><input type="number" name="" id="" value="" style="border:none;text-align:right;width:100px;" />&nbsp;&nbsp;</font></td>
                                    <td style="border:1px black solid;width:125px;"><font color="black" size="3">주민세</font></td><td style="border:1px black solid;width:125px;"><font color="black" size="3"><input type="number" name="el_bonus_2${Info.el_seq!}" id="el_bonus_2${Info.el_seq!}" value="${Info.el_bonus_2!}" style="border:none;text-align:right;width:100px;" />&nbsp;&nbsp;</font></td>
                                </tr>
                                <tr>
                                	<td style="border:1px black solid;width:125px;"><font color="black" size="3"></font></td><td style="border:1px black solid;width:125px;"><font color="black" size="3"><input type="number" name="" id="" value="" style="border:none;text-align:right;width:100px;" />&nbsp;&nbsp;</font></td>
                                    <td style="border:1px black solid;width:125px;"><font color="black" size="3"></font></td><td style="border:1px black solid;width:125px;"><font color="black" size="3"><input type="number" name="" id="" value="" style="border:none;text-align:right;width:100px;" />&nbsp;&nbsp;</font></td>
                                </tr>
                                <tr>
                                	<td style="border:1px black solid;width:125px;"><font color="black" size="3"></font></td><td style="border:1px black solid;width:125px;"><font color="black" size="3"><input type="number" name="" id="" value="" style="border:none;text-align:right;width:100px;" />&nbsp;&nbsp;</font></td>
                                    <td style="border:1px black solid;width:125px;"><font color="black" size="3"></font></td><td style="border:1px black solid;width:125px;"><font color="black" size="3"><input type="number" name="" id="" value="" style="border:none;text-align:right;width:100px;" />&nbsp;&nbsp;</font></td>
                                </tr>
                                <tr>
                                	<td style="border:1px black solid;width:125px;"><font color="black" size="3"></font></td><td style="border:1px black solid;width:125px;"><font color="black" size="3"><input type="number" name="" id="" value="" style="border:none;text-align:right;width:100px;" />&nbsp;&nbsp;</font></td>
                                    <td style="border:1px black solid;width:125px;"><font color="black" size="3"></font></td><td style="border:1px black solid;width:125px;"><font color="black" size="3"><input type="number" name="" id="" value="" style="border:none;text-align:right;width:100px;" />&nbsp;&nbsp;</font></td>
                                </tr>
                                <tr>
                                	<td style="border:1px black solid;width:125px;"><font color="black" size="3"></font></td><td style="border:1px black solid;width:125px;"><font color="black" size="3"><input type="number" name="" id="" value="" style="border:none;text-align:right;width:100px;" />&nbsp;&nbsp;</font></td>
                                    <td style="border:1px black solid;width:125px;"><font color="black" size="3"></font></td><td style="border:1px black solid;width:125px;"><font color="black" size="3"><input type="number" name="" id="" value="" style="border:none;text-align:right;width:100px;" />&nbsp;&nbsp;</font></td>
                                </tr>
                                <tr>
                                	<td style="border:1px black solid;width:125px;"><font color="black" size="3"></font></td><td style="border:1px black solid;width:125px;"><font color="black" size="3"><input type="number" name="" id="" value="" style="border:none;text-align:right;width:100px;" />&nbsp;&nbsp;</font></td>
                                    <td style="border:1px black solid;width:125px;"><font color="black" size="3"></font></td><td style="border:1px black solid;width:125px;"><font color="black" size="3"><input type="number" name="" id="" value="" style="border:none;text-align:right;width:100px;" />&nbsp;&nbsp;</font></td>
                                </tr>
                                <tr>
                                	<td style="border:1px black solid;width:125px;"><font color="black" size="3"></font></td><td style="border:1px black solid;width:125px;"><font color="black" size="3"><input type="number" name="" id="" value="" style="border:none;text-align:right;width:100px;" />&nbsp;&nbsp;</font></td>
                                    <td style="border:1px black solid;width:125px;"><font color="black" size="3"></font></td><td style="border:1px black solid;width:125px;"><font color="black" size="3"><input type="number" name="" id="" value="" style="border:none;text-align:right;width:100px;" />&nbsp;&nbsp;</font></td>
                                </tr>
                                <tr>
                                	<td style="border:1px black solid;width:125px;"><font color="black" size="3"></font></td><td style="border:1px black solid;width:125px;"><font color="black" size="3"><input type="number" name="" id="" value="" style="border:none;text-align:right;width:100px;" />&nbsp;&nbsp;</font></td>
                                    <td style="border:1px black solid;width:125px;"><font color="black" size="3"></font></td><td style="border:1px black solid;width:125px;"><font color="black" size="3"><input type="number" name="" id="" value="" style="border:none;text-align:right;width:100px;" />&nbsp;&nbsp;</font></td>
                                </tr>
                                <tr>
                                	<td style="border:1px black solid;width:125px;"><font color="black" size="3"></font></td><td style="border:1px black solid;width:125px;"><font color="black" size="3"><input type="number" name="" id="" value="" style="border:none;text-align:right;width:100px;" />&nbsp;&nbsp;</font></td>
                                    <td style="border:1px black solid;width:125px;"><font color="black" size="3"></font></td><td style="border:1px black solid;width:125px;"><font color="black" size="3"><input type="number" name="" id="" value="" style="border:none;text-align:right;width:100px;" />&nbsp;&nbsp;</font></td>
                                </tr>
                                <tr>
                                	<td style="border:1px black solid;width:125px;"><font color="black" size="3"></font></td><td style="border:1px black solid;width:125px;"><font color="black" size="3"><input type="number" name="" id="" value="" style="border:none;text-align:right;width:100px;" />&nbsp;&nbsp;</font></td>
                                    <td style="border:1px black solid;width:125px;"><font color="black" size="3"></font></td><td style="border:1px black solid;width:125px;"><font color="black" size="3"><input type="number" name="" id="" value="" style="border:none;text-align:right;width:100px;" />&nbsp;&nbsp;</font></td>
                                </tr>
                                <tr>
                                	<td style="border:1px black solid;width:125px;"><font color="black" size="3"></font></td><td style="border:1px black solid;width:125px;"><font color="black" size="3"><input type="number" name="" id="" value="" style="border:none;text-align:right;width:100px;" />&nbsp;&nbsp;</font></td>
                                    <td style="border:1px black solid;width:125px;"><font color="black" size="3">합 계</font></td><td style="border:1px black solid;width:125px;"><font color="black" size="3">${Info.el_bonus - (Info.el_bonus_1 + Info.el_bonus_2)  }&nbsp;&nbsp;</font></td>
                                </tr>
                              </tbody>
                            </table>
                            
                            <br/>
                          
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-primary" onclick="javascript:ModifyFrm('${Info.el_seq!}');">수정</button>
                          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        </div> 

                      </div>
                    </div>
                  </div>
            </#list>
            </#if>
			