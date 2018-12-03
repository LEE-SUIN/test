<#ftl encoding="UTF-8"/>
<#assign tiles=JspTaglibs["http://tiles.apache.org/tags-tiles"] />

<script>
$(document).ready(function(){
	getGroup();
});

function getGroup()
{
	var selval = $("select[name=ow_sc_seq]").val();
	
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
	    		 tmpstr = tmpstr+"<option value='"+list[i].sc_seq+"' >"+list[i].sc_name+"</option>";
	    	  }
    		  $("#ow_group").replaceWith('<select id="ow_group" name="ow_group" class="form-control"    >'+tmpstr+'</select>');
    		  if("${OutSideWorkVo.ow_group!}" != '')
    	      {
    			  $("#ow_group").val("${OutSideWorkVo.ow_group!}");  
    	      }
    		  
   		  }
    	  else
   		  {
    		  $("#ow_group").replaceWith('<input type="text" name="ow_group" id="ow_group" class="form-control col-md-7 col-xs-12" />');
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
                  <form id="frm" action="<#if OutSideWorkVo.ow_seq! &gt; 0>/OutSideWorkUpdateProc.joil<#else>/OutSideWorkInsertProc.joil</#if>" name="frm" method="post" data-parsley-validate class="form-horizontal form-label-left" >
                    <input type="hidden" id="seq" name="seq" value="${OutSideWorkVo.ow_seq!}" />                
                                       
                   
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="ow_sc_seq">가공 분류</label>
                      <div class="col-md-9 col-sm-9 col-xs-12">
                        <select class="form-control" name="ow_sc_seq" id="ow_sc_seq" onchange="javascript:getGroup();">
                        	<#list jList as jInfo>
                      			<option value="${jInfo.sc_seq!}" <#if jInfo.sc_seq! == OutSideWorkVo.ow_sc_seq! >selected</#if> >${jInfo.sc_name!}</option>
                            </#list>
                        </select>
                      </div>
                    </div>
                    
                   <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="ow_group">분류
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="ow_group" name="ow_group" class="form-control col-md-7 col-xs-12" value="${OutSideWorkVo.ow_group!}">
                      </div>
                    </div>
                   
                   <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="ow_no">품번
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="ow_no" name="ow_no" class="form-control col-md-7 col-xs-12" value="${OutSideWorkVo.ow_no!}">
                      </div>
                    </div>
                   
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="ow_name">명칭
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="ow_name" name="ow_name" class="form-control col-md-7 col-xs-12" value="${OutSideWorkVo.ow_name!}">
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="ow_pl_name">P/L 표기명
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="ow_pl_name" name="ow_pl_name" class="form-control col-md-7 col-xs-12" value="${OutSideWorkVo.ow_pl_name!}">
                      </div>
                    </div>
                    
                    
                    
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="ow_etc1">비고1
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="ow_etc1" name="ow_etc1" class="form-control col-md-7 col-xs-12" value="${OutSideWorkVo.ow_etc1!}">
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="ow_etc2">비고2
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="ow_etc2" name="ow_etc2" class="form-control col-md-7 col-xs-12" value="${OutSideWorkVo.ow_etc2!}">
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="ow_etc3">비고3
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="ow_etc3" name="ow_etc3" class="form-control col-md-7 col-xs-12" value="${OutSideWorkVo.ow_etc3!}">
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="use_yn">사용 여부
                      </label>
                        <div class="radio">
                          <label>
                            <input type="radio" class="flat" <#if OutSideWorkVo.use_yn!?default('Y') =='Y'>checked</#if> name="use_yn" id="use_yn" value="Y"> 사용 함
                            <input type="radio" class="flat" <#if OutSideWorkVo.use_yn!?default('Y') =='N'>checked</#if> name="use_yn" id="use_yn" value="N"> 사용 안 함
                          </label>
                        </div>
                    </div>
                                      
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                        <button type="button" class="btn btn-primary" onClick="location.href='/OutSide.joil?menuname=OutSideWorkList'">취소</button>
                        <button type="submit" class="btn btn-success"><#if OutSideWorkVo.ow_seq! &gt; 0>수정<#else>등록</#if> </button>
                      </div>
                    </div> 

                  </form>
                </div>
              </div>
            </div>
            
            