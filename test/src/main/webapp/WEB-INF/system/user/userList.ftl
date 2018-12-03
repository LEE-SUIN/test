<#ftl encoding="UTF-8"/>
<#assign tiles=JspTaglibs["http://tiles.apache.org/tags-tiles"] />

<script>
function pop(img) {
	  var win = window.open('', 'Detail', 'width=0, height=0, menubar=0, toolbar=0, directories=0, scrollbars=1, status=0, location=0, resizable=1');
	  op="<html><head><title>크게 보기</title></head>";
	  op+="<body leftmargin='0' topmargin='0'>";
	  op+="<img src='"+ img.src +"' border='0' style='cursor:pointer' onclick='window.close();' onload='window.resizeTo(this.width+30, this.height+90); window.moveTo( (screen.width-this.width)/2 ,  (screen.height-this.height)/2-50 )'>";
	  op+="</body></html>";

	 win.document.write(op);
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
<form name="frm" id="frm" method="post" action="/userDeleteProc.joil">
	<input type="hidden" name="seq" id="seq" value="" />
</form>
 <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>${menutitle!}</h2>          
                  <ul class="nav navbar-right panel_toolbox">
                    <li>
                    	<a href="/user.joil?menuname=userInsert">
                    		<button type="button" class="btn btn-primary">등록</button>
                    	</a>
                    </li>
                    
                  </ul>      
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <p>총 게시물 수 : ${List!?default('0')?size } </p>
                  <!-- start project list -->
                  <table class="table table-striped projects" summary="${menutitle!}">
                   <caption><span class="blind">${menutitle!}</span></caption>
                    <thead>
                      <tr>                        
                        <th style="width: 10%">성명</th>
                        <th>입사일</th>
                        <th>사진</th>
                        <th>직급</th>
                        <th>직책</th>
                        <th>업무</th>
                        <th>연락처</th>
                        <th>비고</th>
                        <th style="width: 15%">관리</th>
                      </tr>
                    </thead>
                    <tbody>
                    <#if List!?default('0')?size &gt; 0 > 
                    <#list List as Info>
	                    <tr>	                      
	                        <td>
	                        	${Info.su_name!}   
	                        </td>
	                        <td>
	                        	${Info.su_join_date!?date}
	                        </td>
	                        <td> 
	                        <#assign tmp = Info.filelist?size?default(0) >
	                        <#if Info.filelist??>
	                        	<#list Info.filelist as FileInfo>
	                        		<#if FileInfo.f_file_ext! = 'jpg' || FileInfo.f_file_ext! = 'jpeg' || FileInfo.f_file_ext! = 'png' || FileInfo.f_file_ext! = 'bmp'>
	                        			<img src="/resources/uploadFile/${FileInfo.f_save_name!}" class="avatar" alt="Avatar" onclick="pop(this);">
	                        		</#if>
	                        	</#list>
	                        	
	                        </#if>
	                        	
	                        </td>
	                        <td>
	                           ${Info.su_position_name! } 	  
	                        </td>
	                        <td>
	                          ${Info.su_rank_name! }
	                        </td>
	                        <td>  
	                       		<#list Info.su_job?split("|") as job>
	                       			<#list jList as jInfo>
	                       				<#if jInfo.sc_seq?string == job>
	                       					${jInfo.sc_name!},
	                       				</#if>	                       				
	                       			</#list>
								   
								</#list>                            	
	                        </td>
	                        <td>
	                          ${Info.su_tel!}<br/>
	                          ${Info.su_mobile!}
	                          
	                        </td>
	                        <td>
	                        	<font color="red">
	                        		<b>
			                        	${Info.su_etc1!}<br/>
			                        	${Info.su_etc2!}
		                        	</b>
	                        	</font>
	                        </td>
	                        <td>
	                          <!-- <a href="#" class="btn btn-primary btn-xs"><i class="fa fa-folder"></i> 보기 </a> -->
	                          <button onclick="location.href='/user.joil?menuname=userUpdate&seq=${Info.su_seq!?replace(',','')}'" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> 수정 </button>
	                          <a href="javascript:deleteCheck('${Info.su_seq!?replace(',','')}');" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> 삭제 </a>
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
