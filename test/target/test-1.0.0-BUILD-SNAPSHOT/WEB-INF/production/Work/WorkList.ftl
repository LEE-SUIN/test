<#ftl encoding="UTF-8"/>
<#assign tiles=JspTaglibs["http://tiles.apache.org/tags-tiles"] />

<script>

$(function() {
	//var d = new Date().toISOString().slice(0,10);
	//$("#search_date").val(d);
	$("#tmp_search_date").datepicker({
		  dateFormat: 'yy-mm-dd',
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		     dayNamesMin: ['일','월','화','수','목','금','토'],
			 changeMonth: true, //월변경가능
		     changeYear: true, //년변경가능
		     yearRange: 'c-65:c+15',
			 showMonthAfterYear: true
			 //pos: {x: 10, y: 10, zIndex: 9999}
	}); 
});

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
		var frm = document.searchfrm;
		var word = $("#tmp_search_word").val();		
		var date = $("#tmp_search_date").val();
		
		if(word != "" &&  word != null ){ frm.search_word.value= word;}
		if(date != "" &&  date != null ){ frm.search_date.value= date;}
		
		
		
		frm.submit();	
		
		
	}
	
	function goPage(val)
	{
		var pfrm = document.pagingfrm;
		pfrm.pageNo.value=val;
		pfrm.submit();
	}
	
	
	
	

</script>
<form name="frm" id="frm" method="post" action="/WorkDeleteProc.joil">
	<input type="hidden" name="seq" id="seq" value="" />
</form>
<form name="searchfrm" id="searchfrm" method="post" action="/Work.joil?menuname=WorkList">
	<input type="hidden" name="search_word" id= "search_word" />
	<input type="hidden" name="search_date" id= "search_date" />
	<input type="hidden" name="pageNo" id="pageNo" value="1" />
</form>
<form name="pagingfrm" id="pagingfrm" method="post" action="">
	<input type="hidden" name="pageNo" id="pageNo" value="" />
	<input type="hidden" name="search_word" id="search_word" value="${search_word!}" />
	<input type="hidden" name="search_date" id="search_date" value="${search_date!}" />
</form>

 <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>${menutitle!}</h2>          
                  <ul class="nav navbar-right panel_toolbox">
                    <li>
                    
                   
	                    <div class="input-group" class="col-md-4 col-sm-4 col-xs-4" style="width: 30%; float: right;">
	                     
	                    	<input type="text" name="tmp_search_word" id ="tmp_search_word" class="form-control" style="width:100px;" placeholder="검색어" value="${search_word!}">&nbsp;
	                         <label for="tmp_search_word"><span class="blind">검색어</span></label>
                          	<input type="text" name="tmp_search_date" id ="tmp_search_date" class="form-control" style="width:100px;" placeholder="검색일자" value="${search_date!}">                          	 
                          	 <label for="tmp_search_date"><span class="blind">검색일자</span></label>
                          <span class="input-group-btn">
                              <button type="button" class="btn btn-primary" onclick="searchFrm();return false;">검색</button>
                          </span>
                          <span class="input-group-btn" >
	                          <a href="/Work.joil?menuname=WorkInsert">
	                    		<button type="button" class="btn btn-primary">등록</button>
	                    	  </a>
                    	  </span>
                        </div>
                    </li>
                  </ul>      
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <p>총 게시물 수 : ${totalCount!?default('0') }  </p>
                  <!-- start project list -->
                  <table class="table table-striped projects" summary="${menutitle!}"> 
                   <caption><span class="blind">${menutitle!}</span></caption>
                    <thead>
                      <tr>
                      	<th style="width: 10%">일자</th>                        
                        <th style="width: 10%">직급</th>
                        <th style="width: 10%">성명</th>
                        <th style="width: 10%">업무</th>
                        <th style="width: 10%">품목</th>
                        <th style="width: 10%">작업</th>
                        <th style="width: 10%">작업시간</th>
                        <th style="width: 10%">비고</th>                        
                        <th style="width: 10%">관리</th>
                        
                      </tr>
                    </thead>
                    <tbody>
                    <#if List!?default('0')?size &gt; 0 > 
                    <#list List as Info>
	                    <tr>
	                    	<td>
	                        	${Info.pw_work_date!?date}
	                        </td>	                      
	                        <td>
	                        	${Info.su_position!}
	                        </td>
	                        <td>
	                        	${Info.su_name!}
	                        </td>
	                        <td>
	                        	${Info.pw_work!}
	                        	
	                        </td>
	                        <td>
	                        	${Info.joil_number!} <br/> ${Info.e_number!}
	                        </td> 	     
	                        <td>
	                        	${Info.su_job!}
	                        </td>
	                        <td>
	                        	${Info.pw_pi_job_time!}	                        	
	                        </td>  
	                          <td>
	                        	${Info.pw_etc1!}<br/>
	                        	${Info.pw_etc2!}<br/>
	                        	${Info.pw_etc3!}	                        	
	                        </td>          
	                        <td>
	                          <button onclick="location.href='/Work.joil?menuname=WorkUpdate&seq=${Info.pw_seq!}'" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> 수정 </button>
	                          <a href="javascript:deleteCheck('${Info.pw_seq!}');" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> 삭제 </a>
	                        </td> 
	                      </tr>
					</#list>
                    </#if>  
                     
                    </tbody>
                  </table>
                  <!-- end project list -->

                </div>
                
                <div class="dataTables_paginate paging_simple_numbers" style="width:100%;text-align:center;">
                	<ul class="pagination">
                		<li class="pagination">
                			<a tabindex="0" aria-controls="datatable" href="javascript:goPage(${paging.firstPageNo});" data-dt-idx="${paging.firstPageNo}">
                				처음
                			</a>
                		</li>
                		<li class="pagination">
                			<a tabindex="0" aria-controls="datatable" href="javascript:goPage(${paging.prevPageNo});" data-dt-idx="${paging.prevPageNo}">
                				이전
                			</a>
                		</li>
                		<#list paging.startPageNo..paging.endPageNo as i>
                			<li class="pagination <#if paging.pageNo == i>active </#if>">
                				<a tabindex="0" aria-controls="datatable" href="javascript:goPage(${i!});" data-dt-idx="${i!}}"> 
                					${i!}
                				</a>
                			</li>
                		</#list>
                		<li class="pagination">
                			<a tabindex="0" aria-controls="datatable" href="javascript:goPage(${paging.nextPageNo});" data-dt-idx="${paging.nextPageNo}">
                				다음
                			</a>
                		</li>
                		<li class="pagination">
                			<a tabindex="0" aria-controls="datatable" href="javascript:goPage(${paging.finalPageNo});" data-dt-idx="${paging.finalPageNo}">
                				마지막
                			</a>
                		</li>
                	</ul>
                	<#-- <a id="pageFirst" class="paginate_button" href="javascript:goPage(${paging.firstPageNo});">처음</a>
                	<a id="pagePre" class="paginate_button" href="javascript:goPage(${paging.prevPageNo});">이전</a>
                	<span>
                		<#list paging.startPageNo..paging.endPageNo as i>
                			<a class="paginate_button" id="pageNo" href="javascript:goPage(${i!});"> ${i!}</a>
                		</#list>
                	</span>
                	<a id="pageNext" class="paginate_button" href="javascript:goPage(${paging.nextPageNo});">다음</a>
                	<a id="pageEnd" class="paginate_button" href="javascript:goPage(${paging.finalPageNo});">마지막</a> --#>
                </div>
                
              </div>
            </div>
