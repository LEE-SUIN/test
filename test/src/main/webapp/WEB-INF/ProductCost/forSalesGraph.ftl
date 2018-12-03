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
    <link rel="stylesheet" href="/resources/css/progressbar/bootstrap-progressbar-3.3.0.css" />
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
    
  </head>
<form name="forPrintForm" id="forPrintForm" method="post"  >
	<input type="hidden" name="print_html" id="print_html" value="">
	<input type="hidden" name="PrintCheck" id="PrintCheck" value="${PrintCheck!}">
	<input type="hidden" name="PrintVal" id="PrintVal" value="1">	 
</form>
<script>
function forSalesDetailPopup(pl_pi_seq,pl_sc_seq)
{	
	
	$.ajax({
        type: "post",
        url : "/forSalesDetailPopup.joil",
        dataType : "json",
        data: {
        	pl_pi_seq : pl_pi_seq,
        	pl_sc_seq : pl_sc_seq
        },
      success : function(data) {       	  
    	  $("#datatable > tbody > tr").empty();
    	  var listsize = data.List.length;	 
    	  var list = data.List;
    	  for(var i=0;i<listsize;i++)
    	  {
    		$("#datatable > tbody:last").append("<tr style='text-align:center'><td>"+list[i].oe_name+"</td><td>"+list[i].tmp_string+"</td><td>"+comma(list[i].pl_price)+"</td><td>"+list[i].pl_etc1+"</td></tr>");    	    
    	  }
    	      	  
    	  $("#test").modal();
    	  
      },      
      error : function(request, status, error) {
    	  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
      }
      
 	});
}

function comma(num){
    var len, point, str; 
       
    num = num + ""; 
    point = num.length % 3 ;
    len = num.length; 
   
    str = num.substring(0, point); 
    while (point < len) { 
        if (str != "") str += ","; 
        str += num.substring(point, point + 3); 
        point += 3; 
    } 
     
    return str;
 
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
                        	<a href="/forSalesGraph.joil?seq=${IInfo.pi_seq}">${IInfo.pi_joil_number!}</a>
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
					        <th scope="cols"><a href="javascript:forSalesDetailPopup('${Info.pi_seq! }','67')" style="color: black">원재료</a></th>
					        <th scope="cols"><a href="javascript:forSalesDetailPopup('${Info.pi_seq! }','68')" style="color: black">표준품</a></th>
					        <th scope="cols"><a href="javascript:forSalesDetailPopup('${Info.pi_seq! }','69')" style="color: black">설계비</a></th>
					        <th scope="cols">ASSY형상</th>
					        <th scope="cols"><a href="javascript:forSalesDetailPopup('${Info.pi_seq! }','70')" style="color: black">면삭,제관</a></th>
					        <th scope="cols"><a href="javascript:forSalesDetailPopup('${Info.pi_seq! }','71')" style="color: black">선반</a></th>
					        <th scope="cols"><a href="javascript:forSalesDetailPopup('${Info.pi_seq! }','72')" style="color: black">밀링</a></th>
					        <th scope="cols"><a href="javascript:forSalesDetailPopup('${Info.pi_seq! }','73')" style="color: black">와이어</a></th>
					        <th scope="cols"><a href="javascript:forSalesDetailPopup('${Info.pi_seq! }','74')" style="color: black">MCT</a></th>
					        <th scope="cols"><a href="javascript:forSalesDetailPopup('${Info.pi_seq! }','75')" style="color: black">연마</a></th>
					        <th scope="cols"><a href="javascript:forSalesDetailPopup('${Info.pi_seq! }','76')" style="color: black">블록</a></th>
					        <th scope="cols"><a href="javascript:forSalesDetailPopup('${Info.pi_seq! }','77')" style="color: black">열,표면처리</a></th>
					        <th scope="cols"><a href="javascript:forSalesDetailPopup('${Info.pi_seq! }','78')" style="color: black">기타<br>(조립)</a></th>
					        <th scope="cols">관리비</th>
					        <th scope="cols">총계</th>
					    </tr>
					    </thead>
					    <tbody>
					    <tr >
					        <th scope="row" rowspan="2" style="width: 60px;">표준 원가</th>
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
					        <td>10 %</td>
					        <td>65 %</td>
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
					        <td>${Info.pi_order_price! * 10 / 100 }</td>
					        <td>${Info.pi_order_price! * 65 / 100 }</td>
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
					        <td>10 %</td>
					        <td>${ (Info.outside_total! / Info.pi_order_price! * 100)?ceiling + 10 } %</td>
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
					        <td>-</td>
					        <td>${Info.outside_total + (Info.pi_order_price! * 10 / 100) }</td>
					    </tr>
					    <tr>
					    	<th>그래프</th>
					    	<td>
					    		<ul class="verticle_bars list-inline" style="height:100px;">
						    		<li>
						    			<div class="progress vertical bottom" style="height:100px;">
							    			<div class="progress-bar progress-bar-success" role="progressbar" data-transitiongoal="25" style="height:30px;"></div>
							    		</div>
							    	</li>
							    	<li>
							    		<div class="progress vertical bottom" style="height:100px;">
							    			<div class="progress-bar progress-bar-danger" role="progressbar" data-transitiongoal="25" style="height:${ (Info.outside_67! / Info.pi_order_price! * 100)?ceiling * 2}px;"></div>
							    		</div>
						    		</li>
					    		</ul>				    	
                          	</td>                          	
					    	<td>
					    		<ul class="verticle_bars list-inline" style="height:100px;">
						    		<li>
						    			<div class="progress vertical bottom" style="height:100px;">
							    			<div class="progress-bar progress-bar-success" role="progressbar" data-transitiongoal="25" style="height:30px;"></div>
							    		</div>
							    	</li>
							    	<li>
							    		<div class="progress vertical bottom" style="height:100px;">
							    			<div class="progress-bar progress-bar-danger" role="progressbar" data-transitiongoal="25" style="height:${ (Info.outside_68! / Info.pi_order_price! * 100)?ceiling * 3}px;"></div>
							    		</div>
						    		</li>
					    		</ul>
					    	</td>
					    	<td>
					    		<ul class="verticle_bars list-inline" style="height:100px;">
						    		<li>
						    			<div class="progress vertical bottom" style="height:100px;">
							    			<div class="progress-bar progress-bar-success" role="progressbar" data-transitiongoal="25" style="height:20px;"></div>
							    		</div>
							    	</li>
							    	<li>
							    		<div class="progress vertical bottom" style="height:100px;">
							    			<div class="progress-bar progress-bar-danger" role="progressbar" data-transitiongoal="25" style="height:${ (Info.outside_69! / Info.pi_order_price! * 100)?ceiling *5}px;"></div>
							    		</div>
						    		</li>
					    		</ul>
					    	</td>
					    	<td>-</td>
					    	<td>
					    		<ul class="verticle_bars list-inline" style="height:100px;">
						    		<li>
						    			<div class="progress vertical bottom" style="height:100px;">
							    			<div class="progress-bar progress-bar-success" role="progressbar" data-transitiongoal="25" style="height:20px;"></div>
							    		</div>
							    	</li>
							    	<li>
							    		<div class="progress vertical bottom" style="height:100px;">
							    			<div class="progress-bar progress-bar-danger" role="progressbar" data-transitiongoal="25" style="height:${ (Info.outside_70! / Info.pi_order_price! * 100)?ceiling *10}px;"></div>
							    		</div>
						    		</li>
					    		</ul>
					    	</td>
					    	<td>
					    		<ul class="verticle_bars list-inline" style="height:100px;">
						    		<li>
						    			<div class="progress vertical bottom" style="height:100px;">
							    			<div class="progress-bar progress-bar-success" role="progressbar" data-transitiongoal="25" style="height:20px;"></div>
							    		</div>
							    	</li>
							    	<li>
							    		<div class="progress vertical bottom" style="height:100px;">
							    			<div class="progress-bar progress-bar-danger" role="progressbar" data-transitiongoal="25" style="height:${ (Info.outside_71! / Info.pi_order_price! * 100)?ceiling *20}px;"></div>
							    		</div>
						    		</li>
					    		</ul>
					    	</td>
					    	<td>
					    		<ul class="verticle_bars list-inline" style="height:100px;">
						    		<li>
						    			<div class="progress vertical bottom" style="height:100px;">
							    			<div class="progress-bar progress-bar-success" role="progressbar" data-transitiongoal="25" style="height:20px;"></div>
							    		</div>
							    	</li>
							    	<li>
							    		<div class="progress vertical bottom" style="height:100px;">
							    			<div class="progress-bar progress-bar-danger" role="progressbar" data-transitiongoal="25" style="height:${ (Info.outside_72! / Info.pi_order_price! * 100)?ceiling *10}px;"></div>
							    		</div>
						    		</li>
					    		</ul>
					    	</td>
					    	<td>
					    		<ul class="verticle_bars list-inline" style="height:100px;">
						    		<li>
						    			<div class="progress vertical bottom" style="height:100px;">
							    			<div class="progress-bar progress-bar-success" role="progressbar" data-transitiongoal="25" style="height:21px;"></div>
							    		</div>
							    	</li>
							    	<li>
							    		<div class="progress vertical bottom" style="height:100px;">
							    			<div class="progress-bar progress-bar-danger" role="progressbar" data-transitiongoal="25" style="height:${ (Info.outside_73! / Info.pi_order_price! * 100)?ceiling *3}px;"></div>
							    		</div>
						    		</li>
					    		</ul>
					    	</td>
					    	<td>
					    		<ul class="verticle_bars list-inline" style="height:100px;">
						    		<li>
						    			<div class="progress vertical bottom" style="height:100px;">
							    			<div class="progress-bar progress-bar-success" role="progressbar" data-transitiongoal="25" style="height:27px;"></div>
							    		</div>
							    	</li>
							    	<li>
							    		<div class="progress vertical bottom" style="height:100px;">
							    			<div class="progress-bar progress-bar-danger" role="progressbar" data-transitiongoal="25" style="height:${ (Info.outside_74! / Info.pi_order_price! * 100)?ceiling *3}px;"></div>
							    		</div>
						    		</li>
					    		</ul>
					    	</td>
					    	<td>
					    		<ul class="verticle_bars list-inline" style="height:100px;">
						    		<li>
						    			<div class="progress vertical bottom" style="height:100px;">
							    			<div class="progress-bar progress-bar-success" role="progressbar" data-transitiongoal="25" style="height:20px;"></div>
							    		</div>
							    	</li>
							    	<li>
							    		<div class="progress vertical bottom" style="height:100px;">
							    			<div class="progress-bar progress-bar-danger" role="progressbar" data-transitiongoal="25" style="height:${ (Info.outside_75! / Info.pi_order_price! * 100)?ceiling *10}px;"></div>
							    		</div>
						    		</li>
					    		</ul>
					    	</td>
					    	<td>
					    		<ul class="verticle_bars list-inline" style="height:100px;">
						    		<li>
						    			<div class="progress vertical bottom" style="height:100px;">
							    			<div class="progress-bar progress-bar-success" role="progressbar" data-transitiongoal="25" style="height:0px;"></div>
							    		</div>
							    	</li>
							    	<li>
							    		<div class="progress vertical bottom" style="height:100px;">
							    			<div class="progress-bar progress-bar-danger" role="progressbar" data-transitiongoal="25" style="height:${ (Info.outside_76! / Info.pi_order_price! * 100)?ceiling }px;"></div>
							    		</div>
						    		</li>
					    		</ul>
					    	</td>
					    	<td>
					    		<ul class="verticle_bars list-inline" style="height:100px;">
						    		<li>
						    			<div class="progress vertical bottom" style="height:100px;">
							    			<div class="progress-bar progress-bar-success" role="progressbar" data-transitiongoal="25" style="height:20px;"></div>
							    		</div>
							    	</li>
							    	<li>
							    		<div class="progress vertical bottom" style="height:100px;">
							    			<div class="progress-bar progress-bar-danger" role="progressbar" data-transitiongoal="25" style="height:${ (Info.outside_77! / Info.pi_order_price! * 100)?ceiling *20}px;"></div>
							    		</div>
						    		</li>
					    		</ul>
					    	</td>
					    	<td>
					    		<ul class="verticle_bars list-inline" style="height:100px;">
						    		<li>
						    			<div class="progress vertical bottom" style="height:100px;">
							    			<div class="progress-bar progress-bar-success" role="progressbar" data-transitiongoal="25" style="height:20px;"></div>
							    		</div>
							    	</li>
							    	<li>
							    		<div class="progress vertical bottom" style="height:100px;">
							    			<div class="progress-bar progress-bar-danger" role="progressbar" data-transitiongoal="25" style="height:${ (Info.outside_78! / Info.pi_order_price! * 100)?ceiling *10}px;"></div>
							    		</div>
						    		</li>
					    		</ul>
					    	</td>
					    	<td>-</td>
					    	<td>
					    		<ul class="verticle_bars list-inline" style="height:100px;">
						    		<li>
						    			<div class="progress vertical bottom" style="height:100px;">
							    			<div class="progress-bar progress-bar-success" role="progressbar" data-transitiongoal="25" style="height:55px;"></div>
							    		</div>
							    	</li>
							    	<li>
							    		<div class="progress vertical bottom" style="height:100px;">
							    			<div class="progress-bar progress-bar-danger" role="progressbar" data-transitiongoal="25" style="height:${ (Info.outside_total! / Info.pi_order_price! * 100)?ceiling }px;"></div>
							    		</div>
						    		</li>
					    		</ul>
					    	</td>
					    	
					    </tr>
					    
					    <tr>
					    	<th>사내 가공</th>
					    	<td>-</td>
							<td>-</td>
							<td>${Info.inside_37!}<br/><font color="red" style="font-weight:bold" >${ (Info.inside_37! / Info.pi_order_price! * 100)?ceiling } %</font></td>
							<td>-</td>
							<td>-</td>
							<td>${Info.inside_27!}<br/><font color="red" style="font-weight:bold" >${ (Info.inside_27! / Info.pi_order_price! * 100)?ceiling } %</font></td>
							<td>${Info.inside_28 + Info.inside_42 }<br/><font color="red" style="font-weight:bold" >${ ( (Info.inside_28 + Info.inside_42) / Info.pi_order_price! * 100)?ceiling } %</font></td>
							<td>-</td>
							<td>${Info.inside_30!}<br/><font color="red" style="font-weight:bold" >${ (Info.inside_30! / Info.pi_order_price! * 100)?ceiling } %</font></td>
							<td>${Info.inside_31!}<br/><font color="red" style="font-weight:bold" >${ (Info.inside_31! / Info.pi_order_price! * 100)?ceiling } %</font></td>
							<td>-</td>
							<td>-</td>
							<td>${Info.inside_35!}<br/><font color="red" style="font-weight:bold" >${ (Info.inside_35! / Info.pi_order_price! * 100)?ceiling } %</font></td>
							<td>-</td>
							<td>${Info.inside_total!}<br/><font color="red" style="font-weight:bold" >${ (Info.inside_total! / Info.pi_order_price! * 100)?ceiling } %</font></td>
					    </tr>
					    
					    	<tr>
						    	<th scope="row" rowspan="4" >표준 원가 대비</th>
						    	<td scope="row" rowspan="2" >총 제조 원가</td>
						    	<td scope="row" >${ (Info.outside_total! / Info.pi_order_price! * 100)?ceiling +10 } %</td>
						    	<td scope="row" rowspan="2">총 제조 원가<br/>(사내가공 포함)</td>
						    	<td>${ (Info.outside_total! / Info.pi_order_price! * 100)?ceiling +10 + (Info.inside_total! / Info.pi_order_price! * 100)?ceiling } %</td>
						    	<td>&nbsp;</td>
						    	<td style="color:blue;font-weight: bold; background-color:#ececec;" rowspan="2" >수주가<br/>대비</td>
						    	<td style="color:blue;font-weight: bold;" rowspan="2">차액<br/>(사내가공 미포함)</td>
						    	<td style="color:blue;font-weight: bold;">${ ((Info.pi_order_price - Info.outside_total)  / Info.pi_order_price! * 100)?floor -10} %</td>
						    	<td style="color:blue;font-weight: bold;" rowspan="2">차액<br/>(사내가공 포함)</td>
						    	<td style="color:blue;font-weight: bold;">${ ((Info.pi_order_price - Info.outside_total - Info.inside_total)  / Info.pi_order_price! * 100)?floor -10} %</td>
						    	
						    							    							    	
						    </tr>
						    <tr>
						    	<td scope="row" >${Info.outside_total + (Info.pi_order_price! * 10 / 100)}</td>
						    	<td>${Info.outside_total + Info.inside_total +(Info.pi_order_price! * 10 / 100) }</td>	
						    	<td>&nbsp;</td>
						    	<td style="color:blue;font-weight: bold;">${Info.pi_order_price - Info.outside_total - (Info.pi_order_price! * 10 / 100)}</td>
						    	<td style="color:blue;font-weight: bold;">${Info.pi_order_price - Info.outside_total - Info.inside_total - (Info.pi_order_price! * 10 / 100)}</td>
						    					    						    	
						    </tr>
						    <tr style="color:red;font-weight: bold;">						    	
						    	<td scope="row" rowspan="2">차액<br/>(사내가공 미포함)</td>
						    	<td scope="row" >${ 65 - (Info.outside_total! / Info.pi_order_price! * 100)?ceiling - 10 } %</td>
						    	<td scope="row" rowspan="2">차액<br/>(사내가공 포함)</td>
						    	<td>${ 65 - ( Info.outside_total!  / Info.pi_order_price! * 100)?ceiling - ( Info.inside_total!  / Info.pi_order_price! * 100)?ceiling - 10} %</td>						    						    	
						    </tr>
						    <tr style="color:red;font-weight: bold;">
						    	<td scope="row" >${ (Info.pi_order_price! * 65 / 100) - Info.outside_total -(Info.pi_order_price! * 10 / 100)}</td>
						    	<td>${ (Info.pi_order_price! * 65 / 100) - Info.outside_total - Info.inside_total -(Info.pi_order_price! * 10 / 100)}</td>						    							    	
						    </tr>						    
						   <#--  <tr >
						        <th scope="row" rowspan="2">수주가 <br/>대비</th>
						        <td scope="row" rowspan="2">차액<br/>(사내가공 미포함)</td>
						        <td>${ ((Info.pi_order_price - Info.outside_total)  / Info.pi_order_price! * 100)?floor -10} %</td>
						        <td scope="row" rowspan="2">차액<br>(사내가공 포함)</td>
						        <td>${ ((Info.pi_order_price - Info.outside_total - Info.inside_total)  / Info.pi_order_price! * 100)?floor -10} %</td>      
							</tr>
							<tr >						      
						        <td>${Info.pi_order_price - Info.outside_total - (Info.pi_order_price! * 10 / 100)}</td>
						        <td>${Info.pi_order_price - Info.outside_total - Info.inside_total - (Info.pi_order_price! * 10 / 100)}</td>	
						                					        
							</tr>	 -->
					    </tbody>
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

       
      </div>
    </div>

    <script src="/resources/js/progressbar/bootstrap-progressbar.min.js"></script>
    
    
    <div class="modal fade test" tabindex="-1" role="dialog" aria-hidden="true" id="test">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">				                        
          <div class="modal-body">
          	
          	<table class="table table-striped projects" summary="" id="datatable">
        <caption style="padding-top:0px;padding-bottom:0px;"><span class="blind"></span></caption>
         <thead>
           <tr align="center">
             <th style="width: 30%; text-align:center;">업체명</th>
             <th style="width: 20%; text-align:center;">일자</th>
             <th style="width: 20%; text-align:center;">가격</th>
             <th style="width: 30%; text-align:center;">비고</th>             						            
           </tr>
         </thead>
         <tbody>
         	
         </tbody>
     </table>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>
    
    
    
  </body>
  
</html>