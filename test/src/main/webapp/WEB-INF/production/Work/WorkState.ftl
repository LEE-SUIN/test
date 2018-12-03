<#ftl encoding="UTF-8"/>
<#assign tiles=JspTaglibs["http://tiles.apache.org/tags-tiles"] />
<#setting number_format=",###">

<script type="text/javascript" src="/resources/js/tableHeadFixer.js"></script>

<script>	
	  	
	$(document).ready(function () {
		<#list CEList as EInfo>
			$("#${EInfo.se_code!}").tableHeadFixer({"left" : 2});			
		</#list>
		$("#A").tableHeadFixer({"left" : 2});
		$("#R").tableHeadFixer({"left" : 2});
		$("#C").tableHeadFixer({"left" : 2});
		$("#Z").tableHeadFixer({"left" : 2});
    })
 
 
</script>
<script>

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
		frm.start_date.value= start_date;
		frm.end_date.value= end_date;
		frm.submit();					
	}
</script>

<form name="searchfrm" id="searchfrm" method="post" action="">
	<input type="hidden" name="start_date" id= "start_date" />
	<input type="hidden" name="end_date" id= "end_date" />
</form>


 <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel" style="width:100%;">
                <div class="x_title">
                  <h2>${menutitle!}</h2>          
                  <ul class="nav navbar-right panel_toolbox">
                    <li>
                    
	                    <div class="input-group" class="col-md-4 col-sm-4 col-xs-4"	>
                          	 <input type="text" name="tmp_start_date" id ="tmp_start_date" class="form-control" style="width:100px;" placeholder="시작일자" value="${start_date!}">
                          	<label for="tmp_start_date"><span class="blind">시작일자</span></label>
                          	<input type="text" name="tmp_end_date" id ="tmp_end_date" class="form-control" style="width:100px;" placeholder="종료일자" value="${end_date!}">
                          	<label for="tmp_end_date"><span class="blind">종료일자</span></label> 
                          	
                          <span class="input-group-btn" style="float:left;">
                              <button type="button" class="btn btn-primary" onclick="searchFrm();return false;">검색</button>
                          </span>
                          
                           &nbsp;
                        </div>
                         
                         &nbsp;
                    </li>
                  </ul>      
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <div class="" role="tabpanel" data-example-id="togglable-tabs">
                  
                    <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                      <li role="presentation" class="active"><a href="#tab_content1" id="car-tab" role="tab" data-toggle="tab" aria-expanded="true">자동차</a>
                      </li>
                      <li role="presentation" class=""><a href="#tab_content2" role="tab" id="elec-tab" data-toggle="tab" aria-expanded="false">가전</a>
                      </li>
                    </ul>
                    
                    <div id="myTabContent" class="tab-content" >
                      <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="car-tab">
                      
                        <!-- 자동차 내용 시작   -->
                        <div class="col-xs-2" >
		                    <!-- required for floating -->
		                    <!-- Nav tabs -->
		                    <ul class="nav nav-tabs tabs-left">
		                      <#list CEList as EInfo>
		                      	<li >
		                      		<a href="#${EInfo.se_code!}" data-toggle="tab">${EInfo.se_name!}</a>
		                      	</li>
		                      </#list>
		                      
		                    </ul>
		                  </div>

		                  <div class="col-xs-10">
		                    <!-- Tab panes -->
		                    <div class="tab-content" style="overflow: scroll; height:500px;">		
		                      <#list CEList as EInfo>
		                      		<div class="tab-pane" id="${EInfo.se_code!}">
		                      			<table class="table table table-bordered" summary="${menutitle!}">
		                      			 <caption><span class="blind">${menutitle!}</span></caption>
						                    <thead>
						                      <tr>
						                      	<th style="width: 8%">제번</th>
												<th style="width: 10%">품명</th>
						                      	<th style="width: 5%">설계</th>
						                      	<th style="width: 5%">선반</th>
						                      	<th style="width: 5%">밀링</th>
						                      	<th style="width: 5%">레디알</th>
						                      	<th style="width: 5%">MCT</th>
						                      	<th style="width: 5%">연마</th>
						                      	<th style="width: 5%">기타가공</th>
						                      	<th style="width: 5%">조립</th>
						                      	<th style="width: 5%">제조원가</th>
						                      </tr>
						                    </thead>
						                    <tbody>
						                    	
						                    	<#list aList as aInfo>
						                    	    <#assign inside_37=0?number>
													<#assign inside_27=0?number>
													<#assign inside_28=0?number>
													<#assign inside_30=0?number>
													<#assign inside_31=0?number>
													<#assign inside_34=0?number>
													<#assign inside_35=0?number>
													<#assign inside_42=0?number>
													<#assign inside_sum=0?number>
							                    	<#if EInfo.se_seq! == aInfo.pi_e_seq! >
								                    	<tr>
															<td rowspan="2">${aInfo.pi_joil_number!} <br/>${aInfo.pi_e_number!}</td>
															<td rowspan="2">${aInfo.pi_name!}</td>        
															<td>
																<#list wList as wInfo>
																	<#if wInfo.pw_pi_seq! == aInfo.pi_seq! && wInfo.pw_pi_job! == 37>
																		${wInfo.pw_pi_job_time!?string}
																		<#assign inside_37 = wInfo.pw_pi_job_time!>
																	</#if>
																</#list>
															</td>
															<td>
																<#list wList as wInfo>
																	<#if wInfo.pw_pi_seq! == aInfo.pi_seq! && wInfo.pw_pi_job! == 27>
																		${wInfo.pw_pi_job_time!?string}
																		<#assign inside_27 = wInfo.pw_pi_job_time!>
																	</#if>
																</#list>
															</td>
															<td>
																<#list wList as wInfo>
																	<#if wInfo.pw_pi_seq! == aInfo.pi_seq! && wInfo.pw_pi_job! == 28>
																		${wInfo.pw_pi_job_time!?string}
																		<#assign inside_28 = wInfo.pw_pi_job_time!>
																	</#if>
																</#list>
															</td>
															<td>
																<#list wList as wInfo>
																	<#if wInfo.pw_pi_seq! == aInfo.pi_seq! && wInfo.pw_pi_job! == 42>
																		${wInfo.pw_pi_job_time!?string}
																		<#assign inside_42 = wInfo.pw_pi_job_time!>
																	</#if>
																</#list>
															</td>
															<td>
																<#list wList as wInfo>
																	<#if wInfo.pw_pi_seq! == aInfo.pi_seq! && wInfo.pw_pi_job! == 30>
																		${wInfo.pw_pi_job_time!?string}
																		<#assign inside_30 = wInfo.pw_pi_job_time!>
																	</#if>
																</#list>
															</td>
															<td>
																<#list wList as wInfo>
																	<#if wInfo.pw_pi_seq! == aInfo.pi_seq! && wInfo.pw_pi_job! == 31>
																		${wInfo.pw_pi_job_time!?string}
																		<#assign inside_31 = wInfo.pw_pi_job_time!>
																	</#if>
																</#list>
															</td>
															<td>
																<#list wList as wInfo>
																	<#if wInfo.pw_pi_seq! == aInfo.pi_seq! && wInfo.pw_pi_job! == 34>
																		${wInfo.pw_pi_job_time!?string}
																		<#assign inside_34 = wInfo.pw_pi_job_time!>
																	</#if>
																</#list>
															</td>
															<td>
																<#list wList as wInfo>
																	<#if wInfo.pw_pi_seq! == aInfo.pi_seq! && wInfo.pw_pi_job! == 35>
																		${wInfo.pw_pi_job_time!?string}
																		<#assign inside_35 = wInfo.pw_pi_job_time!>
																	</#if>
																</#list>
															</td>    
															<td>
																${(inside_37 + inside_27 + inside_28 + inside_42 + inside_30 + inside_31 + inside_34 + inside_35)?string}
															</td>           
														</tr>
														<tr>
															<td>
																${inside_37 * ManCostVo.mc_cost_37!}
															</td>
															<td>
																${inside_27 * ManCostVo.mc_cost_27!}
															</td>
															<td>
																${inside_28 * ManCostVo.mc_cost_28!}
															</td>
															<td>
																${inside_42 * ManCostVo.mc_cost_42!}
															</td>
															<td>
																${inside_30 * ManCostVo.mc_cost_30!}
															</td>
															<td>
																${inside_31 * ManCostVo.mc_cost_31!}
															</td>
															<td>
																${inside_34 * ManCostVo.mc_cost_34!}
															</td>
															<td>
																${inside_35 * ManCostVo.mc_cost_35!}
															</td>
															<td>
																${ (inside_37 * ManCostVo.mc_cost_37) + (inside_27 * ManCostVo.mc_cost_27) + (inside_28 * ManCostVo.mc_cost_28) + (inside_42 * ManCostVo.mc_cost_42) + (inside_30 * ManCostVo.mc_cost_30) + (inside_31 * ManCostVo.mc_cost_31) + (inside_34 * ManCostVo.mc_cost_34) + (inside_35 * ManCostVo.mc_cost_35) }
															</td>
														</tr>
								                    </#if>
							                    </#list> 
						                    </tbody>
						                  </table>
		                      		
		                      		</div>
		                      				
		                      		
		                      </#list>
		                    </div>
		                  </div>
		                  
                        <!-- 자동차 내용 끝  -->
                        
                      </div>
                      <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="elec-tab">
                      <!-- 가전 시작   -->
                      	<div class="col-xs-2" >
		                    <!-- required for floating -->
		                    <!-- Nav tabs -->
		                    <ul class="nav nav-tabs tabs-left">
		                      	<li >
		                      		<a href="#A" data-toggle="tab">에이컨</a>
		                      	</li>
		                      	<li >
		                      		<a href="#R" data-toggle="tab">냉장고</a>
		                      	</li>
		                      	<li >
		                      		<a href="#C" data-toggle="tab">조리기구</a>
		                      	</li>
		                      	<li >
		                      		<a href="#Z" data-toggle="tab">시방</a>
		                      	</li>
		                      
		                      
		                    </ul>
		                  </div>

		                  <div class="col-xs-10">
		                    <!-- Tab panes -->
		                    <div class="tab-content" style="overflow:scroll; height:500px;">		
		                      		<div class="tab-pane" id="A">
		                      			<table class="table table table-bordered" summary="${menutitle!}">
		                      			 <caption><span class="blind">${menutitle!}</span></caption>
						                    <thead>
						                      <tr>
						                      	<th style="width: 8%">제번</th>
												<th style="width: 10%">품명</th>
						                      	<th style="width: 5%">설계</th>
						                      	<th style="width: 5%">선반</th>
						                      	<th style="width: 5%">밀링</th>
						                      	<th style="width: 5%">레디알</th>
						                      	<th style="width: 5%">MCT</th>
						                      	<th style="width: 5%">연마</th>
						                      	<th style="width: 5%">기타가공</th>
						                      	<th style="width: 5%">조립</th>
						                      	<th style="width: 5%">제조원가</th>
						                      </tr>
						                    </thead>
						                    <tbody>
						                    <#list LGAList as aInfo>
						                    <#assign inside_37=0?number>
											<#assign inside_27=0?number>
											<#assign inside_28=0?number>
											<#assign inside_30=0?number>
											<#assign inside_31=0?number>
											<#assign inside_34=0?number>
											<#assign inside_35=0?number>
											<#assign inside_42=0?number>
											<#assign inside_sum=0?number>
						      					<tr>
						      						<td rowspan="2">${aInfo.pi_joil_number!} <br/>${aInfo.pi_e_number!}</td>
													<td rowspan="2">${aInfo.pi_name!}</td>
						      						<td>
																<#list wList as wInfo>
																	<#if wInfo.pw_pi_seq! == aInfo.pi_seq! && wInfo.pw_pi_job! == 37>
																		${wInfo.pw_pi_job_time!}
																		<#assign inside_37 = wInfo.pw_pi_job_time!>
																	</#if>
																</#list>
															</td>
															<td>
																<#list wList as wInfo>
																	<#if wInfo.pw_pi_seq! == aInfo.pi_seq! && wInfo.pw_pi_job! == 27>
																		${wInfo.pw_pi_job_time!}
																		<#assign inside_27 = wInfo.pw_pi_job_time!>
																	</#if>
																</#list>
															</td>
															<td>
																<#list wList as wInfo>
																	<#if wInfo.pw_pi_seq! == aInfo.pi_seq! && wInfo.pw_pi_job! == 28>
																		${wInfo.pw_pi_job_time!}
																		<#assign inside_28 = wInfo.pw_pi_job_time!>
																	</#if>
																</#list>
															</td>
															<td>
																<#list wList as wInfo>
																	<#if wInfo.pw_pi_seq! == aInfo.pi_seq! && wInfo.pw_pi_job! == 42>
																		${wInfo.pw_pi_job_time!}
																		<#assign inside_42 = wInfo.pw_pi_job_time!>
																	</#if>
																</#list>
															</td>
															<td>
																<#list wList as wInfo>
																	<#if wInfo.pw_pi_seq! == aInfo.pi_seq! && wInfo.pw_pi_job! == 30>
																		${wInfo.pw_pi_job_time!}
																		<#assign inside_30 = wInfo.pw_pi_job_time!>
																	</#if>
																</#list>
															</td>
															<td>
																<#list wList as wInfo>
																	<#if wInfo.pw_pi_seq! == aInfo.pi_seq! && wInfo.pw_pi_job! == 31>
																		${wInfo.pw_pi_job_time!}
																		<#assign inside_31 = wInfo.pw_pi_job_time!>
																	</#if>
																</#list>
															</td>
															<td>
																<#list wList as wInfo>
																	<#if wInfo.pw_pi_seq! == aInfo.pi_seq! && wInfo.pw_pi_job! == 34>
																		${wInfo.pw_pi_job_time!}
																		<#assign inside_34 = wInfo.pw_pi_job_time!>
																	</#if>
																</#list>
															</td>
															<td>
																<#list wList as wInfo>
																	<#if wInfo.pw_pi_seq! == aInfo.pi_seq! && wInfo.pw_pi_job! == 35>
																		${wInfo.pw_pi_job_time!}
																		<#assign inside_35 = wInfo.pw_pi_job_time!>
																	</#if>
																</#list>
															</td>          
															<td>
																${(inside_37 + inside_27 + inside_28 + inside_42 + inside_30 + inside_31 + inside_34 + inside_35)?string}
															</td>       
						      					</tr>
						      					<tr>
															<td>
																${inside_37 * ManCostVo.mc_cost_37!}
															</td>
															<td>
																${inside_27 * ManCostVo.mc_cost_27!}
															</td>
															<td>
																${inside_28 * ManCostVo.mc_cost_28!}
															</td>
															<td>
																${inside_42 * ManCostVo.mc_cost_42!}
															</td>
															<td>
																${inside_30 * ManCostVo.mc_cost_30!}
															</td>
															<td>
																${inside_31 * ManCostVo.mc_cost_31!}
															</td>
															<td>
																${inside_34 * ManCostVo.mc_cost_34!}
															</td>
															<td>
																${inside_35 * ManCostVo.mc_cost_35!}
															</td>
															<td>
																${ (inside_37 * ManCostVo.mc_cost_37) + (inside_27 * ManCostVo.mc_cost_27) + (inside_28 * ManCostVo.mc_cost_28) + (inside_42 * ManCostVo.mc_cost_42) + (inside_30 * ManCostVo.mc_cost_30) + (inside_31 * ManCostVo.mc_cost_31) + (inside_34 * ManCostVo.mc_cost_34) + (inside_35 * ManCostVo.mc_cost_35) }
															</td>
														</tr>
						      				</#list>	
						                    </tbody>
						                  </table>
		                      		
		                      		</div>
		                      				
		                      		<div class="tab-pane" id="R">
		                      			<table class="table table table-bordered"summary="${menutitle!}">
		                      			 <caption><span class="blind">${menutitle!}</span></caption>	                      			
						                    <thead>
						                      <tr>
						                      	<th style="width: 8%">제번</th>
												<th style="width: 10%">품명</th>
						                      	<th style="width: 5%">설계</th>
						                      	<th style="width: 5%">선반</th>
						                      	<th style="width: 5%">밀링</th>
						                      	<th style="width: 5%">레디알</th>
						                      	<th style="width: 5%">MCT</th>
						                      	<th style="width: 5%">연마</th>
						                      	<th style="width: 5%">기타가공</th>
						                      	<th style="width: 5%">조립</th>
						                      	<th style="width: 5%">제조원가</th>
						                      </tr>
						                    </thead>
						                    <tbody>
						                    <#list LGRList as aInfo>
						                    <#assign inside_37=0?number>
											<#assign inside_27=0?number>
											<#assign inside_28=0?number>
											<#assign inside_30=0?number>
											<#assign inside_31=0?number>
											<#assign inside_34=0?number>
											<#assign inside_35=0?number>
											<#assign inside_42=0?number>
											<#assign inside_sum=0?number>
						      					<tr>
						      						<td rowspan="2">${aInfo.pi_joil_number!} <br/>${aInfo.pi_e_number!}</td>
													<td rowspan="2">${aInfo.pi_name!}</td>
						      						<td>
																<#list wList as wInfo>
																	<#if wInfo.pw_pi_seq! == aInfo.pi_seq! && wInfo.pw_pi_job! == 37>
																		${wInfo.pw_pi_job_time!}
																		<#assign inside_37 = wInfo.pw_pi_job_time!>
																	</#if>
																</#list>
															</td>
															<td>
																<#list wList as wInfo>
																	<#if wInfo.pw_pi_seq! == aInfo.pi_seq! && wInfo.pw_pi_job! == 27>
																		${wInfo.pw_pi_job_time!}
																		<#assign inside_27 = wInfo.pw_pi_job_time!>
																	</#if>
																</#list>
															</td>
															<td>
																<#list wList as wInfo>
																	<#if wInfo.pw_pi_seq! == aInfo.pi_seq! && wInfo.pw_pi_job! == 28>
																		${wInfo.pw_pi_job_time!}
																		<#assign inside_28 = wInfo.pw_pi_job_time!>
																	</#if>
																</#list>
															</td>
															<td>
																<#list wList as wInfo>
																	<#if wInfo.pw_pi_seq! == aInfo.pi_seq! && wInfo.pw_pi_job! == 42>
																		${wInfo.pw_pi_job_time!}
																		<#assign inside_42 = wInfo.pw_pi_job_time!>
																	</#if>
																</#list>
															</td>
															<td>
																<#list wList as wInfo>
																	<#if wInfo.pw_pi_seq! == aInfo.pi_seq! && wInfo.pw_pi_job! == 30>
																		${wInfo.pw_pi_job_time!}
																		<#assign inside_30 = wInfo.pw_pi_job_time!>
																	</#if>
																</#list>
															</td>
															<td>
																<#list wList as wInfo>
																	<#if wInfo.pw_pi_seq! == aInfo.pi_seq! && wInfo.pw_pi_job! == 31>
																		${wInfo.pw_pi_job_time!}
																		<#assign inside_31 = wInfo.pw_pi_job_time!>
																	</#if>
																</#list>
															</td>
															<td>
																<#list wList as wInfo>
																	<#if wInfo.pw_pi_seq! == aInfo.pi_seq! && wInfo.pw_pi_job! == 34>
																		${wInfo.pw_pi_job_time!}
																		<#assign inside_34 = wInfo.pw_pi_job_time!>
																	</#if>
																</#list>
															</td>
															<td>
																<#list wList as wInfo>
																	<#if wInfo.pw_pi_seq! == aInfo.pi_seq! && wInfo.pw_pi_job! == 35>
																		${wInfo.pw_pi_job_time!}
																		<#assign inside_35 = wInfo.pw_pi_job_time!>
																	</#if>
																</#list>
															</td>
															<td>
																${(inside_37 + inside_27 + inside_28 + inside_42 + inside_30 + inside_31 + inside_34 + inside_35)?string}
															</td>
															               
						      					</tr>
						      					<tr>
															<td>
																${inside_37 * ManCostVo.mc_cost_37!}
															</td>
															<td>
																${inside_27 * ManCostVo.mc_cost_27!}
															</td>
															<td>
																${inside_28 * ManCostVo.mc_cost_28!}
															</td>
															<td>
																${inside_42 * ManCostVo.mc_cost_42!}
															</td>
															<td>
																${inside_30 * ManCostVo.mc_cost_30!}
															</td>
															<td>
																${inside_31 * ManCostVo.mc_cost_31!}
															</td>
															<td>
																${inside_34 * ManCostVo.mc_cost_34!}
															</td>
															<td>
																${inside_35 * ManCostVo.mc_cost_35!}
															</td>
															<td>
																${ (inside_37 * ManCostVo.mc_cost_37) + (inside_27 * ManCostVo.mc_cost_27) + (inside_28 * ManCostVo.mc_cost_28) + (inside_42 * ManCostVo.mc_cost_42) + (inside_30 * ManCostVo.mc_cost_30) + (inside_31 * ManCostVo.mc_cost_31) + (inside_34 * ManCostVo.mc_cost_34) + (inside_35 * ManCostVo.mc_cost_35) }
															</td>
														</tr>
						      				</#list>	
						                    </tbody>
						                  </table>
		                      		
		                      		</div>
		                      		
		                      		<div class="tab-pane" id="C">
		                      			<table class="table table table-bordered"summary="${menutitle!}">
		                      			 <caption><span class="blind">${menutitle!}</span></caption>	
						                    <thead>
						                      <tr>						                      	
												<th style="width: 8%">제번</th>
												<th style="width: 10%">품명</th>
						                      	<th style="width: 5%">설계</th>
						                      	<th style="width: 5%">선반</th>
						                      	<th style="width: 5%">밀링</th>
						                      	<th style="width: 5%">레디알</th>
						                      	<th style="width: 5%">MCT</th>
						                      	<th style="width: 5%">연마</th>
						                      	<th style="width: 5%">기타가공</th>
						                      	<th style="width: 5%">조립</th>
						                      	<th style="width: 5%">제조원가</th>
						                      </tr>
						                    </thead>
						                    <tbody>
						                    <#list LGCList as aInfo>
						                    <#assign inside_37=0?number>
											<#assign inside_27=0?number>
											<#assign inside_28=0?number>
											<#assign inside_30=0?number>
											<#assign inside_31=0?number>
											<#assign inside_34=0?number>
											<#assign inside_35=0?number>
											<#assign inside_42=0?number>
											<#assign inside_sum=0?number>
						      					<tr>
						      						<td rowspan="2">${aInfo.pi_joil_number!} <br/>${aInfo.pi_e_number!}</td>
													<td rowspan="2">${aInfo.pi_name!}</td>
						      						<td>
																<#list wList as wInfo>
																	<#if wInfo.pw_pi_seq! == aInfo.pi_seq! && wInfo.pw_pi_job! == 37>
																		${wInfo.pw_pi_job_time!}
																		<#assign inside_37 = wInfo.pw_pi_job_time!>
																	</#if>
																</#list>
															</td>
															<td>
																<#list wList as wInfo>
																	<#if wInfo.pw_pi_seq! == aInfo.pi_seq! && wInfo.pw_pi_job! == 27>
																		${wInfo.pw_pi_job_time!}
																		<#assign inside_27 = wInfo.pw_pi_job_time!>
																	</#if>
																</#list>
															</td>
															<td>
																<#list wList as wInfo>
																	<#if wInfo.pw_pi_seq! == aInfo.pi_seq! && wInfo.pw_pi_job! == 28>
																		${wInfo.pw_pi_job_time!}
																		<#assign inside_28 = wInfo.pw_pi_job_time!>
																	</#if>
																</#list>
															</td>
															<td>
																<#list wList as wInfo>
																	<#if wInfo.pw_pi_seq! == aInfo.pi_seq! && wInfo.pw_pi_job! == 42>
																		${wInfo.pw_pi_job_time!}
																		<#assign inside_42 = wInfo.pw_pi_job_time!>
																	</#if>
																</#list>
															</td>
															<td>
																<#list wList as wInfo>
																	<#if wInfo.pw_pi_seq! == aInfo.pi_seq! && wInfo.pw_pi_job! == 30>
																		${wInfo.pw_pi_job_time!}
																		<#assign inside_30 = wInfo.pw_pi_job_time!>
																	</#if>
																</#list>
															</td>
															<td>
																<#list wList as wInfo>
																	<#if wInfo.pw_pi_seq! == aInfo.pi_seq! && wInfo.pw_pi_job! == 31>
																		${wInfo.pw_pi_job_time!}
																		<#assign inside_31 = wInfo.pw_pi_job_time!>
																	</#if>
																</#list>
															</td>
															<td>
																<#list wList as wInfo>
																	<#if wInfo.pw_pi_seq! == aInfo.pi_seq! && wInfo.pw_pi_job! == 34>
																		${wInfo.pw_pi_job_time!}
																		<#assign inside_34 = wInfo.pw_pi_job_time!>
																	</#if>
																</#list>
															</td>
															<td>
																<#list wList as wInfo>
																	<#if wInfo.pw_pi_seq! == aInfo.pi_seq! && wInfo.pw_pi_job! == 35>
																		${wInfo.pw_pi_job_time!}
																		<#assign inside_35 = wInfo.pw_pi_job_time!>
																	</#if>
																</#list>
															</td>          
															<td>
																${(inside_37 + inside_27 + inside_28 + inside_42 + inside_30 + inside_31 + inside_34 + inside_35)?string}
															</td>      
						      					</tr>
						      					<tr>
															<td>
																${inside_37 * ManCostVo.mc_cost_37!}
															</td>
															<td>
																${inside_27 * ManCostVo.mc_cost_27!}
															</td>
															<td>
																${inside_28 * ManCostVo.mc_cost_28!}
															</td>
															<td>
																${inside_42 * ManCostVo.mc_cost_42!}
															</td>
															<td>
																${inside_30 * ManCostVo.mc_cost_30!}
															</td>
															<td>
																${inside_31 * ManCostVo.mc_cost_31!}
															</td>
															<td>
																${inside_34 * ManCostVo.mc_cost_34!}
															</td>
															<td>
																${inside_35 * ManCostVo.mc_cost_35!}
															</td>
															<td>
																${ (inside_37 * ManCostVo.mc_cost_37) + (inside_27 * ManCostVo.mc_cost_27) + (inside_28 * ManCostVo.mc_cost_28) + (inside_42 * ManCostVo.mc_cost_42) + (inside_30 * ManCostVo.mc_cost_30) + (inside_31 * ManCostVo.mc_cost_31) + (inside_34 * ManCostVo.mc_cost_34) + (inside_35 * ManCostVo.mc_cost_35) }
															</td>
														</tr>
						      				</#list>	
						                    </tbody>
						                  </table>
		                      		
		                      		</div>
		                      		
		                      		<div class="tab-pane" id="Z">
		                      			<table class="table table table-bordered"summary="${menutitle!}">
		                      			 <caption><span class="blind">${menutitle!}</span></caption>
						                    <thead>
						                      <tr>
						                      	<th style="width: 8%">제번</th>
						                      	<th style="width: 10%">품명</th>
						                      	<th style="width: 5%">설계</th>
						                      	<th style="width: 5%">선반</th>
						                      	<th style="width: 5%">밀링</th>
						                      	<th style="width: 5%">레디알</th>
						                      	<th style="width: 5%">MCT</th>
						                      	<th style="width: 5%">연마</th>
						                      	<th style="width: 5%">기타가공</th>
						                      	<th style="width: 5%">조립</th>
						                      	<th style="width: 5%">제조원가</th>
						                      </tr>
						                    </thead>
						                    <tbody>
						                    <#list LGZList as aInfo>
						                    <#assign inside_37=0?number>
											<#assign inside_27=0?number>
											<#assign inside_28=0?number>
											<#assign inside_30=0?number>
											<#assign inside_31=0?number>
											<#assign inside_34=0?number>
											<#assign inside_35=0?number>
											<#assign inside_42=0?number>
											<#assign inside_sum=0?number>
						      					<tr>
						      						<td rowspan="2">${aInfo.pi_joil_number!} <br/>${aInfo.pi_e_number!}</td>
						      						<td rowspan="2">${aInfo.pi_name!}</td>
						      						<td>
																<#list wList as wInfo>
																	<#if wInfo.pw_pi_seq! == aInfo.pi_seq! && wInfo.pw_pi_job! == 37>
																		${wInfo.pw_pi_job_time!}
																		<#assign inside_37 = wInfo.pw_pi_job_time!>
																	</#if>
																</#list>
															</td>
															<td>
																<#list wList as wInfo>
																	<#if wInfo.pw_pi_seq! == aInfo.pi_seq! && wInfo.pw_pi_job! == 27>
																		${wInfo.pw_pi_job_time!}
																		<#assign inside_27 = wInfo.pw_pi_job_time!>
																	</#if>
																</#list>
															</td>
															<td>
																<#list wList as wInfo>
																	<#if wInfo.pw_pi_seq! == aInfo.pi_seq! && wInfo.pw_pi_job! == 28>
																		${wInfo.pw_pi_job_time!}
																		<#assign inside_28 = wInfo.pw_pi_job_time!>
																	</#if>
																</#list>
															</td>
															<td>
																<#list wList as wInfo>
																	<#if wInfo.pw_pi_seq! == aInfo.pi_seq! && wInfo.pw_pi_job! == 42>
																		${wInfo.pw_pi_job_time!}
																		<#assign inside_42 = wInfo.pw_pi_job_time!>
																	</#if>
																</#list>
															</td>
															<td>
																<#list wList as wInfo>
																	<#if wInfo.pw_pi_seq! == aInfo.pi_seq! && wInfo.pw_pi_job! == 30>
																		${wInfo.pw_pi_job_time!}
																		<#assign inside_30 = wInfo.pw_pi_job_time!>
																	</#if>
																</#list>
															</td>
															<td>
																<#list wList as wInfo>
																	<#if wInfo.pw_pi_seq! == aInfo.pi_seq! && wInfo.pw_pi_job! == 31>
																		${wInfo.pw_pi_job_time!}
																		<#assign inside_31 = wInfo.pw_pi_job_time!>
																	</#if>
																</#list>
															</td>
															<td>
																<#list wList as wInfo>
																	<#if wInfo.pw_pi_seq! == aInfo.pi_seq! && wInfo.pw_pi_job! == 34>
																		${wInfo.pw_pi_job_time!}
																		<#assign inside_34 = wInfo.pw_pi_job_time!>
																	</#if>
																</#list>
															</td>
															<td>
																<#list wList as wInfo>
																	<#if wInfo.pw_pi_seq! == aInfo.pi_seq! && wInfo.pw_pi_job! == 35>
																		${wInfo.pw_pi_job_time!}
																		<#assign inside_35 = wInfo.pw_pi_job_time!>
																	</#if>
																</#list>
															</td>            
															<td>
																${(inside_37 + inside_27 + inside_28 + inside_42 + inside_30 + inside_31 + inside_34 + inside_35)?string}
															</td>     
						      					</tr>
						      					<tr>
															<td>
																${inside_37 * ManCostVo.mc_cost_37!}
															</td>
															<td>
																${inside_27 * ManCostVo.mc_cost_27!}
															</td>
															<td>
																${inside_28 * ManCostVo.mc_cost_28!}
															</td>
															<td>
																${inside_42 * ManCostVo.mc_cost_42!}
															</td>
															<td>
																${inside_30 * ManCostVo.mc_cost_30!}
															</td>
															<td>
																${inside_31 * ManCostVo.mc_cost_31!}
															</td>
															<td>
																${inside_34 * ManCostVo.mc_cost_34!}
															</td>
															<td>
																${inside_35 * ManCostVo.mc_cost_35!}
															</td>
															<td>
																${ (inside_37 * ManCostVo.mc_cost_37) + (inside_27 * ManCostVo.mc_cost_27) + (inside_28 * ManCostVo.mc_cost_28) + (inside_42 * ManCostVo.mc_cost_42) + (inside_30 * ManCostVo.mc_cost_30) + (inside_31 * ManCostVo.mc_cost_31) + (inside_34 * ManCostVo.mc_cost_34) + (inside_35 * ManCostVo.mc_cost_35) }
															</td>
														</tr>
						      				</#list>	
						                    </tbody>
						                  </table>
		                      		
		                      		</div>
		                      
		                    </div>
		                  </div>
                      <!-- 가전 끝   -->  
                      </div>
                      
                    </div>
                    
                  </div>
                  <!-- end project list -->

                </div>
              </div>
            </div>
