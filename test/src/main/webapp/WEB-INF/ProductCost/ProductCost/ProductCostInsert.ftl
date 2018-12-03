<#ftl encoding="UTF-8"/>
<#assign tiles=JspTaglibs["http://tiles.apache.org/tags-tiles"] />

<script>

//[] <--문자 범위 [^] <--부정 [0-9] <-- 숫자  
//[0-9] => \d , [^0-9] => \D
var rgx1 = /\D/g;  // /[^0-9]/g 와 같은 표현
var rgx2 = /(\d+)(\d{3})/; 

function getNumber(obj){
	
   var num01;
   var num02;
   num01 = obj.value;
   num02 = num01.replace(rgx1,"");
   num01 = setComma(num02);
   obj.value =  num01;

}

function setComma(inNum){
   
   var outNum;
   outNum = inNum; 
   while (rgx2.test(outNum)) {
        outNum = outNum.replace(rgx2, '$1' + ',' + '$2');
    }
   return outNum;

}


$(document).ready(function(){
	getItemList();
	getGroup();
});

$(function() {	 
	  $("#pl_date").datepicker({
		  dateFormat: 'yy-mm-dd',
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		     dayNamesMin: ['일','월','화','수','목','금','토'],
			 changeMonth: true, //월변경가능
		     changeYear: true, //년변경가능
		     yearRange: 'c-10:c+20',
			 showMonthAfterYear: true
	  });
	  
});
function getItemList()
{	
	$("#pl_pi_seq").empty();
	var pl_se_seq =   $("#pl_se_seq").val();		 
	$.ajax({
        type: "post",
        url : "/getItemList.joil",
        dataType : "json",
        data: {
        	pi_e_seq : pl_se_seq
        },
      success : function(data) {	    	  
    	  var listsize = data.ilist.length;	 
    	  var list = data.ilist;
    	  
    	  var tmp_pl_pi_seq =  "${ProductCostVo.pl_pi_seq!}";
    	  
    	  for(var i=0;i<listsize;i++)
    	  {       		  
    		  $("#pl_pi_seq").append("<option value='"+list[i].pi_seq+"' >"+list[i].pi_joil_number+" ("+list[i].pi_name+") "+"</option>");
    		  if(list[i].pi_seq == tmp_pl_pi_seq)
    		  {	    			  
    			  $("#pl_pi_seq").val(tmp_pl_pi_seq);
    		  }
    	  }
      },
      
      error : function(xhr, status, error) {
            alert("에러발생");
      }
 	});
	
}


function getGroup()
{
	var selval = $("select[name=pl_sc_seq]").val();
	getOutSideEnterPrise();
	$.ajax({
        type: "post",
        url : "/getOutSideGroupInfo.joil",
        dataType : "json",
        data: {
        	ow_sc_seq : selval
        },
      success : function(data) {	    	  
    	  var listsize = data.gList.length; 
    	  var list = data.gList;
    	  var tmpstr="";
    	  if(listsize > 0) // 해당 분류의 데이터가 코드에 존재한다면.
   		  {
    		  for(var i=0;i<listsize;i++)
	    	  {   
	    		 tmpstr = tmpstr+"<option value='"+list[i].sc_seq+"' <#if "+list[i].sc_seq+" == ProductCostVo.pl_ow_group!?string >selected</#if> >"+list[i].sc_name+"</option>";
	    	  }
    		  $("#pl_ow_group").replaceWith('<select id="pl_ow_group" name="pl_ow_group" class="form-control"  onchange="javascript:getGroupDetail();"  >'+tmpstr+'</select>');
    		  if("${ProductCostVo.pl_ow_group!}" != '')
    	      {
    			  $("#pl_ow_group").val("${ProductCostVo.pl_ow_group!}");  
    	      }
    		  getGroupDetail();
   		  }
    	  else
   		  {
    		  $("#pl_ow_group").val("");
    		  $("#pl_ow_group_detail").replaceWith('<input type="text" name="pl_ow_group_detail" id="pl_ow_group_detail" class="form-control col-md-7 col-xs-12" value="${ProductCostVo.pl_ow_group_detail!}" />');
    		  $("#pl_ow_group").prop( "disabled", true );
    		  //$("#pl_ow_group").replaceWith('<input type="text" name="pl_ow_group" id="pl_ow_group" class="form-control col-md-7 col-xs-12" />');
    	  }
    	  
    	  
    	   
    	  /* 
    	  data.glist[0].se_group 
    	     
    		   $("#pw_se_group_temp").append("<option value='A'  >에이컨</option>");
    		   $("#pw_se_group_temp").append("<option value='R'  >냉장고</option>");
    		   $("#pw_se_group_temp").append("<option value='C'  >조리기구</option>");
    		   $("#pw_se_group_temp").append("<option value='Z'  >시방</option>");
    	  
    	   */
      },
      /* complete : function(data) {
    	  alert(data);
      }, */
      error : function(xhr, status, error) {
            alert("에러발생");
      }
 	});

}

//가공 업체 목록
function getOutSideEnterPrise()
{
	var selval = $("select[name=pl_sc_seq]").val();
	
	$.ajax({
        type: "post",
        url : "/getOutSideEnterPrise.joil",
        dataType : "json",
        data: {
        	oe_items : selval
        },
      success : function(data) {	    	  
    	  var listsize = data.oeList.length; 
    	  var list = data.oeList;
    	  var tmpstr="";
    	  if(listsize > 0) // 해당 분류의 데이터가 코드에 존재한다면.
   		  {
    		  for(var i=0;i<listsize;i++)
	    	  {   
	    		 tmpstr = tmpstr+"<option value='"+list[i].oe_seq+"' >"+list[i].oe_name+"</option>";
	    	  }
    		  $("#pl_oe_seq").replaceWith('<select id="pl_oe_seq" name="pl_oe_seq" class="form-control"  >'+tmpstr+'</select>');
    		  if("${ProductCostVo.pl_oe_seq!}" != '')
    	      {
    			  $("#pl_oe_seq").val("${ProductCostVo.pl_oe_seq!}");  
    	      }
    		  
    		    
   		  }
    	  
      },
      /* complete : function(data) {
    	  alert(data);
      }, */
      error : function(xhr, status, error) {
            alert("에러발생");
      }
 	});

}


function getGroupDetail()
{
var selval = $("select[name=pl_ow_group]").val();
	
	$.ajax({
        type: "post",
        url : "/getOutSideGroupDetailInfo.joil",
        dataType : "json",
        data: {
        	pl_ow_group : selval
        },
      success : function(data) {	    	  
    	  var listsize = data.dList.length; 
    	  var list = data.dList;
    	  var tmpstr="";
    	  if(listsize > 0) // 해당 분류의 데이터가 코드에 존재한다면.
   		  {
    		  for(var i=0;i<listsize;i++)
	    	  {   
	    		 tmpstr = tmpstr+"<option value='"+list[i].ow_seq+"' <#if "+list[i].ow_seq+" == ProductCostVo.pl_ow_group_detail! >selected</#if> >"+list[i].ow_name+"</option>";
	    	  }
    		  $("#pl_ow_group_detail").replaceWith('<select id="pl_ow_group_detail" name="pl_ow_group_detail" class="form-control"    >'+tmpstr+'</select>');
    		  if("${ProductCostVo.pl_ow_group_detail!}" != '')
    	      {
    			  $("#pl_ow_group_detail").val("${ProductCostVo.pl_ow_group_detail!}");  
    	      }
    		  
   		  }
    	  else
   		  {
    		  //$("#pl_ow_group_detail").val("");
    		  //$("#pl_ow_group_detail").prop( "disabled", true );
    		  $("#pl_ow_group_detail").replaceWith('<input type="text" name="pl_ow_group_detail" id="pl_ow_group_detail" class="form-control col-md-7 col-xs-12" value="${ProductCostVo.pl_ow_group_detail!}"/>');
    	  }
    	  
    	  
    	  /* 
    	  data.glist[0].se_group 
    	     
    		   $("#pw_se_group_temp").append("<option value='A'  >에이컨</option>");
    		   $("#pw_se_group_temp").append("<option value='R'  >냉장고</option>");
    		   $("#pw_se_group_temp").append("<option value='C'  >조리기구</option>");
    		   $("#pw_se_group_temp").append("<option value='Z'  >시방</option>");
    	  
    	   */
      },
      /* complete : function(data) {
    	  alert(data);
      }, */
      error : function(xhr, status, error) {
            alert("에러발생");
      }
 	});
}

</script>

 <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>${menutitle!}</h2>                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <br />
                  <form id="frm" action="<#if ProductCostVo.pl_seq! &gt; 0>/ProductCostUpdateProc.joil<#else>/ProductCostInsertProc.joil</#if>" name="frm" method="post" data-parsley-validate class="form-horizontal form-label-left" >
                    <input type="hidden" id="seq" name="seq" value="${ProductCostVo.pl_seq!}" />                
                                                           
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pl_name">업체명
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      	<select class="form-control" name="pl_se_seq" id="pl_se_seq" onchange="javascript:getItemList();">
                        	<#list EList as eInfo>
                      			<option value="${eInfo.se_seq!}" <#if eInfo.se_seq! == ProductCostVo.pl_se_seq! >selected</#if> >${eInfo.se_name!}</option>
                            </#list>
                        </select>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pl_pi_seq">품목</label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <select class="form-control" name="pl_pi_seq" id="pl_pi_seq" >
                        	
                        </select>
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pl_sc_seq">가공 종류</label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <select class="form-control" name="pl_sc_seq" id="pl_sc_seq" onchange="javascript:getGroup();">
                        	<#list jList as jInfo>
                      			<option value="${jInfo.sc_seq!}" <#if jInfo.sc_seq! == ProductCostVo.pl_sc_seq! >selected</#if> >${jInfo.sc_name!}</option>
                            </#list>
                        </select>
                      </div>
                    </div>
                    
                     <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pl_sc_seq">가공 업체</label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <select class="form-control" name="pl_oe_seq" id="pl_oe_seq" >
                            
                        </select>
                        
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pl_ow_group" >분류
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="pl_ow_group" name="pl_ow_group" class="form-control col-md-7 col-xs-12" value="${ProductCostVo.pl_ow_group!}" >
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pl_ow_group_detail">분류 세부내용
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="pl_ow_group_detail" name="pl_ow_group_detail" class="form-control col-md-7 col-xs-12" value="${ProductCostVo.pl_ow_group!}">
                      </div>
                    </div>
                                        
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pl_date">가공 일자
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="pl_date" name="pl_date" class="form-control col-md-7 col-xs-12" value="${ProductCostVo.pl_date!?date?string('yyyy-MM-dd')}">
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pl_price">가격
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="pl_price" name="pl_price" class="form-control col-md-7 col-xs-12" value="${ProductCostVo.pl_price!}" onchange="getNumber(this);" onkeyup="getNumber(this);" >
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pl_amount">수량
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="number" id="pl_amount" name="pl_amount" class="form-control col-md-7 col-xs-12" value="${ProductCostVo.pl_amount!}">
                      </div>
                    </div>
                    
                    
                    
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pl_etc1">비고1
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="pl_etc1" name="pl_etc1" class="form-control col-md-7 col-xs-12" value="${ProductCostVo.pl_etc1!}">
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pl_etc2">비고2
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="pl_etc2" name="pl_etc2" class="form-control col-md-7 col-xs-12" value="${ProductCostVo.pl_etc2!}">
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pl_etc3">비고3
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="pl_etc3" name="pl_etc3" class="form-control col-md-7 col-xs-12" value="${ProductCostVo.pl_etc3!}">
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="use_yn">사용 여부
                      </label>
                        <div class="radio">
                          <label>
                            <input type="radio" class="flat" <#if ProductCostVo.use_yn!?default('Y') =='Y'>checked</#if> name="use_yn" id="use_yn" value="Y"> 사용 함
                            <input type="radio" class="flat" <#if ProductCostVo.use_yn!?default('Y') =='N'>checked</#if> name="use_yn" id="use_yn" value="N"> 사용 안 함
                          </label>
                        </div>
                    </div>
                                      
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                        <button type="button" class="btn btn-primary" onClick="location.href='/ProductCost.joil?menuname=ProductCostList'">취소</button>
                        <button type="submit" class="btn btn-success"><#if ProductCostVo.pl_seq! &gt; 0>수정<#else>등록</#if> </button>
                      </div>
                    </div> 

                  </form>
                </div>
              </div>
            </div>
            
            