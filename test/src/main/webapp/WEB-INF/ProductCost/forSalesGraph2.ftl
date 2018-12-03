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
	<script src="/resources/js/util.js"></script>
    
    
    
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    
    <#if List!?default('0')?size &gt; 0 > 
      <#list List as Info>
      <#if Info.pi_group_temp != 'Z' >
	      google.charts.load('current', {'packages':['bar']});
	      google.charts.setOnLoadCallback(drawChart${Info.pi_seq!});
	
	      function drawChart${Info.pi_seq!}() {
	        var data = google.visualization.arrayToDataTable([
	          ['${Info.pi_joil_number!}', '표준 원가', '투입 원가', '비고'],
	          ['원재료', 15, ${(Info.outside_67!/ Info.pi_order_price! * 100)?ceiling?replace(",","") },0],
	          ['표준품', 10, ${(Info.outside_68!/ Info.pi_order_price! * 100)?ceiling?replace(",","") },0],
	          ['설계비', 4, ${(Info.outside_69!/ Info.pi_order_price! * 100)?ceiling?replace(",","") },0],
	          ['ASSY형상', 0, 0,0],
	          ['면삭,제관', 2, ${(Info.outside_70!/ Info.pi_order_price! * 100)?ceiling?replace(",","") },0],
	          ['선반', 1, ${(Info.outside_71!/ Info.pi_order_price! * 100)?ceiling?replace(",","") },0],
	          ['밀링', 2, ${(Info.outside_72!/ Info.pi_order_price! * 100)?ceiling?replace(",","") },0],
	          ['와이어', 7, ${(Info.outside_73!/ Info.pi_order_price! * 100)?ceiling?replace(",","") },0],
	          ['MCT', 9, ${(Info.outside_74!/ Info.pi_order_price! * 100)?ceiling?replace(",","") },0],
	          ['연마', 2, ${(Info.outside_75!/ Info.pi_order_price! * 100)?ceiling?replace(",","") },0],
	          ['블록', 0, ${(Info.outside_76!/ Info.pi_order_price! * 100)?ceiling?replace(",","") },0],
	          ['열,표면처리', 1, ${(Info.outside_77!/ Info.pi_order_price! * 100)?ceiling?replace(",","") },0],
	          ['기타', 2, ${(Info.outside_78!/ Info.pi_order_price! * 100)?ceiling?replace(",","") },0],
	          ['총계', 55, ${ (Info.outside_total! / Info.pi_order_price! * 100)?ceiling?replace(",","") },0]
	        ]);
	
	        var options = {
	          chart: {
	            
	          }
	        };
	        var chart = new google.charts.Bar(document.getElementById('columnchart_material${Info.pi_seq!}'));
	        chart.draw(data, google.charts.Bar.convertOptions(options));
	      }
      </#if>
      </#list>
      </#if>
     
    </script>
    
    
  </head>


<form name="forPrintForm" id="forPrintForm" method="post"  >
	<input type="hidden" name="print_html" id="print_html" value="">
	<input type="hidden" name="PrintCheck" id="PrintCheck" value="${PrintCheck!}">
	<input type="hidden" name="PrintVal" id="PrintVal" value="1">	 
</form>

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
                      <a href="/forSales.joil"><button class="btn btn-danger" type="button">표로 보기</button></a>
                      <button type="button" class="btn btn-default" onclick="javascript:forPrint();">
							<span class="glyphicon glyphicon-print" aria-hidden="true"> 프린트</span>
					  	</button>
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
                      <a href="/forSalesGraph.joil?pi_e_code=${EInfo.se_code!}">
                      	<button type="button" class="btn btn-primary">${EInfo.se_name!}</button>
                      </a>
                        
                    </div>
                    
                    </#list>
                    </#if>
                    
                  </div>
                  <div class="x_content">
                	  <#if List!?default('0')?size &gt; 0 > 
                   	 	<#list List as Info>
                   	 	  <#if Info.pi_group_temp != 'Z' >
                   		 	<div id="columnchart_material${Info.pi_seq!}" style="width: 1000px; height: 300px;"></div>
                   		  </#if>
                	    </#list>
                      </#if>
                  </div> <!-- x_content  -->
                  
                  
                </div>

              </div>

          </div>
        </div>
        <!-- /page content -->

        
        
      </div>
    </div>

  </body>
  
</html>

