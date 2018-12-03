<#ftl encoding="UTF-8"/>
<#assign tiles=JspTaglibs["http://tiles.apache.org/tags-tiles"] />



<link href="/resources/uploadify/uploadifive.css" type="text/css" rel="stylesheet" /> 

<script type="text/javascript" src="/resources/uploadify/jquery.uploadifive.js"></script> 




<script>
$(function() {	 
	  $("#su_birth").datepicker({
		  dateFormat: 'yy-mm-dd',
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		     dayNamesMin: ['일','월','화','수','목','금','토'],
			 changeMonth: true, //월변경가능
		     changeYear: true, //년변경가능
		     yearRange: 'c-65:c+15',
			 showMonthAfterYear: true
	  }); 
	 
	$("#su_join_date").datepicker({
		  dateFormat: 'yy-mm-dd',
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		     dayNamesMin: ['일','월','화','수','목','금','토'],
			 changeMonth: true, //월변경가능
		     changeYear: true, //년변경가능
		     yearRange: 'c-35:c+35',
			 showMonthAfterYear: true
	}); 
});

	function filedownload(filepath,filename,filesavename,fileext)
	{
		var dfrm = document.dfrm;
		dfrm.filepath.value = filepath;
		dfrm.filename.value = filename;
		dfrm.filesavename.value = filesavename;
		dfrm.fileext.value = fileext;
		dfrm.submit();
	}
	
	function filedelete(f_seq)
	{
		 $.ajax({
				type: "POST",
 			url: "/FileDelete.joil",
 			data: { f_seq : f_seq   } ,
 			 success: function(result) {
 			        // do something on success of save
 			        location.href = location.href;
 			        alert("삭제 되었습니다.");
 			        
 			    }

			});
		
	}

</script>
<form name="dfrm" id="dfrm" method="post" action="/filedownload.joil">
	<input type="hidden" name="filepath" id="filepath" value="" />
	<input type="hidden" name="filename" id="filename" value="" />
	<input type="hidden" name="filesavename" id="filesavename" value="" />
	<input type="hidden" name="fileext" id="fileext" value="" />
</form>

 <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>${menutitle!}</h2>                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <br />
                  <form id="frm" action="<#if UserVo.su_seq! &gt; 0>/userUpdateProc.joil<#else>/userInsertProc.joil</#if>" name="frm" enctype="multipart/form-data" method="post" data-parsley-validate class="form-horizontal form-label-left" >
                  <input type="hidden" name="seq" id="seq" value="${UserVo.su_seq!}" />
                  <input type="hidden" name="menuname" id="menuname" value="userInsertProc" />

                    
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="su_name">성명 <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="su_name" name="su_name" required="required" class="form-control col-md-7 col-xs-12" value="${UserVo.su_name!}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="su_birth">생년월일<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="su_birth" name="su_birth" required="required" class="form-control col-md-7 col-xs-12" value="${UserVo.su_birth!?date?string('yyyy-MM-dd')}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="su_address">주소
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="su_address" name="su_address"  class="form-control col-md-7 col-xs-12" value="${UserVo.su_address!}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="su_tel">집전화번호
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="su_tel" name="su_tel"  class="form-control col-md-7 col-xs-12" placeholder="055-000-0000" value="${UserVo.su_tel!}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="su_mobile">휴대폰번호
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="su_mobile" name="su_mobile"  class="form-control col-md-7 col-xs-12" placeholder="010-0000-0000" value="${UserVo.su_mobile!}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="su_join_date">입사일<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="su_join_date" name="su_join_date" required="required" class="form-control col-md-7 col-xs-12" value="${UserVo.su_join_date!?date?string('yyyy-MM-dd')}">
                      </div>
                    </div> 
                    <div class="form-group">
                    	<label class="control-label col-md-3 col-sm-3 col-xs-12" for="file_upload">사진</label>
                    	<div class="col-md-6 col-sm-6 col-xs-12">
                    		 <input id="file_upload" type="file" name="file_upload" multiple>
                    		 <div>
                    		 <ul>
                    		 <#if UserVo.filelist??>
	                        	<#list UserVo.filelist as FileInfo>
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
                    
                    
                    <#-- <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="file[0]">사진
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                      	<input type="file" name="file[0]" id="file[0]" />
                        <a href="javascript:filedownload('${UserVo.su_file_path!}','${UserVo.su_file_rename!}','${UserVo.su_file_name!}','${UserVo.su_file_ext!}');">
                        	${UserVo.su_file_name!}
                        </a>
                      </div>
                    </div> -->
                    
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="su_depart">부서</label>
                      <div class="col-md-9 col-sm-9 col-xs-12">
                        <select class="form-control" name="su_depart" id="su_depart">
                        	<#list dList as dInfo>
                      			<option value="${dInfo.sc_seq!}" <#if dInfo.sc_seq! == UserVo.su_depart! >selected</#if> >${dInfo.sc_name!}</option>
                            </#list>
                        </select>
                      </div>
                    </div>
                    
                    
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="su_position">직급<span class="required">*</span>
                      </label>
                      <div class="radio col-md-6 col-sm-6 col-xs-12">
                        <label>
                        	<#list pList as pInfo>
                        		<input type="radio" class="flat" id="su_position" name="su_position" value="${pInfo.sc_seq!}" <#if UserVo.su_position!?string == pInfo.sc_seq!?string >checked</#if>  >${pInfo.sc_name!}
                        	</#list>
                        </label>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="su_rank">직책<span class="required">*</span>
                      </label>
                      <div class="radio col-md-6 col-sm-6 col-xs-12">
                          <label>
	                          <#list rList as rInfo>
	                            <input type="radio" class="flat" id="su_rank" name="su_rank" value="${rInfo.sc_seq!}" <#if UserVo.su_rank!?string == rInfo.sc_seq!?string >checked</#if> >${rInfo.sc_name!}
	                          </#list> 
                          </label>
                      </div>
                      <!--   
                      <div class="col-md-6 col-sm-6 col-xs-12" style="position: relative;">                        
                        <input type="radio" class="flat" checked id ="su_rank" name="su_rank" style="position: absolute; opacity: 0;"> Checked
                      </div>
                       -->
                    </div>
	                   
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="su_job">업무<span class="required">*</span>
                      </label>
                      <div class="checkbox col-md-6 col-sm-6 col-xs-12">
                          <label>
                            <#list jList as jInfo>
                            	
                           			<input type="checkbox" class="flat" name="su_job" id="su_job" value="${jInfo.sc_seq!}"  
                           			<#list UserVo.su_job?split("|") as job>
                            		<#if jInfo.sc_seq?string == job>checked</#if>
                            		</#list>
                            		>${jInfo.sc_name!}                           		   
                            </#list>
                          </label>
                      </div>
                      	
                     
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="su_id">아이디<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="su_id" name="su_id" required="required" class="form-control col-md-7 col-xs-12"  value="${UserVo.su_id!}" >
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="su_password">비밀번호<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="su_password " name="su_password " required="required" class="form-control col-md-7 col-xs-12" value="${UserVo.su_password!}" >
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="su_menu_auth">메뉴 권한<span class="required">*</span>
                      </label>
                      <div class="checkbox ">
                          <label>                            
                          
                          	<input type="checkbox" class="flat" name="su_menu_auth" id="su_menu_auth" value="1" <#list UserVo.su_menu_auth?split("|") as job><#if job == '1'>checked</#if></#list> >품목
                          	<input type="checkbox" class="flat" name="su_menu_auth" id="su_menu_auth" value="2" <#list UserVo.su_menu_auth?split("|") as job><#if job == '2'>checked</#if></#list>>생산
                          	<input type="checkbox" class="flat" name="su_menu_auth" id="su_menu_auth" value="3" <#list UserVo.su_menu_auth?split("|") as job><#if job == '3'>checked</#if></#list>>원가
                          	<input type="checkbox" class="flat" name="su_menu_auth" id="su_menu_auth" value="4" <#list UserVo.su_menu_auth?split("|") as job><#if job == '4'>checked</#if></#list>>재고
                          	<input type="checkbox" class="flat" name="su_menu_auth" id="su_menu_auth" value="5" <#list UserVo.su_menu_auth?split("|") as job><#if job == '5'>checked</#if></#list>>품질
                          	<input type="checkbox" class="flat" name="su_menu_auth" id="su_menu_auth" value="6" <#list UserVo.su_menu_auth?split("|") as job><#if job == '6'>checked</#if></#list>>영업
                          	<input type="checkbox" class="flat" name="su_menu_auth" id="su_menu_auth" value="7" <#list UserVo.su_menu_auth?split("|") as job><#if job == '7'>checked</#if></#list>>회계
                          	<input type="checkbox" class="flat" name="su_menu_auth" id="su_menu_auth" value="8" <#list UserVo.su_menu_auth?split("|") as job><#if job == '8'>checked</#if></#list>>인사
                          	<input type="checkbox" class="flat" name="su_menu_auth" id="su_menu_auth" value="9" <#list UserVo.su_menu_auth?split("|") as job><#if job == '9'>checked</#if></#list>>공정
                          	<input type="checkbox" class="flat" name="su_menu_auth" id="su_menu_auth" value="10" <#list UserVo.su_menu_auth?split("|") as job><#if job == '10'>checked</#if></#list>>주요기능
                          	<input type="checkbox" class="flat" name="su_menu_auth" id="su_menu_auth" value="99" <#list UserVo.su_menu_auth?split("|") as job><#if job == '99'>checked</#if></#list>>시스템
                          </label>
                      </div>
                    </div> 
                     <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="use_yn">사용 여부
                      </label>
                        <div class="radio">
                          <label>
                            <input type="radio" class="flat" <#if UserVo.use_yn!?default('Y') =='Y'>checked</#if> name="use_yn" id="use_yn" value="Y"> 사용 함
                            <input type="radio" class="flat" <#if UserVo.use_yn!?default('Y') =='N'>checked</#if> name="use_yn" id="use_yn" value="N"> 사용 안 함
                          </label>
                        </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="su_etc1">비고1
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="su_etc1" name="su_etc1" class="form-control col-md-7 col-xs-12"  value="${UserVo.su_etc1!}" >
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="su_etc1">비고2
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="su_etc2" name="su_etc2" class="form-control col-md-7 col-xs-12"  value="${UserVo.su_etc2!}" >
                      </div>
                    </div>
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                        <button type="button" class="btn btn-primary" onClick="location.href='/user.joil?menuname=userList'">취소</button>
                        <button type="submit" class="btn btn-success"><#if UserVo.su_seq! &gt; 0>수정<#else>등록</#if></button>
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
		 'formData'  : { 'menu_name' :'UserFile' },
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