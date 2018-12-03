<#ftl encoding="UTF-8"/>
<#assign tiles=JspTaglibs["http://tiles.apache.org/tags-tiles"] />
<#setting number_format=",###">

<script>	
$(document).ready(function(){
	$(".bulk-result").hide(); 
	
});

function result()
{
	var tmp=1;
	var listsize = "${ListSize!}";
	
	var pi_order_price=0;
	var outside_67=0;
	var outside_68=0;
	var outside_69=0;
	var outside_sum=0;
	var outside_total=0;
	var rowcount=0;
	
	var avr_pi_order_price=0;
	var avr_outside_67=0;
	var avr_outside_67_sum=0;
	var avr_outside_68=0;
	var avr_outside_68_sum=0;
	var avr_outside_69=0;
	var avr_outside_69_sum=0;
	var avr_outside_sum=0;
	var avr_outside_sum_sum=0;
	var avr_outside_total=0;
	var avr_outside_total_sum=0;
	
	for(var i=0;i<listsize;i++)
	{
		 if($("input:checkbox[id='check_"+i+"']").is(":checked"))
		{	 
			 pi_order_price = Number(pi_order_price) + Number($(".pi_order_price_"+i).html().replace(/,/gi,""));
			 avr_pi_order_price = Number($(".pi_order_price_"+i).html().replace(/,/gi,""));
			 
			 outside_67 = Number(outside_67) + Number($(".outside_67_"+i).html().replace(/,/gi,""));
			 avr_outside_67 = (Number($(".outside_67_"+i).html().replace(/,/gi,"")) / avr_pi_order_price ) * 100 ;
			 avr_outside_67= avr_outside_67.toFixed(2);
			 avr_outside_67_sum = Number(avr_outside_67_sum) + Number(avr_outside_67);
			 
			 
			 outside_68 = Number(outside_68) + Number($(".outside_68_"+i).html().replace(/,/gi,""));
			 avr_outside_68 = (Number($(".outside_68_"+i).html().replace(/,/gi,"")) / avr_pi_order_price ) * 100 ;
			 avr_outside_68= avr_outside_68.toFixed(2);
			 avr_outside_68_sum = Number(avr_outside_68_sum) + Number(avr_outside_68);
			 
			 
			 outside_69 = Number(outside_69) + Number($(".outside_69_"+i).html().replace(/,/gi,""));
			 avr_outside_69 = (Number($(".outside_69_"+i).html().replace(/,/gi,"")) / avr_pi_order_price ) * 100 ;
			 avr_outside_69= avr_outside_69.toFixed(2);
			 avr_outside_69_sum = Number(avr_outside_69_sum) + Number(avr_outside_69);
			 
			 outside_sum = Number(outside_sum) + Number($(".outside_sum_"+i).html().replace(/,/gi,""));
			 avr_outside_sum = (Number($(".outside_sum_"+i).html().replace(/,/gi,"")) / avr_pi_order_price ) * 100 ;
			 avr_outside_sum= avr_outside_sum.toFixed(2);
			 avr_outside_sum_sum = Number(avr_outside_sum_sum) + Number(avr_outside_sum);
			 
			 outside_total = Number(outside_total)+ Number($(".outside_total_"+i).html().replace(/,/gi,""));
			 avr_outside_total = (Number($(".outside_total_"+i).html().replace(/,/gi,"")) / avr_pi_order_price ) * 100 ;
			 avr_outside_total= avr_outside_total.toFixed(2);
			 avr_outside_total_sum = Number(avr_outside_total_sum) + Number(avr_outside_total);
			 
			 rowcount++;
		} 
	}
	
	//$(".rowcount").html(rowcount);
	$(".pi_order_price").html(numberWithCommas(pi_order_price)+"<br/>"+ numberWithCommas( Math.floor(pi_order_price/rowcount) ) );
	
	$(".outside_67").html(numberWithCommas(outside_67)+"<br/>"+ numberWithCommas( Math.floor(outside_67/rowcount) )+"<br/>"+(avr_outside_67_sum / rowcount) );
	$(".outside_68").html(numberWithCommas(outside_68)+"<br/>"+ numberWithCommas( Math.floor(outside_68/rowcount) )+"<br/>"+(avr_outside_68_sum / rowcount) );
	$(".outside_69").html(numberWithCommas(outside_69)+"<br/>"+ numberWithCommas( Math.floor(outside_69/rowcount) )+"<br/>"+(avr_outside_69_sum / rowcount) );
	$(".outside_sum").html(numberWithCommas(outside_sum)+"<br/>"+ numberWithCommas( Math.floor(outside_sum/rowcount) )+"<br/>"+(avr_outside_sum_sum / rowcount) );
	$(".outside_total").html(numberWithCommas(outside_total)+"<br/>"+ numberWithCommas( Math.floor(outside_total/rowcount) )+"<br/>"+(avr_outside_total_sum / rowcount) );
	
}
	
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
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
                    	 
                        </div>
                    	
                    </li>
                    
                  </ul>      
                  <div class="clearfix"></div>
                </div>
                </form>
                 <p>체크 박스를 클릭 하게 되면 통계 자료를 보실 수 있습니다.</p>
                 <div class="x_content">
					<div class="panel-body" >
                   

                    <div class="table-responsive">
                      <table class="table table-striped jambo_table bulk_action">
                        <thead>
                          <tr class="headings">
                            <th>
                              <input type="checkbox" id="check-all" class="flat">
                            </th>
                            <th class="column-title">품목 </th>
                            <th class="column-title">수주가 </th>
                            <th class="column-title">원재료 </th>
                            <th class="column-title">표준품</th>
                            <th class="column-title">외주설계</th>
                            <th class="column-title">외주가공</th>                            
                            <th class="column-title no-link last"><span class="nobr">제조원가</span>
                            </th>
                            <th class="bulk-actions" colspan="7">
                              <a class="antoo" style="color:#fff; font-weight:500;">통계 자료 ( <span class="action-cnt"> </span> ) <i class="fa fa-chevron-down"></i></a>
                            </th>
                          </tr>
                        </thead>

                        <tbody>
                        
                        <#list List as Info>
                        <#if Info.pi_e_code != 'L' && Info.pi_group != 'Z' >
                          <tr class="even pointer">
                            <td class="a-center ">
                              <input type="checkbox" class="flat" name="table_records" id="check_${Info_index!}">
                            </td>
                            <td class=" " id="${Info_index!}">${Info.pi_joil_number! } </td>
                            <td class="pi_order_price_${Info_index!}">${Info.pi_order_price! }</td>
                            <td class="outside_67_${Info_index!}">${Info.outside_67! }</td>
                            <td class="outside_68_${Info_index!}">${Info.outside_68! }</td>
                            <td class="outside_69_${Info_index!}">${Info.outside_69! }</td>
                            <td class="outside_sum_${Info_index!}">${Info.outside_total - Info.outside_67 - Info.outside_68 - Info.outside_69 }</td>                            
                            <td class="outside_total_${Info_index!} last">${Info.outside_total! }</td>
                          </tr>
                        </#if>
                        </#list>
                        
                        </tbody>
                      </table>
                      
                       <table class="table table-striped jambo_table bulk-result">
                        <thead>
                          <tr class="headings">
                            <th class="column-title" rowspan="2"></th>
                            <th class="column-title">수주가 </th>
                            <th class="column-title">원재료 </th>
                            <th class="column-title">표준품</th>
                            <th class="column-title">외주설계</th>
                            <th class="column-title">외주가공</th>                            
                            <th class="column-title no-link last"><span class="nobr">제조원가</span>
                            </th>
                          </tr>
                          
                        </thead>
                        <tbody>
                        	<tr class="">
	                        	<td class="rowcount">총합<br/>평균<br/>%</td>
	                        	<td class="pi_order_price"></td>
	                        	<td class="outside_67"></td>
	                        	<td class="outside_68"></td>
	                        	<td class="outside_69"></td>
	                        	<td class="outside_sum"></td>
	                        	<td class="outside_total"></td>
                        	</tr>
                        </tbody>
                       </table>
                   
                    </div>
                  </div>
              	</div>
              </div>
            </div>
