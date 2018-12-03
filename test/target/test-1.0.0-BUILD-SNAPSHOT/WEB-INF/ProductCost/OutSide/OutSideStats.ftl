<#ftl encoding="UTF-8"/>
<#assign tiles=JspTaglibs["http://tiles.apache.org/tags-tiles"] />
<#setting number_format=",###">
<script> 
/* $(window).scroll(function()  
		    {  
		        $('#scroll').animate({top:$(window).scrollTop()+"px" },{queue: false, duration: 0});    
		    });  
		    //when the close button at right corner of the message box is clicked   
		    $('#scroll').click(function()  
		    {  
		        //the messagebox gets scrool down with top property and gets hidden with zero opacity   
		        $('#scroll').animate({ top:"+=1px",opacity:0 }, "fast");  
		});  
 */
$(function() {
	
	$("#start_date").datepicker({
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
		var start_date = $("#start_date").val();		
		var end_date = $("#end_date").val();
		
		frm.tmp_start_date.value= start_date;
		frm.tmp_end_date.value= end_date;
		frm.submit();					
	}
</script>


<form name="searchfrm" id="searchfrm" method="post" action="/Work.joil?menuname=WorkStats">
	<input type="hidden" name="tmp_start_date" id= "tmp_start_date" />
	<input type="hidden" name="tmp_end_date" id= "tmp_end_date" />
</form>

 <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel" style="width:100%;">
                <div class="x_title">
                  <h2>${menutitle!}</h2>          
                  <ul class="nav navbar-right panel_toolbox">
                    <li>
                    
	                    <div class="input-group" style="width: 25%; float: right;">
	                      <#-- 
	                      <input type="text" name="start_date" id ="start_date" class="form-control" style="width:100px;" placeholder="시작일자" value="${start_date!}">&nbsp;
	                      <label for="start_date"><span class="blind">시작일자</span></label>
                          <input type="text" name="end_date" id ="end_date" class="form-control" style="width:100px;" placeholder="종료일자" value="${end_date!}">
                          <label for="end_date"><span class="blind">종료일자</span></label> 
                         
                       
                          <span class="input-group-btn">
                              <button type="button" class="btn btn-primary" onclick="searchFrm();return false;">검색</button>
                          </span>
                           -->
                              &nbsp;
                        </div>
                    
                         &nbsp;
                    </li>
                  </ul>      
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                	  <div class="col-xs-3" style="overflow:scroll; height:500px;">
                    <!-- required for floating -->
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs tabs-left" >
                    	<#list List as Info>
	                    	<li >
	                      		<a href="#${Info.oe_name!}${Info.oe_seq!}" data-toggle="tab">${Info.oe_name!}</a>
	                    	</li>
                    	</#list>
                      
                    </ul>
                  </div>

                  <div id="scroll"class="col-xs-9" >
                    <!-- Tab panes -->
                    <div class="tab-content" >
                      <#list List as Info>
	                      <div class="tab-pane" id="${Info.oe_name!}${Info.oe_seq!}">	                      
	                      	  <div class="panel-body" style="overflow:scroll; height:500px;">
	                          <table class="table joiltable-bordered  joiltable-striped" style="text-align:right;font-size:11px;" summary="${Info.oe_name!}">
	                       	   <caption><span class="blind">${Info.oe_name!}</span></caption>
	                            <thead>
	                             	<tr >
							            <th style="color:white;background-color:red;text-align:center; ">제번</th>
							            <th style="color:white;background-color:red;text-align:center; ">가공</th>
							            <th style="color:white;background-color:red;text-align:center; ">가공분류</th>
							            <th style="color:white;background-color:red;text-align:center; ">가공세부</th>
							            <th style="color:white;background-color:red;text-align:center; ">금액</th>
							            <th style="color:white;background-color:red;text-align:center; ">수량</th>
							            <th style="color:white;background-color:red;text-align:center; ">일자</th>
							            
							        </tr>
							        
	                            </thead>
	                            <#assign pl_sum=0?number>
	                            <tbody style="color:black;">
	                              <#list oList as oInfo>
	                              
	                              	<#if Info.oe_seq == oInfo.oe_seq && oInfo.use_yn! =='Y'>
		                              <tr>
		                                  <td >${oInfo.pi_joil_number!}<br/>${oInfo.pi_name!}</td>
		                                  <td >${oInfo.sc_name!}</td>
		                                  <td >${oInfo.ow_group_name!}</td>
		                                  <td >${oInfo.ow_group_detail_name!}</td>
		                                  <td >${oInfo.pl_price!}</td>
		                                  <td >${oInfo.pl_amount!}</td>
		                                  <td >${oInfo.pl_date!?date}</td>    
		                              </tr>
		                              <#assign pl_sum=pl_sum + oInfo.pl_sum >
		                            </#if>
	                              </#list>
	                              <tr bgcolor="#D8D8D8">	
						            <td></td>
						            <td></td>
						            <td></td>
						            <td><b>금액 총합계</b></td>
						            <td bgcolor="red"><font color="white">${pl_sum!}</font></td>
						            <td><font color="red"></font></td>
						            <td></td>
		                          </tr>
	                            </tbody>
	                          </table>
	                        </div>
	                      </div>
                      </#list>
                    </div>
                  </div>

                  <div class="clearfix"></div>
		               
                </div>
              </div>
            </div>
            

  