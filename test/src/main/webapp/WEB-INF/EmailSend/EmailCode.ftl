<#ftl encoding="UTF-8"/>
<#assign tiles=JspTaglibs["http://tiles.apache.org/tags-tiles"] />
<#setting number_format=",###">

<script>	

function InsertFrm(){
	var frm = document.InFrm;
	if(frm.ec_text.value==null || frm.ec_text.value=="")
	{		
		alert("내용을 입력하십시오.");
		frm.ec_text.focus();
		return false;
	}	
	frm.action="/EmailSendCodeInsertProc.joil";
	frm.submit();
	
}

function ModifyFrm(ec_seq)
{
	var frm = document.mFrm;
	if(confirm("수정 하시겠습니까?"))
	{
		frm.ec_seq.value=ec_seq;
		frm.ec_text.value=$("#ec_text"+ec_seq).val();
		frm.action="/EmailSendCodeUpdateProc.joil";
		frm.submit();
	}	
}

function DeleteFrm(ec_seq)
{
	var frm = document.dFrm;
	if(confirm("삭제 하시겠습니까?"))
	{	
		frm.ec_seq.value = ec_seq;
		frm.action="/EmailSendCodeDeleteProc.joil";
		frm.submit();
	}
	
}

function useyn(ec_seq)
{
	 
	var frm = document.uFrm;
	var use_val =  $("#use_yn"+ec_seq).val();
	var check = $("input:checkbox[id='use_yn"+ec_seq+"']").is(":checked");

	if(check == true){use_val="Y";}else{use_val="N";}
	
	
	/*
		frm.ec_seq.value = ec_seq;
		frm.use_yn.value= use_val;
		frm.action="/EmailSendCodeUseProc.joil";
		frm.submit();
		 */
		 
		$.ajax({
	        type: "post",
	        url : "/EmailSendCodeUseProc.joil",
	        dataType : "json",
	        data: {
	        	ec_seq : ec_seq,
	        	use_yn : use_val
	        },
	      success : function(data) {	    	  
	    	 //alert("삭제하였습니다.");
	    	 //history.go(0);
	      },
	      
	      error : function(request,status,error) { 
	    		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
	      }
	 	});
		
}

function CodeUpdate()
{
	var frm = document.cmFrm;
	if(confirm("수정 하시겠습니까?"))
	{
		frm.sc_name.value= $("#sc_text").val();
		frm.action="/CodeUpdateProc.joil";
		frm.submit();
	}
}

</script>

<form name="uFrm" id="uFrm" method="post">
	<input type="hidden" name="ec_seq" id="ec_seq" />
	<input type="hidden" name="use_yn" id="use_yn" />	
</form>

<form name="mFrm" id="mFrm" method="post">
	<input type="hidden" name="ec_seq" id="ec_seq" />
	<input type="hidden" name="ec_text" id="ec_text" />	
</form>

<form name="dFrm" id="dFrm" method="post">
	<input type="hidden" name="ec_seq" id="ec_seq" />	
</form>

<form name="cmFrm" id="cmFrm" method="post">
	<input type="hidden" name="sc_group_name" id="sc_group_name" value="메일발송 제목 " />
	<input type="hidden" name="sc_int_etc1" id="sc_int_etc1" value="1" />
	<input type="hidden" name="sc_string_etc1" id="sc_string_etc1" value="" />
	<input type="hidden" name="sc_use_yn" id="sc_use_yn" value="Y" />
	<input type="hidden" name="sc_name" id="sc_name" value="" />
</form>



 <div class="col-md-12 col-sm-12 col-xs-12" style="overflow:auto; overflow-y:hidden;">
              <div class="x_panel" >
                <div class="x_title">
                  <h2>${menutitle!}</h2>          
                      
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                 <form name="InFrm" id ="InFrm" method="post" >                                     
                  <table class="table table-striped projects" summary="${menutitle!}">
                   <caption style="padding-top:0px;padding-bottom:0px;"><span class="blind">${menutitle!}</span></caption>
                    <thead align="center">
                      <tr>
                        <th style="width: 25%; text-align:center;">구분</th>
                        <th style="width: *%; text-align:center;">내용</th>
                      </tr>
                    </thead>
                    <tbody>
                    	<tr>
                    		<td>
                    			<div class="col-md-9 col-sm-9 col-xs-9">
		                          <select class="form-control" id="ec_group" name="ec_group">
		                            <option value="P">급여</option>
		                            <option value="T">세액</option>
		                            
		                          </select>
		                        </div>
                    		</td>                    		
                    		<td>
                    			<label class="control-label" for="ec_text"><span class="required blind">내용 *</span></label>		
			                    <input type="text" id="ec_text" name="ec_text" required="required" class="form-control col-md-7 col-xs-12" value="">
                    		</td>
                    		<td > 
                    			<button type="button" class="btn btn-round btn-success" onclick="javascript:InsertFrm();return false;">등록</button>
                    		</td>
                    	</tr>
                    	</tbody>
                  </table>
                  </form> 
                              
                          
                    <div class="row">
		              <div class="col-md-7 col-sm-7 col-xs-7">
		                <div class="x_panel">
		                  <div class="x_content">
		                  	<label class="control-label" for="ec_text"><span class="required blind">내용 *</span></label>		
			                   <input style="width:300px;" type="text" id="sc_text" name="sc_text" class="form-control col-sm-5 col-md-5 col-xs-5" value="${CodeVo.sc_name! }">
			                    <button type="button" class="btn btn-round btn-success" onclick="javascript:CodeUpdate();return false;">수정</button>                    		
		                  	<div class="clearfix"></div>
			                  	
		               </div>
		              </div>
		            </div>
		            
        <!-- /page content -->    
          <div class="">
            
            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-6 col-sm-6 col-xs-6">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>급여 내역 </h2>
                    <!-- <button type="button" class="btn btn-info btn-sm">수정</button> -->
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">                  
                  	<div class="form-group">                        
	                  	<#if PList!?default('0')?size &gt; 0 > 
	           			<#list PList as PInfo>
	                        <div class="col-md-7 col-sm-7 col-xs-7">                          
	                          <input class="form-control" id="ec_text${PInfo.ec_seq!}" name="ec_text${PInfo.ec_seq!}" type="text" placeholder="Default Input" value="${PInfo.ec_text! }">	                          
	                        </div>
	                        <div class="col-md-5 col-sm-5 col-xs-5">
	                          <input onchange="useyn(${PInfo.ec_seq!});"  id="use_yn${PInfo.ec_seq!}" name="use_yn${PInfo.ec_seq!}" value="${PInfo.use_yn! }"  type="checkbox" <#if PInfo.use_yn! =='Y'>checked="checked"</#if> >
	                          <button type="button" class="btn btn-info btn-sm" onclick="javascript:ModifyFrm(${PInfo.ec_seq!});">수정</button>
	                          <button type="button" class="btn btn-danger btn-sm" onclick="javascript:DeleteFrm(${PInfo.ec_seq!});">삭제</button>
	                        </div>
                        </#list>
                        </#if>
                        
					</div>                    

                     
                  </div>
                </div>


              </div>

              <div class="col-md-6 col-sm-6 col-xs-6">

                <div class="x_panel">
                  <div class="x_title">
                    <h2>세액 및 공제내역</h2>
                    <!-- <button type="button" class="btn btn-info btn-sm">수정</button> -->
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <div class="form-group">                      
                    	<#if TList!?default('0')?size &gt; 0 > 
	           			<#list TList as TInfo>  
	                        <div class="col-md-7 col-sm-7 col-xs-7">
	                          <input class="form-control" id="ec_text${TInfo.ec_seq!}" name="ec_text${TInfo.ec_seq!}" type="text" value="${TInfo.ec_text! }">	
	                        </div>
	                        <div class="col-md-5 col-sm-5 col-xs-5">
	                          <input onchange="useyn(${TInfo.ec_seq!});"  id="use_yn${TInfo.ec_seq!}" name="use_yn${TInfo.ec_seq!}" value="${TInfo.use_yn! }"type="checkbox" <#if TInfo.use_yn! =='Y'>checked="checked"</#if> >  
	                          <!-- data-switchery="true" class="js-switch" style="display: none;" --> 
	                          <button type="button" class="btn btn-info btn-sm" onclick="javascript:ModifyFrm(${TInfo.ec_seq!});">수정</button>
	                          <button type="button" class="btn btn-danger btn-sm" onclick="javascript:DeleteFrm(${TInfo.ec_seq!});">삭제</button>
	                        </div>
	                    </#list>
                        </#if>   
					</div> 
                  </div>

                </div>


            
              </div>
            </div>
          </div>
        
        <!-- /page content -->           

                </div>                
               
              </div>
            </div>
            
            