<#ftl encoding="UTF-8"/>
<#assign tiles=JspTaglibs["http://tiles.apache.org/tags-tiles"] />
<#setting number_format=",###">

<script type="text/javascript" src="/resources/js/tableHeadFixer.js"></script>

<script>	
$(document).ready(function () {
		$("#booktable").tableHeadFixer({"left" : 2});
})


$(function() {
	
	$("#tmp_start_date").datepicker({
		  dateFormat: 'yy-mm-dd',
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		     dayNamesMin: ['일','월','화','수','목','금','토'],
			 changeMonth: true, //월변경가능
		     changeYear: true, //년변경가능
		     yearRange: 'c-65:c+15',
			 showMonthAfterYear: true
			 //pos: {x: 10, y: 10, zIndex: 9999}
	}); 
	$("#tmp_end_date").datepicker({
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
	

function searchFrm()
{
	var frm = document.searchfrm;
	var start_date = $("#tmp_start_date").val();
	var end_date = $("#tmp_end_date").val();
	var enterprise = $("#tmp_enterprise").val();
	frm.start_date.value= start_date;
	frm.end_date.value= end_date;
	frm.enterprise.value= enterprise;
	frm.submit();					
}

 
</script>
<form name="searchfrm" id="searchfrm" method="post" action="">
	<input type="hidden" name="start_date" id= "start_date" />
	<input type="hidden" name="end_date" id= "end_date" />
	<input type="hidden" name="enterprise" id= "enterprise" />
</form>

<form name="sFrm" id="sFrm" method="post" action="">
	<input type="hidden" name="pageNo" id="pageNo" value="1" />
	<input type="hidden" name="search_date" id="search_date" value="" />
	
	
</form>


 <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>${menutitle!}</h2>          
                  <ul class="nav navbar-right panel_toolbox">
                    <li>
                    	<div class="input-group" class="col-md-4 col-sm-4 col-xs-4">
                    	 <label for="process_group"><span class="blind">가공</span></label>
	                     <select style="width:150px;" class="form-control" name="tmp_enterprise" id="tmp_enterprise" onchange="javascript:pChange();">
	                     	<#list EList as EInfo>
                        		<option value="${EInfo.se_seq!}" <#if EInfo.se_seq!?string == enterprise! >SELECTED</#if> >${EInfo.se_name!}</option>
                        	</#list>
                         </select>
	                       <#-- 
	                       <input type="text" name="tmp_start_date" id ="tmp_start_date" class="form-control" style="width:100px;" placeholder="시작일자" value="${start_date!}">
                          	<label for="tmp_start_date"><span class="blind">시작일자</span></label>
                          	<input type="text" name="tmp_end_date" id ="tmp_end_date" class="form-control" style="width:100px;" placeholder="종료일자" value="${end_date!}">
                          	<label for="tmp_end_date"><span class="blind">종료일자</span></label> 
                          	--> 
                          <span class="input-group-btn" style="float:left;">
                             <button type="button" class="btn btn-primary" onclick="javascript:searchFrm();return false;">검색</button>
                          </span>
                    	  &nbsp;
                        </div>
                    	
                    </li>
                    
                  </ul>      
                  <div class="clearfix"></div>
                </div>
                <div class="x_content" >
                	 <div class="panel-body" style="overflow: scroll;height:800px;">
	                          <table id="booktable" class="table joiltable-bordered joiltable-striped " style="text-align:right;font-size:11px;  " summary="원가 대장">
	                       	   <caption><span class="blind">원가 대장</span></caption>
	                            <thead>
	                             	<tr >
							            <th style="color:white;background-color:red;">제번</th>
							            <th style="color:white;background-color:red; width:100px;">ITEMS</th>
							            <th style="color:white;background-color:red;">집행가</th>
							            <th style="color:white;background-color:red;">공제금</th>
							            <th style="color:white;background-color:red;" >수주가격</th>
							            <th style="color:white;background-color:red;">구분</th>
							            <th style="color:white;background-color:red;">원재료</th>
							            <th style="color:white;background-color:red;">표준,구매품</th>
							            <th style="color:white;background-color:red;">소계</th>
							            <th style="color:white;background-color:red;">외주설계</th>
							            <th style="color:white;background-color:red;">ASSY형상</th>
							            <th style="color:white;background-color:red;">면삭,제관</th>
							            <th style="color:white;background-color:red;">선반</th>
							            <th style="color:white;background-color:red;">밀링</th>
							            <th style="color:white;background-color:red;">와이어</th>
							            <th style="color:white;background-color:red;">MCT</th>
							            <th style="color:white;background-color:red;">연마</th>
							            <th style="color:white;background-color:red;">블록</th>
							            <th style="color:white;background-color:red;">열,표면처리</th>
							            <th style="color:white;background-color:red;">기타가공</th>
							            <th style="color:white;background-color:red;">조립작업</th>
							            <th style="color:white;background-color:red;">트라이아웃</th>
							            <th style="color:white;background-color:red;">가공비 합계</th>
							            <th style="color:white;background-color:red;">제조원가</th>
							            <th style="color:white;background-color:red;">매입률</th>
							        </tr>
							        
	                            </thead>
	                            <tbody style="color:black;">
	                            <#list List as Info >
	                              <tr>
	                                  <td rowspan="5" >${Info.pi_joil_number!}</td>
							            <td rowspan="5">${Info.pi_name!}</td>
							            <td rowspan="5">${Info.pi_dis_price!}</td>
							            <td rowspan="5">${Info.pi_ma_price!}</td>
							            <td rowspan="5" >${Info.pi_order_price!}</td>
							            <td>외주매입</td>
							            <td>${Info.outside_67!}</td>
							            <td>${Info.outside_68!}</td>
							            <td>${Info.outside_67 + Info.outside_68 }</td>
							            <td>${Info.outside_69!}</td>
							            <td></td>
							            <td>${Info.outside_70!}</td>
							            <td>${Info.outside_71!}</td>
							            <td>${Info.outside_72!}</td>
							            <td>${Info.outside_73!}</td>
							            <td>${Info.outside_74!}</td>
							            <td>${Info.outside_75!}</td>
							            <td>${Info.outside_76!}</td>
							            <td>${Info.outside_77!}</td>
							            <td>${Info.outside_78!}</td>
							            <td></td>
							            <td>${Info.outside_85!}</td>
							            <td>
							            	<font color="red">
							            		${Info.outside_sum}
							            	</font>	
							            </td>
							            <td>
							            	<font color="red">
							            		${Info.outside_total!}
							            	</font>	
							            </td>
							            <td>${ (Info.outside_total / Info.pi_order_price * 100)?string["0.##"] }%</td>
	                              </tr>
	                              <tr bgcolor="#D8D8D8">	
							            <td>%</td>
							            <td>${ (Info.outside_67 / Info.pi_order_price * 100)?string["0.##"]  }%</td>
							            <td>${ (Info.outside_68 / Info.pi_order_price * 100)?string["0.##"]  }%</td>
							            <td>${ ((Info.outside_67 + Info.outside_68) / Info.pi_order_price * 100)?string["0.##"]  }%</td>
							            <td>${ (Info.outside_69 / Info.pi_order_price * 100)?string["0.##"]  }%</td>
							            <td></td>
							            <td>${ (Info.outside_70 / Info.pi_order_price * 100)?string["0.##"]  }%</td>
							            <td>${ (Info.outside_71 / Info.pi_order_price * 100)?string["0.##"]  }%</td>
							            <td>${ (Info.outside_72 / Info.pi_order_price * 100)?string["0.##"]  }%</td>
							            <td>${ (Info.outside_73 / Info.pi_order_price * 100)?string["0.##"]  }%</td>
							            <td>${ (Info.outside_74 / Info.pi_order_price * 100)?string["0.##"]  }%</td>
							            <td>${ (Info.outside_75 / Info.pi_order_price * 100)?string["0.##"]  }%</td>
							            <td>${ (Info.outside_76 / Info.pi_order_price * 100)?string["0.##"]  }%</td>
							            <td>${ (Info.outside_77 / Info.pi_order_price * 100)?string["0.##"]  }%</td>
							            <td>${ (Info.outside_78 / Info.pi_order_price * 100)?string["0.##"]  }%</td>
							            <td></td>
							            <td>${ (Info.outside_85 / Info.pi_order_price * 100)?string["0.##"]  }%</td>
							            <td>${ (Info.outside_sum / Info.pi_order_price * 100)?string["0.##"]  }%</td>
							            <td>${ (Info.outside_total / Info.pi_order_price * 100)?string["0.##"]  }%</td>
							            <td></td>
	                              </tr>
	                              <tr>	
							            <td>사내가공</td>
							            <td></td>
							            <td></td>
							            <td></td>
							            <td>${Info.inside_37!}</td>
							            <td></td>
							            <td>${Info.inside_27!}</td>
							            <td></td>
							            <td>${Info.inside_28 + Info.inside_42 }</td>
							            <td></td>
							            <td>${Info.inside_30!}</td>
							            <td>${Info.inside_31!}</td>
							            <td></td>
							            <td></td>
							            <td>${Info.inside_34!}</td>
							            <td>${Info.inside_35!}</td>
							            <td></td>
							            <td >
							            	<font color="red">
							            		${Info.inside_sum!}
							            	</font>
							            </td>
							            <td>
							            	<font color="red">
							            		${Info.inside_total!}
							            	</font>
							            </td>
							            <td >${ (Info.inside_total / Info.pi_order_price * 100)?string["0.##"]}%</td>
	                              </tr>
	                              <tr bgcolor="#D8D8D8">	
							            <td>%</td>
							            <td></td>
							            <td></td>
							            <td></td>
							            <td>${ (Info.inside_37 / Info.pi_order_price * 100)?string["0.##"]  }%</td>
							            <td></td>
							            <td>${ (Info.inside_27 / Info.pi_order_price * 100)?string["0.##"]  }%</td>
							            <td></td>
							            <td>${ ((Info.inside_28 + Info.inside_42) / Info.pi_order_price * 100)?string["0.##"]  }%</td>
							            <td></td>
							            <td>${ (Info.inside_30 / Info.pi_order_price * 100)?string["0.##"]  }%</td>
							            <td>${ (Info.inside_31 / Info.pi_order_price * 100)?string["0.##"]  }%</td>
							            <td></td>
							            <td></td>
							            <td>${ (Info.inside_34 / Info.pi_order_price * 100)?string["0.##"]  }%</td>
							            <td>${ (Info.inside_35 / Info.pi_order_price * 100)?string["0.##"]  }%</td>
							            <td></td>
							            <td>${ (Info.inside_sum / Info.pi_order_price * 100)?string["0.##"]  }%</td>
							            <td>${ (Info.inside_sum / Info.pi_order_price * 100)?string["0.##"]  }%</td>
							            <td></td>
	                              </tr>
	                              
	                              <tr bgcolor="#FAC090">	
							            <td>소계</td>
							            <td>${Info.outside_67}</td>
							            <td>${Info.outside_68}</td>
							            <td>${Info.outside_67 + Info.outside_68}</td>
							            <td>${Info.outside_69 + Info.inside_37}</td>
							            <td></td>
							            <td>${Info.outside_70}</td>
							            <td>${Info.outside_71 + Info.inside_27}</td>
							            <td>${Info.outside_72 + Info.inside_28 + Info.inside_42}</td>
							            <td>${Info.outside_73}</td>
							            <td>${Info.outside_74 + Info.inside_30}</td>
							            <td>${Info.outside_75 + Info.inside_31}</td>
							            <td>${Info.outside_76}</td>
							            <td>${Info.outside_77}</td>
							            <td>${Info.outside_78 + Info.inside_34}</td>
							            <td>${Info.inside_35}</td>
							            <td>${Info.outside_85}</td>
							            <td>${Info.outside_sum + Info.inside_sum}</td>
							            <td bgcolor="red"><font color="white">${Info.outside_total + Info.inside_total}</font></td>
							            <td><font color="red">${ ( (Info.outside_total + Info.inside_total) / Info.pi_order_price * 100)?string["0.##"] }%</font></td>
	                              </tr>
	                            </#list>
	                            </tbody>
	                          </table>
	                        </div>
                 	                  
                  
                </div>
              
              </div>
            </div>
