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
                  <form id="frm" action="<#if NoticeBoardVo.nl_seq! &gt; 0>/NoticeBoardUpdateProc.joil<#else>/NoticeBoardInsertProc.joil</#if>" name="frm" method="post" data-parsley-validate class="form-horizontal form-label-left" >
                    <input type="hidden" id="seq" name="seq" value="${NoticeBoardVo.nl_seq!}" />
                    <!-- <input type="hidden" id="nl_order_price" name="nl_order_price" value="100" /> -->                
                    <input type="hidden" id="nl_etc" name="nl_etc" class="form-control col-md-9 col-xs-12" value="${UserInfo.su_id!}">
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="nl_writer">작성자
                      </label>
                      <div class="col-md-9 col-sm-9 col-xs-12">
                        
                        <input type="text" id="nl_writer" name="nl_writer" class="form-control col-md-9 col-xs-12" value="${UserInfo.su_name!}" readonly="readonly" >
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="nl_date">작성일자
                      </label>
                      <div class="col-md-9 col-sm-9 col-xs-12">                        
                        <input type="text" id="nl_date" name="nl_date" class="form-control col-md-9 col-xs-12" value="${.now?date?string('yyyy-MM-dd')}" readonly="readonly" >
                      </div>
                    </div>
                  
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="nl_title">제목
                      </label>
                      <div class="col-md-9 col-sm-9 col-xs-12">
                        <input type="text" id="nl_title" name="nl_title" class="form-control col-md-9 col-xs-12" value="${NoticeBoardVo.nl_title!}" >
                      </div>
                    </div>
                                          
                                             
			    	<div class="form-group">
	                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="nl_contents">내용</label>
	                    <div class="col-md-9 col-sm-9 col-xs-12">
	                      <textarea class="resizable_textarea form-control" placeholder="내용을 작성해주세요." rows="10" id="nl_contents" name="nl_contents">${NoticeBoardVo.nl_contents!}</textarea>
	                    </div>
	                  </div>       
                       
                      
                  	
                    
                    
                    <div class="form-group">
                    	<label class="control-label col-md-3 col-sm-3 col-xs-12" for="file_upload">첨부파일</label>
                    	<div class="col-md-9 col-sm-9 col-xs-12">
                    		 <input id="file_upload" type="file" name="file_upload" multiple>
                    		 <div>
                    		 <ul>
                    		 <#if NoticeBoardVo.filelist??>
	                        	<#list NoticeBoardVo.filelist as FileInfo>
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
                   
                                                         
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-12 col-sm-12 col-xs-12 col-md-offset-3">
                        <button type="button" class="btn btn-primary" onClick="location.href='/NoticeBoard.joil?menuname=NoticeBoardList'">취소</button>
                        <button type="submit" class="btn btn-success"><#if NoticeBoardVo.nl_seq! &gt; 0>수정<#else>등록</#if> </button>
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
		 'formData'  : { 'menu_name' :'NoticeBoardFile' },
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