<#ftl encoding="UTF-8"/>
<#assign tiles=JspTaglibs["http://tiles.apache.org/tags-tiles"] />


<script>
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
<form name="frm" id="frm" method="post" action="/EnterpriseDeleteProc.joil">
	<input type="hidden" name="seq" id="seq" value="" />
</form>

 <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>${menutitle!}</h2>          
                  <ul class="nav navbar-right panel_toolbox">
                    <li>
                    	<a href="/enterprise.joil?menuname=EnterpriseInsert">
                    		<button type="button" class="btn btn-primary">등록</button>
                    	</a>
                    </li>
                    
                  </ul>      
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <p>총 게시물 수 : ${List!?default('0')?size } </p>
                  <!-- start project list -->
                  <table class="table table-striped projects"  summary="${menutitle!}">
                  
                  <caption><span class="blind">${menutitle!}</span></caption>
                    <thead>
                      <tr>                        
                        <th style="width: 10%">업체명</th>
                        <th>분류</th>
                        <th>코드명</th>
                        <th>주소</th>
                        <th>사업자번호</th>
                        <th>대표번호</th>
                        <th>담당자</th>
                        <th>담당자 연락처</th>
                        <th>사용</th>
                        <th style="width: 15%">관리</th>
                      </tr>
                    </thead>
                    <tbody>
                    <#if List!?default('0')?size &gt; 0 > 
                    <#list List as Info>
	                    <tr>	                      
	                        <td>
	                        	${Info.se_name!}
	                        </td>
	                        <td>
	                        	<#if Info.se_group! =='C'>
	                        		자동차
	                        	<#else>
	                        		전자
	                        	</#if> 
	                        	
	                        </td>
	                        <td>                          
	                            ${Info.se_code!}
	                        </td>	                        
	                        <td>
	                        	${Info.se_address!}
	                        </td>
	                        <td>
	                        	${Info.se_conumber!}
	                        </td>
	                        <td>
	                        	${Info.se_tel!}
	                        </td>
	                         <td>
	                        	${Info.se_man!}
	                        </td>
	                        <td>
	                        	${Info.se_mannumber!}
	                        </td>
	                        <td>
	                        	<#if Info.use_yn! == 'Y'>
	                        	사용
	                        	<#elseif Info.use_yn! == 'N'>
	                        	사용 안함
	                        	</#if>   
	                            
	                        </td>
	                        <td>	                          
	                          <button onclick="location.href='/enterprise.joil?menuname=EnterpriseUpdate&seq=${Info.se_seq!?replace(',','')}'" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> 수정 </button>
	                          <a href="javascript:deleteCheck('${Info.se_seq!?replace(',','')}'); " class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> 삭제 </a>
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
