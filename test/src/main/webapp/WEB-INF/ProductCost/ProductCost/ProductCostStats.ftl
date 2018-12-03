<#ftl encoding="UTF-8"/>
<#assign tiles=JspTaglibs["http://tiles.apache.org/tags-tiles"] />
<#setting number_format=",###">

<script>	
$(document).ready(function(){
	pChange();
});
	function pChange()
	{
		var selval = $("select[name=process_group]").val();
		
		$.ajax({
	        type: "post",
	        url : "/getOutSideGroupInfo.joil",
	        dataType : "json",
	        data: {
	        	ow_sc_seq : selval
	        },
	      success : function(data) {	    	  
	    	  var listsize = data.gList.length; 
	    	  var list = data.gList;
	    	  var tmpstr="";
	    	  if(listsize > 0) // 해당 분류의 데이터가 코드에 존재한다면.
	   		  {
	    		  for(var i=0;i<listsize;i++)
		    	  {   
		    		 tmpstr = tmpstr+"<option value='"+list[i].sc_seq+"' >"+list[i].sc_name+"</option>";
		    	  }
	    		  $("#ow_group").replaceWith('<select id="ow_group" name="ow_group" class="form-control" onchange="javascript:getGroupDetail();"   >'+tmpstr+'</select>');
    			  if("${ow_group!}" != '')
    			  {
    				  $("#ow_group").val("${ow_group!}");  
    			  }
	    		  
	    		  
	    		  getGroupDetail();
	   		  }
	    	  else
	   		  {
	    		  $("#ow_group").replaceWith('<input type="text" name="ow_group" id="ow_group" class="form-control"  />');
	    		  $("#ow_group_detail").replaceWith('<input type="text" name="ow_group_detail" id="ow_group_detail" class="form-control" value=""/>');
	    		  $("#ow_group").prop( "disabled", true );
	   		  }
	    	  
	    	 
	      },
	      /* complete : function(data) {
	    	  alert(data);
	      }, */
	      error : function(xhr, status, error) {
	            alert("에러발생");
	      }
	 	});
	
	}
	
	
	
	function getGroupDetail()
	{
	var selval = $("select[name=ow_group]").val();
		
		$.ajax({
	        type: "post",
	        url : "/getOutSideGroupDetailInfo.joil",
	        dataType : "json",
	        data: {
	        	pl_ow_group : selval
	        },
	      success : function(data) {	    	  
	    	  var listsize = data.dList.length; 
	    	  var list = data.dList;
	    	  var tmpstr="";
	    	  if(listsize > 0) 
	   		  {
	    		  for(var i=0;i<listsize;i++)
		    	  {   
		    		 tmpstr = tmpstr+"<option value='"+list[i].ow_seq+"' <#if "+list[i].ow_seq+" == ow_group_detail!  >SELECTED</#if> >"+list[i].ow_name+"</option>";
		    	  }
	    		  $("#ow_group_detail").replaceWith('<select id="ow_group_detail" name="ow_group_detail" class="form-control"    >'+tmpstr+'</select>');
	    		  if("${ow_group_detail!}" != '')
	    		  {
	    			  $("#ow_group_detail").val("${ow_group_detail!}");  
	    		  }
	    		  
	    		 
	    		  
	   		  }
	    	  else
	   		  {
	    		  
	    		  //$("#pl_ow_group_detail").prop( "disabled", true );
	    		  $("#ow_group_detail").replaceWith('<input type="text" name="ow_group_detail" id="ow_group_detail" class="form-control" value="${ow_group_detail!}"/>');
	    	  }
	    	  
	    	  
	    	 
	      },
	      /* complete : function(data) {
	    	  alert(data);
	      }, */
	      error : function(xhr, status, error) {
	            alert("에러발생");
	      }
	 	});
	}

	
</script>


 <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel">
                <form  name="searchFrm" id="searchFrm" method="post" action="">
                <div class="x_title">
                  <h2>${menutitle!}</h2>          
                  <ul class="nav navbar-right panel_toolbox">
                    <li>
                    	<div class="input-group" >
                    	 <label for="process_group"><span class="blind">가공</span></label>
	                     <select  class="form-control" name="process_group" id="process_group" onchange="javascript:pChange();">
	                     	<#list jList as jInfo>
                        		<option value="${jInfo.sc_seq!}" <#if jInfo.sc_seq!?string == process_group! >SELECTED</#if> >${jInfo.sc_name!}</option>
                        	</#list>
                         </select>
                         
                         <label for="ow_group"><span class="blind">분류</span></label>
                         <input type="text" id="ow_group" name="ow_group" class="form-control"  value="">
                         <label for="ow_group_detail"><span class="blind">분류세부내용</span></label>
                         <input type="text" id="ow_group_detail" name="ow_group_detail" class="form-control"  value="${ow_group_detail!}">
                         
                         
                         <span class="input-group-btn">
                            <button type="submit" class="btn btn-primary" >검색</button>
                         </span>
                        </div>
                    	
                    </li>
                    
                  </ul>      
                  <div class="clearfix"></div>
                </div>
                </form>
                
                <div class="x_content" >
                
                 	<p>총 게시물 수 : ${totalCount!?default('0') } </p>
                  <!-- start project list -->
                  <table class="table table-striped projects" summary="${menutitle!}">
                   <caption><span class="blind">${menutitle!}</span></caption>
                    <thead>
                      <tr>
                      	<th style="width: 10%">품목</th>
                        <th style="width: 5%">가공업체</th>
                        <!-- <th style="width: 8%">가공</th> -->
                        <th style="width: 5%">가공일자</th>
                        <th style="width: 5%">가격</th>
                        <th style="width: 5%">수량</th>
                        <th style="width: 5%">비고</th>
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
	                        <#-- 
	                        <td>
	                        	${Info.sc_name!}<br/>
	                        	${Info.ow_group_name!}<br/>
	                        	<#if Info.pl_ow_group! &gt; 0>
		                        	${Info.ow_group_detail_name!}
								<#else>
								    ${Info.pl_ow_group_detail!}
	                        	</#if>	                        	
	                        </td>
	                         -->
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
