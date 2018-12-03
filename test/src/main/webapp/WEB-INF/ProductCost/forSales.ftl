<#ftl encoding="UTF-8"/>
<#assign tiles=JspTaglibs["http://tiles.apache.org/tags-tiles"] />
<#setting number_format=",###">
<!DOCTYPE html>

<html lang="ko">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>${title!}</title>

	<link rel="shorcut icon" href="/resources/images/joil/joil_mark.png" type="image/x-icon">
	<link rel="icon" href="/resources/images/joil/joil_mark.png" type="image/x-icon" >
    <!-- Bootstrap -->
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/resources/css/font-awesome.min.css" rel="stylesheet">
    
    <!-- Custom Theme Style -->
    <link href="/resources/css/custom.min.css" rel="stylesheet">
    <link href="/resources/css/joil/sales.css" rel="stylesheet">
     <link rel="stylesheet" href="/resources/css/jquery-ui.css" />
	<!-- jQuery -->
    <script src="/resources/js/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="/resources/js/bootstrap.min.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="/resources/js/custom.min.js"></script>
   
	<script src="/resources/js/jquery-ui.js"></script>
    <script type="text/javascript" src="/resources/js/DateTimePicker.js"></script>
  </head>


<script>
$(function() {
	<#list 67..78 as i>
	$("#pi_${i!}_plan").datepicker({
		  dateFormat: 'yy-mm-dd',
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		     dayNamesMin: ['일','월','화','수','목','금','토'],
			 changeMonth: true, //월변경가능
		     changeYear: true, //년변경가능
		     yearRange: 'c-65:c+15',
			 showMonthAfterYear: true
			 //pos: {x: 10, y: 10, zIndex: 9999}
	}); 
	$("#pi_${i!}_real").datepicker({
		  dateFormat: 'yy-mm-dd',
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		     dayNamesMin: ['일','월','화','수','목','금','토'],
			 changeMonth: true, //월변경가능
		     changeYear: true, //년변경가능
		     yearRange: 'c-65:c+15',
			 showMonthAfterYear: true
			 //pos: {x: 10, y: 10, zIndex: 9999}
	}); 
	</#list>
});

function modify()
{
	var frm = document.uFrm;
	if(confirm("수정하시겠습니까?"))
	{		
		frm.action="/ForSalesUpdateProc.joil";
		frm.submit();
	}
		
}

</script>
  <body class="nav-md">
    
      <div class="main_container">
       
        <!-- page content -->
        <div class="right_col" role="main" style="margin-left:0px;">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>금형 제조원가 및 외주내역</h3>
                
              </div>

              <div class="title_right">
                <div class="col-md-12 col-sm-12 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                    <!-- <input type="text" class="form-control" placeholder="Search for..."> -->
                    
                      <a href="/forSalesGraph.joil?pi_e_code=N"><button class="btn btn-danger" type="button">그래프로 보기</button></a>
                     
                    <button type="button" class="btn btn-success" onclick="javascript:modify();return false;">수정</button>
                  </div>
                </div>
              </div> 
            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
               
                <div class="x_panel">
                  <div class="x_title">
                    <!-- Split button -->
                    
                    <#if EList!?default('0')?size &gt; 0 > 
                    <#list EList as EInfo>
                    <div class="btn-group">
                      <button type="button" class="btn btn-primary">${EInfo.se_name!}</button>
                      <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                        <span class="caret"></span>
                        <span class="sr-only">Toggle Dropdown</span>
                      </button>
                      <ul class="dropdown-menu" role="menu">
                      
                        <#if IList!?default('0')?size &gt; 0 > 
                   		<#list IList as IInfo>
                   		<#if EInfo.se_seq! ==IInfo.pi_e_seq! && IInfo.pi_group_temp != 'Z' >
                        <li>
                        	<a href="/forSales.joil?seq=${IInfo.pi_seq}">${IInfo.pi_joil_number!}</a>
                        </li>
                        </#if>
                        </#list>
                    	</#if>
                      </ul>
                    </div>
                    
                    </#list>
                    </#if>
                    
                  </div>
                  <div class="x_content">
                  
					<#if List!?default('0')?size &gt; 0 > 
                   	<#list List as Info>
                   	<form name="uFrm" id="uFrm" method="post">
                    <input type="hidden" name="seq" id="seq" value="${Info.pi_seq! }" />
                   	<h2>${Info.pi_joil_number!} &nbsp;(&nbsp;${Info.pi_name!}&nbsp;) &nbsp;&nbsp;수주가 : ${Info.pi_order_price!} 원
                   	&nbsp;&nbsp;${Info.pi_etc1!} &nbsp;&nbsp;${Info.pi_etc2!} &nbsp;&nbsp;${Info.pi_etc3!}
                   	</h2>                   	
                    <table class="type08">
					    <thead>
					    <tr>
					        <th scope="cols">구분</th>
					        <th scope="cols">원재료</th>
					        <th scope="cols">표준품</th>
					        <th scope="cols">설계비</th>
					        <th scope="cols">ASSY형상</th>
					        <th scope="cols">면삭,제관</th>
					        <th scope="cols">선반</th>
					        <th scope="cols">밀링</th>
					        <th scope="cols">와이어</th>
					        <th scope="cols">MCT</th>
					        <th scope="cols">연마</th>
					        <th scope="cols">블록</th>
					        <th scope="cols">열,표면처리</th>
					        <th scope="cols">기타</th>
					        <th scope="cols">총계</th>
					    </tr>
					    </thead>
					    <tbody>
					    <tr >
					        <th scope="row" rowspan="2" >표준 원가</th>
					        <td>15 %</td>
					        <td>10 %</td>
					        <td>4 %</td>
					        <td>0 %</td>
					        <td>2 %</td>
					        <td>1 %</td>
					        <td>2 %</td>
					        <td>7 %</td>
					        <td>9 %</td>
					        <td>2 %</td>
					        <td>0 %</td>
					        <td>1 %</td>
					        <td>2 %</td>
					        <td>55 %</td>
					    </tr>
					    <tr style="border-bottom: 1px solid #000000;"> 
					        <td>${Info.pi_order_price! * 15 / 100 }</td>
					        <td>${Info.pi_order_price! * 10 / 100 }</td>
					        <td>${Info.pi_order_price! * 4 / 100 }</td>
					        <td>-</td>
					        <td>${Info.pi_order_price! * 2 / 100 }</td>
					        <td>${Info.pi_order_price! * 1 / 100 }</td>
					        <td>${Info.pi_order_price! * 2 / 100 }</td>
					        <td>${Info.pi_order_price! * 7 / 100 }</td>
					        <td>${Info.pi_order_price! * 9 / 100 }</td>
					        <td>${Info.pi_order_price! * 2 / 100 }</td>
					        <td>-</td>
					        <td>${Info.pi_order_price! * 1 / 100 }</td>
					        <td>${Info.pi_order_price! * 2 / 100 }</td>
					        <td>${Info.pi_order_price! * 55 / 100 }</td>
					    </tr>
					    <tr style="color:red;font-weight: bold;">
					        <th scope="row" rowspan="2">투입 원가</th> 
					        <td>${ (Info.outside_67! / Info.pi_order_price! * 100)?ceiling } %</td>
					        <td>${ (Info.outside_68! / Info.pi_order_price! * 100)?ceiling } %</td>
					        <td>${ (Info.outside_69! / Info.pi_order_price! * 100)?ceiling } %</td>
					        <td>-</td>
					        <td>${ (Info.outside_70! / Info.pi_order_price! * 100)?ceiling } %</td>
					        <td>${ (Info.outside_71! / Info.pi_order_price! * 100)?ceiling } %</td>
					        <td>${ (Info.outside_72! / Info.pi_order_price! * 100)?ceiling } %</td>
					        <td>${ (Info.outside_73! / Info.pi_order_price! * 100)?ceiling } %</td>
					        <td>${ (Info.outside_74! / Info.pi_order_price! * 100)?ceiling } %</td>
					        <td>${ (Info.outside_75! / Info.pi_order_price! * 100)?ceiling } %</td>
					        <td>${ (Info.outside_76! / Info.pi_order_price! * 100)?ceiling } %</td>
					        <td>${ (Info.outside_77! / Info.pi_order_price! * 100)?ceiling } %</td>
					        <td>${ (Info.outside_78! / Info.pi_order_price! * 100)?ceiling } %</td>
					        <td>${ (Info.outside_total! / Info.pi_order_price! * 100)?ceiling } %</td>
					    </tr>
					    <tr style="border-bottom: 1px solid #000000;">
					        <td>${Info.outside_67!}</td>
					        <td>${Info.outside_68!}</td>
					        <td>${Info.outside_69!}</td>
					        <td>-</td>
					        <td>${Info.outside_70!}</td>
					        <td>${Info.outside_71!}</td>
					        <td>${Info.outside_72!}</td>
					        <td>${Info.outside_73!}</td>
					        <td>${Info.outside_74!}</td>
					        <td>${Info.outside_75!}</td>
					        <td>${Info.outside_76!}</td>
					        <td>${Info.outside_77!}</td>
					        <td>${Info.outside_78!}</td>
					        <td>${Info.outside_total!}</td>
					    </tr>
					    <tr>
					        <th scope="row" rowspan="2">예상완료일<br/><br/>실제완료일</th>
					        <td><input type="text" size="10"  name="pi_67_plan" id="pi_67_plan" value="<#if Info.pi_67_plan??>${Info.pi_67_plan!?date?string('yyyy-MM-dd')}</#if>" style="border: 0px;" /></td>
							<td><input type="text" size="10"  name="pi_68_plan" id="pi_68_plan" value="<#if Info.pi_68_plan??>${Info.pi_68_plan!?date?string('yyyy-MM-dd')}</#if>" style="border: 0px;" /></td>
							<td><input type="text" size="10"  name="pi_69_plan" id="pi_69_plan" value="<#if Info.pi_69_plan??>${Info.pi_69_plan!?date?string('yyyy-MM-dd')}</#if>" style="border: 0px;" /></td>
							<td></td>
							<td><input type="text" size="10"  name="pi_70_plan" id="pi_70_plan" value="<#if Info.pi_70_plan??>${Info.pi_70_plan!?date?string('yyyy-MM-dd')}</#if>" style="border: 0px;" /></td>
							<td><input type="text" size="10"  name="pi_71_plan" id="pi_71_plan" value="<#if Info.pi_71_plan??>${Info.pi_71_plan!?date?string('yyyy-MM-dd')}</#if>" style="border: 0px;" /></td>
							<td><input type="text" size="10"  name="pi_72_plan" id="pi_72_plan" value="<#if Info.pi_72_plan??>${Info.pi_72_plan!?date?string('yyyy-MM-dd')}</#if>" style="border: 0px;" /></td>
							<td><input type="text" size="10"  name="pi_73_plan" id="pi_73_plan" value="<#if Info.pi_73_plan??>${Info.pi_73_plan!?date?string('yyyy-MM-dd')}</#if>" style="border: 0px;" /></td>
							<td><input type="text" size="10"  name="pi_74_plan" id="pi_74_plan" value="<#if Info.pi_74_plan??>${Info.pi_74_plan!?date?string('yyyy-MM-dd')}</#if>" style="border: 0px;" /></td>
							<td><input type="text" size="10"  name="pi_75_plan" id="pi_75_plan" value="<#if Info.pi_75_plan??>${Info.pi_75_plan!?date?string('yyyy-MM-dd')}</#if>" style="border: 0px;" /></td>
							<td><input type="text" size="10"  name="pi_76_plan" id="pi_76_plan" value="<#if Info.pi_76_plan??>${Info.pi_76_plan!?date?string('yyyy-MM-dd')}</#if>" style="border: 0px;" /></td>
							<td><input type="text" size="10"  name="pi_77_plan" id="pi_77_plan" value="<#if Info.pi_77_plan??>${Info.pi_77_plan!?date?string('yyyy-MM-dd')}</#if>" style="border: 0px;" /></td>
							<td><input type="text" size="10"  name="pi_78_plan" id="pi_78_plan" value="<#if Info.pi_78_plan??>${Info.pi_78_plan!?date?string('yyyy-MM-dd')}</#if>" style="border: 0px;" /></td>
							<td></td>
					    </tr>
					    <tr style="border-bottom: 1px solid #000000;">
					        <td><input type="text" size="10"  name="pi_67_real" id="pi_67_real" value="<#if Info.pi_67_real??>${Info.pi_67_real!?date?string('yyyy-MM-dd')}</#if>" style="border: 0px;" /></td>
							<td><input type="text" size="10"  name="pi_68_real" id="pi_68_real" value="<#if Info.pi_68_real??>${Info.pi_68_real!?date?string('yyyy-MM-dd')}</#if>" style="border: 0px;" /></td>
							<td><input type="text" size="10"  name="pi_69_real" id="pi_69_real" value="<#if Info.pi_69_real??>${Info.pi_69_real!?date?string('yyyy-MM-dd')}</#if>" style="border: 0px;" /></td>
							<td></td>
							<td><input type="text" size="10"  name="pi_70_real" id="pi_70_real" value="<#if Info.pi_70_real??>${Info.pi_70_real!?date?string('yyyy-MM-dd')}</#if>" style="border: 0px;" /></td>
							<td><input type="text" size="10"  name="pi_71_real" id="pi_71_real" value="<#if Info.pi_71_real??>${Info.pi_71_real!?date?string('yyyy-MM-dd')}</#if>" style="border: 0px;" /></td>
							<td><input type="text" size="10"  name="pi_72_real" id="pi_72_real" value="<#if Info.pi_72_real??>${Info.pi_72_real!?date?string('yyyy-MM-dd')}</#if>" style="border: 0px;" /></td>
							<td><input type="text" size="10"  name="pi_73_real" id="pi_73_real" value="<#if Info.pi_73_real??>${Info.pi_73_real!?date?string('yyyy-MM-dd')}</#if>" style="border: 0px;" /></td>
							<td><input type="text" size="10"  name="pi_74_real" id="pi_74_real" value="<#if Info.pi_74_real??>${Info.pi_74_real!?date?string('yyyy-MM-dd')}</#if>" style="border: 0px;" /></td>
							<td><input type="text" size="10"  name="pi_75_real" id="pi_75_real" value="<#if Info.pi_75_real??>${Info.pi_75_real!?date?string('yyyy-MM-dd')}</#if>" style="border: 0px;" /></td>
							<td><input type="text" size="10"  name="pi_76_real" id="pi_76_real" value="<#if Info.pi_76_real??>${Info.pi_76_real!?date?string('yyyy-MM-dd')}</#if>" style="border: 0px;" /></td>
							<td><input type="text" size="10"  name="pi_77_real" id="pi_77_real" value="<#if Info.pi_77_real??>${Info.pi_77_real!?date?string('yyyy-MM-dd')}</#if>" style="border: 0px;" /></td>
							<td><input type="text" size="10"  name="pi_78_real" id="pi_78_real" value="<#if Info.pi_78_real??>${Info.pi_78_real!?date?string('yyyy-MM-dd')}</#if>" style="border: 0px;" /></td>
							<td></td>
					    </tr>
					    <tr>
					        <th scope="row">외주업체</th>
					        <td><input type="text" size="10"  name="pi_67_company" id="pi_67_company" value="${Info.pi_67_company!}" style="border: 0px;" /></td>
							<td><input type="text" size="10"  name="pi_68_company" id="pi_68_company" value="${Info.pi_68_company!}" style="border: 0px;" /></td>
							<td><input type="text" size="10"  name="pi_69_company" id="pi_69_company" value="${Info.pi_69_company!}" style="border: 0px;" /></td>
							<td></td>
							<td><input type="text" size="10"  name="pi_70_company" id="pi_70_company" value="${Info.pi_70_company!}" style="border: 0px;" /></td>
							<td><input type="text" size="10"  name="pi_71_company" id="pi_71_company" value="${Info.pi_71_company!}" style="border: 0px;" /></td>
							<td><input type="text" size="10"  name="pi_72_company" id="pi_72_company" value="${Info.pi_72_company!}" style="border: 0px;" /></td>
							<td><input type="text" size="10"  name="pi_73_company" id="pi_73_company" value="${Info.pi_73_company!}" style="border: 0px;" /></td>
							<td><input type="text" size="10"  name="pi_74_company" id="pi_74_company" value="${Info.pi_74_company!}" style="border: 0px;" /></td>
							<td><input type="text" size="10"  name="pi_75_company" id="pi_75_company" value="${Info.pi_75_company!}" style="border: 0px;" /></td>
							<td><input type="text" size="10"  name="pi_76_company" id="pi_76_company" value="${Info.pi_76_company!}" style="border: 0px;" /></td>
							<td><input type="text" size="10"  name="pi_77_company" id="pi_77_company" value="${Info.pi_77_company!}" style="border: 0px;" /></td>
							<td><input type="text" size="10"  name="pi_78_company" id="pi_78_company" value="${Info.pi_78_company!}" style="border: 0px;" /></td>
							<td></td>
					    </tr>
					    </tbody>
					</table>
					
						  <div class="clearfix"></div>
						  
						 <table class="type08">
						    
						    <tr>
						    	<th scope="row" rowspan="4">표준 원가 대비</th>
						    	<td scope="row" rowspan="2">총 제조 원가</td>
						    	<td scope="row" >${ (Info.outside_total! / Info.pi_order_price! * 100)?ceiling } %</td>						    							    	
						    </tr>
						    <tr>
						    	<td scope="row" >${Info.outside_total!}</td>						    						    	
						    </tr>
						    <tr style="color:red;font-weight: bold;">						    	
						    	<td scope="row" rowspan="2">차액</td>
						    	<td scope="row" >${ 55 - (Info.outside_total! / Info.pi_order_price! * 100)?ceiling } %</td>						    						    	
						    </tr>
						    <tr style="color:red;font-weight: bold;">
						    	<td scope="row" >${ (Info.pi_order_price! * 55 / 100) - Info.outside_total!}</td>						    							    	
						    </tr>						    
						    <tr >
						        <th scope="row" rowspan="2">수주가 대비</th>
						        <td scope="row" rowspan="2">차액</td>
						        <td>${ ((Info.pi_order_price - Info.outside_total)  / Info.pi_order_price! * 100)?floor } %</td>						        
							</tr>
							<tr >						      
						        <td>${Info.pi_order_price - Info.outside_total }</td>						        					        
							</tr>						    
						    
						   </table>
						   </form>
                    </#list>
                    </#if>
					
                  </div>
                </div>

              </div>

          </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
           
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>

    
  </body>
  
</html>