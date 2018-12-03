<#ftl encoding="UTF-8"/>
<#assign tiles=JspTaglibs["http://tiles.apache.org/tags-tiles"] />
<link href="/resources/uploadify/uploadifive.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/resources/uploadify/jquery.uploadifive.js"></script> 


<script>
$(function() {	 
	  $("#pi_order_date").datepicker({
		  dateFormat: 'yy-mm-dd',
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		     dayNamesMin: ['일','월','화','수','목','금','토'],
			 changeMonth: true, //월변경가능
		     changeYear: true, //년변경가능
		     yearRange: 'c-10:c+20',
			 showMonthAfterYear: true
	  }); 
 
});

function filedelete(seq)
{				 
	if(confirm("삭제하시겠습니까?"))
	{
		$.ajax({
	        type: "post",
	        url : "/FileDelete.joil",
	        dataType : "json",
	        data: {
	        	f_seq : seq
	        },
	      success : function(data) {	    	  
	    	 alert("삭제하였습니다.");
	    	 history.go(0);
	      },
	      
	      error : function(xhr, status, error) {
	            alert("에러발생");
	      }
	 	});
	}
	
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
                  <form id="frm" action="<#if ItemVo.pi_seq! &gt; 0>/ItemUpdateProc.joil<#else>/ItemInsertProc.joil</#if>" name="frm" method="post" data-parsley-validate class="form-horizontal form-label-left" >
                    <input type="hidden" id="seq" name="seq" value="${ItemVo.pi_seq!}" />
                    <!-- <input type="hidden" id="pi_order_price" name="pi_order_price" value="100" /> -->                
                    
                    
                    
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pi_e_seq">업체</label>
                      <div class="col-md-9 col-sm-9 col-xs-12">
                        <select class="form-control" name="pi_e_seq" id="pi_e_seq">
                        	<#list EList as EInfo>
                      			<option value="${EInfo.se_seq!}" <#if EInfo.se_seq! == ItemVo.pi_e_seq! >selected</#if> >${EInfo.se_name!}</option>
                            </#list>
                        </select>
                      </div>
                    </div>
                    
                    
                    
                    
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pi_group">분류<span class="required">*</span>
                      </label>
                      
                        <div class="radio">
                          <label>                
                            <input type="radio" class="flat"  name="pi_group" id="pi_groupC" value="C" <#if ItemVo.pi_group!?default('C') == 'C' >checked</#if> >자동차
                            <input type="radio" class="flat"  name="pi_group" id="pi_groupE" value="E" <#if ItemVo.pi_group!?default('C') == 'E' >checked</#if> >전자
                          </label>                     
                        </div>                
                               
                    </div>
                    <!-- 전자 선택시 표시   -->
                    <div class="form-group" id="group_div">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pi_group_temp">세부 분류
                      </label>
                        <div class="radio">
                          <label>
                            <input type="radio" class="flat"  onclick="group_tempChange();" <#if ItemVo.pi_group_temp!?default('') == 'A'>checked</#if> name="pi_group_temp" id="pi_group_tempA" value="A">에어컨
                            <input type="radio" class="flat"  onclick="group_tempChange();" <#if ItemVo.pi_group_temp!?default('') == 'R'>checked</#if> name="pi_group_temp" id="pi_group_tempR" value="R">냉장고
                            <input type="radio" class="flat"  onclick="group_tempChange();" <#if ItemVo.pi_group_temp!?default('') == 'C'>checked</#if> name="pi_group_temp" id="pi_group_tempC" value="C">조리기구
                            <input type="radio" class="flat"  onclick="group_tempChange();" <#if ItemVo.pi_group_temp!?default('') == 'Z'>checked</#if> name="pi_group_temp" id="pi_group_tempZ" value="Z">시방
                          </label>	                         
                        </div>                        
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pi_process">공정수
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="number" id="pi_process" name="pi_process" class="form-control col-md-7 col-xs-12" value="${ItemVo.pi_process!}" >
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pi_joil_number">조일제번
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="pi_joil_number" name="pi_joil_number" class="form-control col-md-7 col-xs-12" value="${ItemVo.pi_joil_number!}" placeholder="미 입력시 자동으로 작성됩니다.">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pi_e_number">업체제번
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="pi_e_number" name="pi_e_number" class="form-control col-md-7 col-xs-12" value="${ItemVo.pi_e_number!}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pi_name">품목명<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="pi_name" name="pi_name" class="form-control col-md-7 col-xs-12" value="${ItemVo.pi_name!}" required="required" >
                      </div>
                    </div>
                    
                    <div class="form-group">
                    	<label class="control-label col-md-3 col-sm-3 col-xs-12" for="file_upload">첨부파일</label>
                    	<div class="col-md-6 col-sm-6 col-xs-12">
                    		 <input id="file_upload" type="file" name="file_upload" multiple>
                    		 <div>
                    		 <ul>
                    		 <#if ItemVo.filelist??>
	                        	<#list ItemVo.filelist as FileInfo>
		                    	<li>    	
		                        		
			                        	<a href="javascript:filedownload('/resources/uploadFile/','${FileInfo.f_save_name!}','${FileInfo.f_ori_name!}','${FileInfo.f_file_ext!}');">
				                        	${FileInfo.f_ori_name!} 
				                        </a>
			                        	<a href="javascript:filedelete('${FileInfo.f_seq!}');"><img src="/resources/uploadify/cancel.png"></a>
			                    </li>    
			                      	
	                        	</#list>	                        	
	                        </#if>
	                        </ul>
	                        </div>
                    	</div>
                    </div>
                    
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pi_dis_price">집행가
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="number" id="pi_dis_price" name="pi_dis_price" class="form-control col-md-7 col-xs-12" value="${ItemVo.pi_dis_price!}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pi_ma_price">원재료 외
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="number" id="pi_ma_price" name="pi_ma_price" class="form-control col-md-7 col-xs-12" value="${ItemVo.pi_ma_price!}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pi_order_price">수주가
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="number" id="pi_order_price" name="pi_order_price" class="form-control col-md-7 col-xs-12" value="${ItemVo.pi_order_price!}">
                      </div>
                    </div> 
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pi_order_date">수주일자
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="pi_order_date" name="pi_order_date" class="form-control col-md-7 col-xs-12" value="${ItemVo.pi_order_date!?date?string('yyyy-MM-dd')}">
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pi_progress">진행상황</label>
                      <div class="col-md-9 col-sm-9 col-xs-12">
                        <select class="form-control" name="pi_progress" id="pi_progress">
                          <#list pList as pInfo>
                          	<option value="${pInfo.sc_name!}" <#if pInfo.sc_name! == ItemVo.pi_progress!>selected</#if> >${pInfo.sc_name!}</option>
                          </#list>
                        </select>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pi_percent">진행률
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="pi_percent" name="pi_percent" class="form-control col-md-7 col-xs-12" value="${ItemVo.pi_percent!}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pi_progress_money">금액상황</label>
                      <div class="col-md-9 col-sm-9 col-xs-12">
                        <select class="form-control" name="pi_progress_money" id="pi_progress_money">
                          <#list mList as mInfo>
                          	<option value="${mInfo.sc_name!}" <#if mInfo.sc_name! == ItemVo.pi_progress_money!>selected</#if> >${mInfo.sc_name!}</option>
                          </#list>
                        </select>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pi_man">투입입력
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12" >
                         	<#list uList as uInfo>                            	
                           			<input type="checkbox" class="flat" name="pi_man" id="pi_man" value="${uInfo.su_seq!}"  
                           			<#list ItemVo.pi_man?split("|") as man>
                            		<#if uInfo.su_seq?string == man>checked</#if>
                            		</#list>
                            		>${uInfo.su_name!}                           		   
                            </#list>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pi_etc1">비고1
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="pi_etc1" name="pi_etc1" class="form-control col-md-7 col-xs-12" value="${ItemVo.pi_etc1!}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pi_etc2">비고2
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="pi_etc2" name="pi_etc2" class="form-control col-md-7 col-xs-12" value="${ItemVo.pi_etc2!}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pi_etc3">비고3
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="pi_etc3" name="pi_etc3" class="form-control col-md-7 col-xs-12" value="${ItemVo.pi_etc3!}">
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pi_whole_number">제번 순서
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="number" id="pi_whole_number" name="pi_whole_number" class="form-control col-md-7 col-xs-12" value="${ItemVo.pi_whole_number!}">
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="use_yn">사용 여부
                      </label>
                        <div class="radio">
                          <label>
                            <input type="radio" class="flat" <#if ItemVo.use_yn!?default('Y') =='Y'>checked</#if> name="use_yn" id="use_yn" value="Y"> 사용 함
                            <input type="radio" class="flat" <#if ItemVo.use_yn!?default('Y') =='N'>checked</#if> name="use_yn" id="use_yn" value="N"> 사용 안 함
                          </label>
                        </div>
                    </div>
                                      
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                        <button type="button" class="btn btn-primary" onClick="location.href='/Item.joil?menuname=ItemList'">취소</button>
                        <button type="submit" class="btn btn-success"><#if ItemVo.pi_seq! &gt; 0>수정<#else>등록</#if> </button>
                      </div>
                    </div> 

                  </form>
                </div>
              </div>
            </div>
            
   
   
<script type="text/javascript">
$(document).ready(function() {
	$('#file_upload').uploadifive({           
        'uploadScript' : '/FileUpload.joil',
         'buttonText'   : '파일첨부',    
         'cancelImg': '/resources/uploadify/cancel.png',
         'auto'          : true,
		 'multi'         : true,
		 'formData'  : { 'menu_name' :'ItemFile' },
         'onError'   : function(data,errorType,errorObj) 
         { 
        	 alert(errorObj+"\n"); 
         },
         'onUploadComplete' : function(file, data) {
        	 
             alert(file.name+" 등록 되었습니다.");
         },
         'onProgress'   : function(file, e) {
        	 
             if (e.lengthComputable) {
                 var percent = Math.round((e.loaded / e.total) * 100);
             }
             file.queueItem.find('.fileinfo').html(' - ' + percent + '%');
             file.queueItem.find('.progress-bar').css('width', percent + '%');
         },
         'onCancel'     : function(file) {
        	 
        	 //alert('The file ' + file + ' was cancelled!');
        	 /* 
        	 $.ajax({
 				type: "POST",
    			url: "/FileDelete.joil",
    			data: { f_menu_name : "UserFile" ,   } ,
    			 success: function(result) {
    			        // do something on success of save
    			    }

 			});
 			*/       
            
         }






    });
});

</script>                
            