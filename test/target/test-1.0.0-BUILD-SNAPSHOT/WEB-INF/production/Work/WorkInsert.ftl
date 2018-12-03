<#ftl encoding="UTF-8"/>
<#assign tiles=JspTaglibs["http://tiles.apache.org/tags-tiles"] />

<script>
$(function() {	 
	  $("#pw_work_date").datepicker({
		  dateFormat: 'yy-mm-dd',
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		     dayNamesMin: ['일','월','화','수','목','금','토'],
			 changeMonth: true, //월변경가능
		     changeYear: true, //년변경가능
		     yearRange: 'c-10:c+20',
			 showMonthAfterYear: true
	  }); 
 	  eChange();
	  
});
	function eChange()
	{
		var selval = $("select[name=pw_se_seq]").val();
		
		$.ajax({
	        type: "post",
	        url : "/getEnterpriseInfo.joil",
	        dataType : "json",
	        data: {
	        	pw_se_seq : selval
	        },
	      success : function(data) {	    	  
	    	  var listsize = data.elist.length;	    	
	    	  if(data.elist[0].se_group == "C") //자동차일 경우
	    	  {
	    		   $("#pw_se_group").val("C");
	    		   $("#pw_se_group_text").val("자동차");
	    		   $("#pw_se_group_temp").empty();
	    		   piChange();
	    	  }
	    	  if(data.elist[0].se_group == "E") //전자일 경우
	    	  {
	    		   $("#pw_pi_seq").empty();
	    		   $("#pw_se_group").val("E");
	    		   $("#pw_se_group_text").val("전자");
	    		   var tmp = "${WorkVo.pw_se_group_temp!}";	  
	    		   
	    		   $("#pw_se_group_temp").append("<option value='A'  >에이컨</option>");
	    		   $("#pw_se_group_temp").append("<option value='R'  >냉장고</option>");
	    		   $("#pw_se_group_temp").append("<option value='C'  >조리기구</option>");
	    		   $("#pw_se_group_temp").append("<option value='Z'  >시방</option>");
	    		   if(tmp == null || tmp ==""){ tmp = "A"; }
	    		   $("#pw_se_group_temp").val(tmp);
	    		   piChange();
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

	function piChange()
	{
		$("#pw_pi_seq").empty();
		var pw_se_seq =   $("#pw_se_seq").val();
		var pw_se_group =  $("#pw_se_group").val();
		var pw_se_group_temp =  $("#pw_se_group_temp").val();
				 
		$.ajax({
	        type: "post",
	        url : "/getItemList.joil",
	        dataType : "json",
	        data: {
	        	pi_e_seq : pw_se_seq,
	        	pi_group : pw_se_group,
	        	pi_group_temp : pw_se_group_temp
	        },
	      success : function(data) {	    	  
	    	  var listsize = data.ilist.length;	 
	    	  var list = data.ilist;
	    	  
	    	  var tmp_pw_pi_seq =  "${WorkVo.pw_pi_seq!}";
	    	  
	    	  for(var i=0;i<listsize;i++)
	    	  {   
	    		  $("#pw_pi_seq").append("<option value='"+list[i].pi_seq+"' >"+list[i].pi_joil_number+" ("+list[i].pi_name+") "+"</option>");
	    		  if(list[i].pi_seq == tmp_pw_pi_seq)
	    		  {	    			  
	    			  $("#pw_pi_seq").val(tmp_pw_pi_seq);
	    		  }
	    	  }
          },
          
          error : function(xhr, status, error) {
                alert("에러발생");
          }
     	});
		
	}
	
</script>
 <div class="col-md-10 col-sm-12 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>${menutitle!}</h2>                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <br />
                  <form id="frm" action="<#if WorkVo.pw_seq! &gt; 0>/WorkUpdateProc.joil<#else>/WorkInsertProc.joil</#if>" name="frm" method="post" data-parsley-validate class="form-horizontal form-label-left" >
                    <input type="hidden" id="seq" name="seq" value="${WorkVo.pw_seq!}" />                
                    <input type="hidden" id="pw_se_group" name="pw_se_group" value="" />
                    
                    
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pw_work_date">일자</label>
                      <div class="col-md-9 col-sm-9 col-xs-12">
                        <input type="text" id="pw_work_date" name="pw_work_date" required="required" class="form-control col-md-7 col-xs-12" value="${WorkVo.pw_work_date!?date?string('yyyy-MM-dd')}">
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pw_su_seq">성명</label>
                      <div class="col-md-3 col-sm-9 col-xs-12">
                        <select class="form-control" name="pw_su_seq" id="pw_su_seq" >
                        	<#list uList as uInfo>
                        		<option value="${uInfo.su_seq!}" <#if uInfo.su_seq! == WorkVo.pw_su_seq! >SELECTED</#if> >${uInfo.su_name!}</option>
                        	</#list>
                        </select>
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pw_se_seq">업체</label>
                      <div class="col-md-4 col-sm-9 col-xs-12">
                        <select class="form-control" name="pw_se_seq" id="pw_se_seq" onchange="javascript:eChange();">
                       		<#list EList as EInfo>
                        		<option value="${EInfo.se_seq!}" <#if EInfo.se_seq! == WorkVo.pw_se_seq! >SELECTED</#if> >${EInfo.se_name!}</option>
                        	</#list>
                        	
                        </select>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pw_se_group_text">분류
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="pw_se_group_text" name="pw_se_group_text"  class="form-control col-md-7 col-xs-12" readonly >
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pw_se_group_temp">세부 분류
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12" >
                        <select class='form-control' name='pw_se_group_temp' id='pw_se_group_temp' onchange='javascript:piChange();'>
                        
                        </select>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pw_pi_seq">품목</label>
                      <div class="col-md-6 col-sm-9 col-xs-12">
                        <select class="form-control" name="pw_pi_seq" id="pw_pi_seq">
                        	
                        </select>
                      </div>
                    </div>
                       <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pw_select_work">업무 선택</label>
                      <div class="col-md-6 col-sm-9 col-xs-12">
                        <select class="form-control" name="pw_select_work" id="pw_select_work">
                        	<#list wList as wInfo>
                        		<option value="${wInfo.sc_seq!}" <#if wInfo.sc_seq! == WorkVo.pw_select_work! >SELECTED</#if> >${wInfo.sc_name!}</option>
                        	</#list>
                        </select>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pw_su_job">작업</label>
                      <div class="col-md-2 col-sm-9 col-xs-12">
                        <select class="form-control" name="pw_su_job" id="pw_su_job">
                        	<#list jList as jInfo>
                        		<option value="${jInfo.sc_seq!}" <#if jInfo.sc_seq! == WorkVo.pw_su_job! >SELECTED</#if> >${jInfo.sc_name!}</option>
                        	</#list>
                        </select>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pw_pi_job_time">작업시간
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="pw_pi_job_time" name="pw_pi_job_time" required="required" class="form-control col-md-7 col-xs-12" value="${WorkVo.pw_pi_job_time!}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pw_etc1">비고1
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="pw_etc1" name="pw_etc1"  class="form-control col-md-7 col-xs-12" value="${WorkVo.pw_etc1!}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pw_etc2">비고2
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="pw_etc2" name="pw_etc2"  class="form-control col-md-7 col-xs-12" value="${WorkVo.pw_etc2!}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pw_etc3">비고3
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="pw_etc3" name="pw_etc3"  class="form-control col-md-7 col-xs-12" value="${WorkVo.pw_etc3!}">
                      </div>
                    </div>
                                                                   
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                        <button type="button" class="btn btn-primary" onClick="location.href='/Work.joil?menuname=WorkList'">취소</button>
                        <button type="submit" class="btn btn-success"><#if WorkVo.pw_seq! &gt; 0>수정<#else>등록</#if> </button>
                      </div>
                    </div> 

                  </form>
                </div>
              </div>
            </div>
            
            