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
		frm.search_date.value = $("#tmp_search_date").val();
		frm.search_word.value = $("#tmp_search_word").val();
		
		frm.submit();
	}
	
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
</script>

<form name="frm" id="frm" method="post" action="/ProductCostDeleteProc.joil">
	<input type="hidden" name="seq" id="seq" value="" />
</form>

<form name="pagingfrm" id="pagingfrm" method="post" action="">
	<input type="hidden" name="pageNo" id="pageNo" value="" />
	<input type="hidden" name="search_date" id="search_date" value="${search_date!}" />
	<input type="hidden" name="search_word" id="search_word" value="${search_word!}" />
</form>

<form name="sFrm" id="sFrm" method="post" action="">
	<input type="hidden" name="pageNo" id="pageNo" value="1" />
	<input type="hidden" name="search_date" id="search_date" value="" />
	<input type="hidden" name="search_word" id="search_word" value="" />
	
	
</form>


 <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>${menutitle!}</h2>          
                  <ul class="nav navbar-right panel_toolbox">
                    <li>
                    	<div class="input-group" class="col-md-4 col-sm-4 col-xs-4" >
                    	  <label for="tmp_search_date"><span class="blind">검색일자</span></label>
	                      <input type="text" name="tmp_search_date" id ="tmp_search_date" class="form-control" style="width:100px;" placeholder="검색일자" value="${search_date!}">&nbsp;
	                      
	                      <label for="tmp_search_word"><span class="blind">업체명</span></label>
						  <input type="text" name="tmp_search_word" id ="tmp_search_word" class="form-control" style="width:100px;" placeholder="업체명" value="${search_word!}">&nbsp;
			  
                          <span class="input-group-btn" style="float:left;">
                             <button type="button" class="btn btn-primary" onclick="javascript:searchFrm();return false;">검색</button>
                             <a href="/ProductCost.joil?menuname=ProductCostInsert">
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
                      	<th style="width: 10%">품목</th>
                        <th style="width: 5%">가공업체</th>
                        <th style="width: 8%">가공</th>
                        <th style="width: 5%">가공일자</th>
                        <th style="width: 5%">가격</th>
                        <th style="width: 5%">수량</th>
                        <th style="width: 5%">비고</th>
                        <th style="width: 4%">관리</th>
                      </tr>
                    </thead>
                    <tbody>
                    <#if List!?default('0')?size &gt; 0 > 
                    <#list List as Info>
	                    <tr>	                      
	                        <td>
	                        	${Info.pi_joil_number!}<br/>${Info.pi_name!}
	                        </td>
	                        <td>
	                        	${Info.oe_name!}
	                        </td>
	                        <td>
	                        	${Info.sc_name!}<br/>
	                        	${Info.ow_group_name!}<br/>
	                        	<#if Info.pl_ow_group! &gt; 0>
		                        	${Info.ow_group_detail_name!}
								<#else>
								    ${Info.pl_ow_group_detail!}
	                        	</#if>
	                        		
	                        	
	                        	
	                        </td>
	                        <td>
	                        	${Info.pl_date!?date}
	                        </td>
	                        <td>
	                        	${Info.pl_price!}
	                        </td>
	                        <td>
	                        	${Info.pl_amount!}
	                        </td>
	                        <td>
	                        	${Info.pl_etc1!}<br/>
	                        	${Info.pl_etc2!}<br/>
	                        	${Info.pl_etc3!}
	                        	
	                        </td>
	                        <td>	                          
	                          <button onclick="location.href='/ProductCost.joil?menuname=ProductCostUpdate&seq=${Info.pl_seq!}'" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> 수정 </button>
	                          <a href="javascript:deleteCheck('${Info.pl_seq!}'); " class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> 삭제 </a>
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
