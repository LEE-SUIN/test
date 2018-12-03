<#ftl encoding="UTF-8"/>
<#assign tiles=JspTaglibs["http://tiles.apache.org/tags-tiles"] />
<#setting number_format=",###">


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
	function goPage(val)
	{
		var pfrm = document.pagingfrm;
		pfrm.pageNo.value=val;
		pfrm.submit();
	}
	
	
	function searchFrm()
	{		
		var frm = document.sFrm;
		frm.search_word.value = $("#tmp_search_word").val();
		
		frm.submit();
	}
</script>

<form name="frm" id="frm" method="post" action="/OutSideDeleteProc.joil">
	<input type="hidden" name="seq" id="seq" value="" />
</form>

<form name="pagingfrm" id="pagingfrm" method="post" action="">
	<input type="hidden" name="pageNo" id="pageNo" value="" />
	<input type="hidden" name="search_word" id="search_word" value="${search_word!}" />
</form>

<form name="sFrm" id="sFrm" method="post" action="">
	<input type="hidden" name="pageNo" id="pageNo" value="1" />
	<input type="hidden" name="search_word" id="search_word" value="" />
	
	
</form>


 <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>${menutitle!}</h2>          
                  <ul class="nav navbar-right panel_toolbox">
                    <li>
                    	<div class="input-group" style="width:250px;">
	                      <input type="text" name="tmp_search_word" id ="tmp_search_word" class="form-control" style="width:100px;" placeholder="업체명" value="${search_word!}">&nbsp;
	                         <label for="tmp_search_word"><span class="blind">검색어</span></label>
                          <span class="input-group-btn">
                             <button type="button" class="btn btn-primary" onclick="javascript:searchFrm();return false;">검색</button>
                          </span>
                          <span class="input-group-btn">
	                            <a href="/OutSide.joil?menuname=OutSideInsert">
		                    		<button type="button" class="btn btn-primary">등록</button>
		                    	</a>
                    	  </span>
                        </div>
                    	
                    </li>
                    
                  </ul>      
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <p>총 게시물 수 : ${totalCount!?default('0') } </p>
                  <!-- start project list -->
                  <table class="table table-striped projects" summary="${menutitle!}">
                   <caption><span class="blind">${menutitle!}</span></caption>
                    <thead>
                      <tr>                        
                        <th style="width: 2%">구분</th>
                        <th style="width: 5%">업체명</th>
                        <th style="width: 5%">품목</th>
                        <th style="width: 15%">주소</th>
                        <th style="width: 5%">전화번호</th>
                       <!--  <th style="width: 3%">대표자</th> -->
                        <th style="width: 5%">사업자번호</th>
                        <th style="width: 4%">비고1</th>
                        <th style="width: 4%">관리</th>
                      </tr>
                    </thead>
                    <tbody>
                    <#if List!?default('0')?size &gt; 0 > 
                    <#list List as Info>
	                    <tr>	                      
	                        <td>
	                        	<#if Info.oe_type! ='B'>
	                        	매입
	                        	<#else>
	                        	매출
	                        	</#if> 
	                        	
	                        </td>
	                        <td>${Info.oe_name!}</td>
	                        <td>
	                        	<#list Info.oe_items?split("|") as job>
	                       			<#list jList as jInfo>
	                       				<#if jInfo.sc_seq?string == job>
	                       					${jInfo.sc_name!},
	                       				</#if>	                       				
	                       			</#list>
								</#list> 
	                        </td>
	                        <td>${Info.oe_address!}</td>
	                        <td>${Info.oe_tel!}</td>
	                        <#-- <td>${Info.oe_etc1!}</td> -->
	                        <td>${Info.oe_etc2!}</td>
	                        <td>${Info.oe_etc3!}</td>
	                        <td>	                          
	                          <button onclick="location.href='/OutSide.joil?menuname=OutSideUpdate&seq=${Info.oe_seq!?replace(',','')}'" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> 수정 </button>
	                          <a href="javascript:deleteCheck('${Info.oe_seq!?replace(',','')}'); " class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> 삭제 </a>
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
