<#ftl encoding="UTF-8"/>
<#assign tiles=JspTaglibs["http://tiles.apache.org/tags-tiles"] />

<script>
function filedownload(filepath,filename,filesavename,fileext)
{
	var dfrm = document.dfrm;
	dfrm.filepath.value = filepath;
	dfrm.filename.value = filename;
	dfrm.filesavename.value = filesavename;
	dfrm.fileext.value = fileext;
	dfrm.submit();
}
function deleteCheck(seq)
{
	var frm = document.frm;
	if(confirm("삭제하시겠습니까?"))
	{
		frm.seq.value=seq;
		frm.submit();
	}
	
}

function searchFrm()
{	
	var frm = document.sFrm;
	frm.search_word.value = $("#tmp_search_word").val();
	frm.submit();
}

</script>

<form name="sFrm" id="sFrm" method="post">
<input type="hidden" name="search_word" id="search_word" >
</form>

<form name="frm" id="frm" method="post" action="/NoticeBoardDeleteProc.joil">
	<input type="hidden" name="seq" id="seq" value="" />
</form>


<form name="dfrm" id="dfrm" method="post" action="/filedownload.joil">
	<input type="hidden" name="filepath" id="filepath" value="" />
	<input type="hidden" name="filename" id="filename" value="" />
	<input type="hidden" name="filesavename" id="filesavename" value="" />
	<input type="hidden" name="fileext" id="fileext" value="" />
</form>

<form name="delfrm" id="delfrm" method="post" action="/NoticeBoardDeleteProc.joil">
	<input type="hidden" name="seq" id="seq" value="" />
</form>


 <div class="col-md-12 col-sm-12 col-xs-12" >
              <div class="x_panel" >
                <div class="x_title">
                  <h2>${menutitle!}</h2>          
                  <ul class="nav navbar-right panel_toolbox">
                   <li>
                    	 <div class="input-group" style="width:250px;">
	                      <input type="text" name="tmp_search_word" id ="tmp_search_word" class="form-control" style="width:100px;" placeholder="제목" value="${search_word!}">&nbsp;
	                         <label for="tmp_search_word"><span class="blind">검색어</span></label>
                          <span class="input-group-btn">
                             <button type="button" class="btn btn-primary" onclick="javascript:searchFrm();return false;">검색</button>
                          </span>
                          <span class="input-group-btn">
	                            <a href="/NoticeBoard.joil?menuname=NoticeBoardInsert">
		                    		<button type="button" class="btn btn-primary">등록</button>
		                    	</a>
                    	  </span>
                        </div>                   	
                    </li>                 
                    
                  </ul>      
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                                    
                  <!-- start project list -->
                  <table class="table table-striped projects" summary="${menutitle!}">
                   <caption style="padding-top:0px;padding-bottom:0px;"><span class="blind">${menutitle!}</span></caption>
                    <thead>
                      <tr align="center">                        
                        <th style="width: *%; text-align:center;">제목</th>
                        <th style="width: 10%; text-align:center;">첨부파일</th>
                        <th style="width: 10%; text-align:center;">작성자</th>
                        <th style="width: 10%; text-align:center;">등록일자</th>                        
                        <th style="width: 20%; text-align:center;">관리</th>
                      </tr>
                    </thead>
                    <tbody>
                    <#if List!?default('0')?size &gt; 0 > 
                    <#list List as Info>
	                    <tr align="center">	          
	                    	<td ><a data-toggle="modal" data-target=".${Info.nl_seq!}">${Info.nl_title!}</a></td>
	                    	<td>
	                    		<#assign tmp = Info.filelist?size?default(0) >
		                        <#if Info.filelist??>
		                        	<#list Info.filelist as FileInfo>		                        		
				                        	${FileInfo.f_ori_name!} <a href="javascript:filedownload('/resources/uploadFile/${menu_name!}','${FileInfo.f_save_name!}','${FileInfo.f_ori_name!}','${FileInfo.f_file_ext!}');"><font color="red">[다운로드]</font></a> <br/>
		                        	</#list>		                        	
		                        </#if>
	                    	</td>  
	                    	<td>
	                    		${Info.nl_writer!}
	                    	</td>
	                        <td>
			                    ${Info.cre_date!?date}
	                        </td>
	                        <td >	
	                        <#if Info.nl_etc! == UserInfo.su_id! >
	                          <button onclick="location.href='/NoticeBoard.joil?menuname=NoticeBoardUpdate&seq=${Info.nl_seq!?replace(',','')}'" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> 수정 </button>
	                          <a href="javascript:deleteCheck('${Info.nl_seq!?replace(',','')}'); " class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> 삭제 </a>
	                        </#if>
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

			<!-- 모달 팝업   -->
            <!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">Large modal</button> -->
			<#if List!?default('0')?size &gt; 0 > 
            <#list List as Info>
                  <div class="modal fade ${Info.nl_seq!}" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                      <div class="modal-content">

                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                          </button>
                          <h4 class="modal-title" id="myModalLabel">${Info.nl_title!}</h4>
                        </div>
                        <div class="modal-body">
                          <pre>${Info.nl_contents!}</pre>
                          
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                          
                        </div> 

                      </div>
                    </div>
                  </div>
            </#list>
            </#if> 