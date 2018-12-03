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
</script>
<form name="frm" id="frm" method="post" action="/BoardDeleteProc.joil">
	<input type="hidden" name="seq" id="seq" value="" />
</form>


<form name="dfrm" id="dfrm" method="post" action="/filedownload.joil">
	<input type="hidden" name="filepath" id="filepath" value="" />
	<input type="hidden" name="filename" id="filename" value="" />
	<input type="hidden" name="filesavename" id="filesavename" value="" />
	<input type="hidden" name="fileext" id="fileext" value="" />
</form>

<form name="delfrm" id="delfrm" method="post" action="/BoardDeleteProc.joil">
	<input type="hidden" name="seq" id="seq" value="" />
</form>


 <div class="col-md-12 col-sm-12 col-xs-12" >
              <div class="x_panel" >
                <div class="x_title">
                  <h2>${menutitle!}</h2>          
                  <ul class="nav navbar-right panel_toolbox">
                   <li>
                    	 <div class="input-group" class="col-md-4 col-sm-4 col-xs-4" >
                          <span class="input-group-btn" style="float:left;">
	                          <a href="/Board.joil?menuname=BoardInsert" >
	                    		<button type="button" class="btn btn-primary" >등록</button>
	                    	</a>
                    	  </span>
                        </div>                   	
                    </li>                 
                    
                  </ul>      
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                                    
                  <!-- start project list -->
                  <p>총 게시물 수 : ${totalCount!?default('0')} </p>
                  <table class="table table-striped projects" summary="${menutitle!}">
                   <caption style="padding-top:0px;padding-bottom:0px;"><span class="blind">${menutitle!}</span></caption>
                    <thead>
                      <tr align="center">                        
                        <th style="width: 20%; text-align:center;">제목(내용)</th>
                        <th style="width: *; text-align:center;">첨부파일</th>
                        <th style="width: 10%; text-align:center;">비고</th>
                        <th style="width: 10%; text-align:center;">등록일자</th>                        
                        <th style="width: 20%; text-align:center;">관리</th>
                      </tr>
                    </thead>
                    <tbody>
                    <#if List!?default('0')?size &gt; 0 > 
                    <#list List as Info>
	                    <tr align="center">	          
	                    	<td>${Info.bl_title!}(${Info.bl_contents!})</td>
	                    	<td>
	                    		<#assign tmp = Info.filelist?size?default(0) >
		                        <#if Info.filelist??>
		                        	<#list Info.filelist as FileInfo>		                        		
				                        	${FileInfo.f_ori_name!} <a href="javascript:filedownload('/resources/uploadFile/${menu_name!}','${FileInfo.f_save_name!}','${FileInfo.f_ori_name!}','${FileInfo.f_file_ext!}');"><font color="red">[다운로드]</font></a> <br/>
		                        	</#list>		                        	
		                        </#if>
	                    	</td>  
	                    	<td>
	                    		${Info.bl_etc!}
	                    	</td>
	                        <td>
			                    ${Info.cre_date!?date}
	                        </td>
	                        <td >	                          
	                          <button onclick="location.href='/Board.joil?menuname=BoardUpdate&seq=${Info.bl_seq!?replace(',','')}'" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> 수정 </button>
	                          <a href="javascript:deleteCheck('${Info.bl_seq!?replace(',','')}'); " class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> 삭제 </a>
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
