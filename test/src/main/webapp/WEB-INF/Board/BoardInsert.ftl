<#ftl encoding="UTF-8"/>
<#assign tiles=JspTaglibs["http://tiles.apache.org/tags-tiles"] />
<link href="/resources/uploadify/uploadifive.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/resources/uploadify/jquery.uploadifive.js"></script> 
<script>
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
                  <form id="frm" action="<#if BoardVo.bl_seq! &gt; 0>/BoardUpdateProc.joil<#else>/BoardInsertProc.joil</#if>" name="frm" method="post" data-parsley-validate class="form-horizontal form-label-left" >
                    <input type="hidden" id="seq" name="seq" value="${BoardVo.bl_seq!}" />
                    <!-- <input type="hidden" id="bl_order_price" name="bl_order_price" value="100" /> -->                
                    
                  
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="bl_process">제목
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="bl_title" name="bl_title" class="form-control col-md-7 col-xs-12" value="${BoardVo.bl_title!}" >
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="bl_joil_number">내용
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="bl_contents" name="bl_contents" class="form-control col-md-7 col-xs-12" value="${BoardVo.bl_contents!}" >
                      </div>
                    </div>
                    
                    
                    <div class="form-group">
                    	<label class="control-label col-md-3 col-sm-3 col-xs-12" for="file_upload">첨부파일</label>
                    	<div class="col-md-6 col-sm-6 col-xs-12">
                    		 <input id="file_upload" type="file" name="file_upload" multiple>
                    		 <div>
                    		 <ul>
                    		 <#if BoardVo.filelist??>
	                        	<#list BoardVo.filelist as FileInfo>
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
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="bl_etc">비고
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="bl_etc" name="bl_etc" class="form-control col-md-7 col-xs-12" value="${BoardVo.bl_etc!}">
                      </div>
                    </div>
                   
                                      
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                        <button type="button" class="btn btn-primary" onClick="location.href='/Board.joil?menuname=BoardList'">취소</button>
                        <button type="submit" class="btn btn-success"><#if BoardVo.bl_seq! &gt; 0>수정<#else>등록</#if> </button>
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
		 'formData'  : { 'menu_name' :'BoardFile' },
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