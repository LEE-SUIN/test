<#ftl encoding="UTF-8"/>
<#assign tiles=JspTaglibs["http://tiles.apache.org/tags-tiles"] />
<#setting number_format=",###">

<script>

function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

		function carprocal(){
			var carpro_price =$("#carpro_price").val();
			$("#carproval_1").html( comma(Math.floor(carpro_price * 0.9)) );
			var carpro_price1 = Math.floor(carpro_price * 0.9);
			$("#carproval_2").html( comma((Math.floor( (carpro_price * 0.9) * 0.55))) );
			
			$("#carproval_3").html( comma(Math.floor((carpro_price1 * ($("#carprocal_1").html().replace("%","") / 100)) )) );
			$("#carproval_4").html( comma(Math.floor((carpro_price1 * ($("#carprocal_2").html().replace("%","") / 100)) )) );
			$("#carproval_5").html( comma(Math.floor((carpro_price1 * ($("#carprocal_3").html().replace("%","") / 100)) )) );
			$("#carproval_6").html( comma(Math.floor((carpro_price1 * ($("#carprocal_4").html().replace("%","") / 100)) )) );
			$("#carproval_7").html( comma(Math.floor((carpro_price1 * ($("#carprocal_5").html().replace("%","") / 100)) )) );
			$("#carproval_8").html( comma(Math.floor((carpro_price1 * ($("#carprocal_6").html().replace("%","") / 100)) )) );
			$("#carproval_9").html( comma(Math.floor((carpro_price1 * ($("#carprocal_7").html().replace("%","") / 100)) )) );
			$("#carproval_10").html( comma(Math.floor((carpro_price1 * ($("#carprocal_8").html().replace("%","") / 100)) )) );
			$("#carproval_11").html( comma(Math.floor((carpro_price1 * ($("#carprocal_9").html().replace("%","") / 100)) )) );
			$("#carproval_12").html( comma(Math.floor((carpro_price1 * ($("#carprocal_10").html().replace("%","") / 100)) )) );
			$("#carproval_13").html( comma(Math.floor((carpro_price1 * ($("#carprocal_11").html().replace("%","") / 100)) )) );
			$("#carproval_14").html( comma(Math.floor((carpro_price1 * ($("#carprocal_12").html().replace("%","") / 100)) )) );
			
		}
		
		function electandemcal(){
			var electandem_price =$("#electandem_price").val();
			$("#electandemval_1").html( comma(Math.floor(electandem_price * 0.9)) );
			var electandem_price1 = Math.floor(electandem_price * 0.9);
			$("#electandemval_2").html( comma((Math.floor((electandem_price * 0.9) * 0.55))) );
			
			$("#electandemval_3").html( comma(Math.floor((electandem_price1 * ($("#electandemcal_1").html().replace("%","") / 100)) )) );
			$("#electandemval_4").html( comma(Math.floor((electandem_price1 * ($("#electandemcal_2").html().replace("%","") / 100)) )) );
			$("#electandemval_5").html( comma(Math.floor((electandem_price1 * ($("#electandemcal_3").html().replace("%","") / 100)) )) );
			$("#electandemval_6").html( comma(Math.floor((electandem_price1 * ($("#electandemcal_4").html().replace("%","") / 100)) )) );
			$("#electandemval_7").html( comma(Math.floor((electandem_price1 * ($("#electandemcal_5").html().replace("%","") / 100)) )) );
			$("#electandemval_8").html( comma(Math.floor((electandem_price1 * ($("#electandemcal_6").html().replace("%","") / 100)) )) );
			$("#electandemval_9").html( comma(Math.floor((electandem_price1 * ($("#electandemcal_7").html().replace("%","") / 100)) )) );
			$("#electandemval_10").html( comma(Math.floor((electandem_price1 * ($("#electandemcal_8").html().replace("%","") / 100)) )) );
			$("#electandemval_11").html( comma(Math.floor((electandem_price1 * ($("#electandemcal_9").html().replace("%","") / 100)) )) );
			$("#electandemval_12").html( comma(Math.floor((electandem_price1 * ($("#electandemcal_10").html().replace("%","") / 100)) )) );
			$("#electandemval_13").html( comma(Math.floor((electandem_price1 * ($("#electandemcal_11").html().replace("%","") / 100)) )) );
			$("#electandemval_14").html( comma(Math.floor((electandem_price1 * ($("#electandemcal_12").html().replace("%","") / 100)) )) );
			
		}
		
		function elecprocal(){
			var elecpro_price =$("#elecpro_price").val();
			$("#elecproval_1").html( comma(Math.floor(elecpro_price * 0.9)) );
			var elecpro_price1 = Math.floor(elecpro_price * 0.9);
			$("#elecproval_2").html( comma((Math.floor((elecpro_price * 0.9) * 0.55))) );
			
			$("#elecproval_3").html( comma(Math.floor((elecpro_price1 * ($("#elecprocal_1").html().replace("%","") / 100)) )) );
			$("#elecproval_4").html( comma(Math.floor((elecpro_price1 * ($("#elecprocal_2").html().replace("%","") / 100)) )) );
			$("#elecproval_5").html( comma(Math.floor((elecpro_price1 * ($("#elecprocal_3").html().replace("%","") / 100)) )) );
			$("#elecproval_6").html( comma(Math.floor((elecpro_price1 * ($("#elecprocal_4").html().replace("%","") / 100)) )) );
			$("#elecproval_7").html( comma(Math.floor((elecpro_price1 * ($("#elecprocal_5").html().replace("%","") / 100)) )) );
			$("#elecproval_8").html( comma(Math.floor((elecpro_price1 * ($("#elecprocal_6").html().replace("%","") / 100)) )) );
			$("#elecproval_9").html( comma(Math.floor((elecpro_price1 * ($("#elecprocal_7").html().replace("%","") / 100)) )) );
			$("#elecproval_10").html( comma(Math.floor((elecpro_price1 * ($("#elecprocal_8").html().replace("%","") / 100)) )) );
			$("#elecproval_11").html( comma(Math.floor((elecpro_price1 * ($("#elecprocal_9").html().replace("%","") / 100)) )) );
			$("#elecproval_12").html( comma(Math.floor((elecpro_price1 * ($("#elecprocal_10").html().replace("%","") / 100)) )) );
			$("#elecproval_13").html( comma(Math.floor((elecpro_price1 * ($("#elecprocal_11").html().replace("%","") / 100)) )) );
			$("#elecproval_14").html( comma(Math.floor((elecpro_price1 * ($("#elecprocal_12").html().replace("%","") / 100)) )) );
			
		}
	</script>



 <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel">
               
                <div class="x_title">
                  <h2>${menutitle!}</h2>          
                  <ul class="nav navbar-right panel_toolbox">
                    <li>
                    	<div class="input-group" >
	                    &nbsp;
                        </div>
                    	
                    </li>
                    
                  </ul>      
                  <div class="clearfix"></div>
                </div>
                
                
                
                
                <div class="x_content" >
                
                		   <h3>자동차 Progressive</h3>
                		   <div class="panel-body1" style="overflow:scroll;">
                           <table class="table joiltable-bordered  joiltable-striped" style="text-align:right;font-size:12px;" summary="${menutitle!}">
	                       	   <caption><span class="blind">${menutitle!}</span></caption>
	                            <thead>
	                             	<tr >
							            <th style="color:white;background-color:red; " width="140px;">견적가</th>
							            <th style="color:white;background-color:red; ">수주가(예정)<br/>(견적가90%)</th>
							            <th style="color:white;background-color:red; ">투입예산<br/>(수주가55%)</th>
							            <th style="color:white;background-color:red; ">재료비</th>
							            <th style="color:white;background-color:red; ">설계비</th>
							            <th style="color:white;background-color:red; ">열처리</th>
							            <th style="color:white;background-color:red; ">연마</th>
							            <th style="color:white;background-color:red; ">선반</th>
							            <th style="color:white;background-color:red; ">면삭</th>
							            <th style="color:white;background-color:red; ">밀링</th>
							            <th style="color:white;background-color:red; ">MCT</th>
							            <th style="color:white;background-color:red; ">W/C</th>
							            <th style="color:white;background-color:red; ">기타</th>
							            <th style="color:white;background-color:red; ">가공비소계</th>
							            <th style="color:white;background-color:red; ">총계</th>
							        </tr>
							        
	                            </thead>
	                            <tbody style="color:black;">
	                              <tr>
	                                  <td rowspan="2">
	                                  <label for="carpro_price"><span class="blind">자동차Pro</span></label>
	                                 	 <input type="number" id="carpro_price" name="carproval_price" class="form-control"  style="width:140px;"  onkeyup="carprocal();">
	                                  </td>
							          <td rowspan="2" id="carproval_1"></td>
							          <td rowspan="2" id="carproval_2"></td>
							          <td style="height:40px;" id="carproval_3"></td>
							          <td id="carproval_4"></td>
							          <td id="carproval_5"></td>
							          <td id="carproval_6"></td>
							          <td id="carproval_7"></td>	
							          <td id="carproval_8"></td>
							          <td id="carproval_9"></td>
							          <td id="carproval_10"></td>
							          <td id="carproval_11"></td>
							          <td id="carproval_12"></td>
							          <td id="carproval_13"></td>
							          <td id="carproval_14"></td>										          
	                              </tr>
	                              <tr bgcolor="#D8D8D8">
							          <td style="height:40px;" id="carprocal_1">21.0%</td>
							          <td id="carprocal_2">6.0%</td>
							          <td id="carprocal_3">2.0%</td>
							          <td id="carprocal_4">1.6%</td>
							          <td id="carprocal_5">0.0%</td>	
							          <td id="carprocal_6">1.5%</td>
							          <td id="carprocal_7">4.0%</td>
							          <td id="carprocal_8">8.6%</td>
							          <td id="carprocal_9">8.2%</td>
							          <td id="carprocal_10">2.1%</td>
							          <td id="carprocal_11">34.0%</td>
							          <td id="carprocal_12">55.0%</td>
	                              </tr>
	                            
	                            </tbody>
	                          </table>      	
                  			</div>
                  


							<h3>전자 Tandem</h3>
                		   <div class="panel-body2" style="overflow:scroll;">
                           <table class="table joiltable-bordered  joiltable-striped" style="text-align:right;font-size:12px;" summary="${menutitle!}">
	                       	   <caption><span class="blind">${menutitle!}</span></caption>
	                            <thead>
	                             	<tr >
							            <th style="color:white;background-color:red; " width="140px;">견적가</th>
							            <th style="color:white;background-color:red; ">수주가(예정)<br/>(견적가90%)</th>
							            <th style="color:white;background-color:red; ">투입예산<br/>(수주가55%)</th>
							            <th style="color:white;background-color:red; ">재료비</th>
							            <th style="color:white;background-color:red; ">설계비</th>
							            <th style="color:white;background-color:red; ">열처리</th>
							            <th style="color:white;background-color:red; ">연마</th>
							            <th style="color:white;background-color:red; ">선반</th>
							            <th style="color:white;background-color:red; ">면삭</th>
							            <th style="color:white;background-color:red; ">밀링</th>
							            <th style="color:white;background-color:red; ">MCT</th>
							            <th style="color:white;background-color:red; ">W/C</th>
							            <th style="color:white;background-color:red; ">기타</th>
							            <th style="color:white;background-color:red; ">가공비소계</th>
							            <th style="color:white;background-color:red; ">총계</th>
							        </tr>
							        
	                            </thead>
	                            <tbody style="color:black;">
	                              <tr>
	                                  <td rowspan="2">
	                                  <label for="electandem_price"><span class="blind">전자 Tandem</span></label>
	                                  	<input type="number" id="electandem_price" name="electandemval_price" class="form-control"  style="width:140px;" onkeyup="electandemcal();">
	                                  </td>
							          <td rowspan="2" id="electandemval_1"></td>
							          <td rowspan="2" id="electandemval_2"></td>
							          <td style="height:40px;" id="electandemval_3"></td>
							          <td id="electandemval_4"></td>
							          <td id="electandemval_5"></td>
							          <td id="electandemval_6"></td>
							          <td id="electandemval_7"></td>	
							          <td id="electandemval_8"></td>
							          <td id="electandemval_9"></td>
							          <td id="electandemval_10"></td>
							          <td id="electandemval_11"></td>
							          <td id="electandemval_12"></td>
							          <td id="electandemval_13"></td>
							          <td id="electandemval_14"></td>										          
	                              </tr>
	                              <tr bgcolor="#D8D8D8">
							          <td style="height:40px;" id="electandemcal_1">25.4%</td>
							          <td id="electandemcal_2">2.3%</td>
							          <td id="electandemcal_3">4.5%</td>
							          <td id="electandemcal_4">2.8%</td>
							          <td id="electandemcal_5">4.6%</td>	
							          <td id="electandemcal_6">2.6%</td>
							          <td id="electandemcal_7">0.5%</td>
							          <td id="electandemcal_8">4.0%</td>
							          <td id="electandemcal_9">1.3%</td>
							          <td id="electandemcal_10">1.4%</td>
							          <td id="electandemcal_11">24.0%</td>
							          <td id="electandemcal_12">49.4%</td>
	                              </tr>
	                            
	                            </tbody>
	                          </table>
	                          </div>
	                          
	                          
	                          


						<h3>전자 Progressive</h3>
                		   <div class="panel-body3" style="overflow:scroll;">
                           <table class="table joiltable-bordered  joiltable-striped" style="text-align:right;font-size:12px;" summary="${menutitle!}">
	                       	   <caption><span class="blind">${menutitle!}</span></caption>
	                            <thead>
	                             	<tr >
							            <th style="color:white;background-color:red; " width="140px;">견적가</th>
							            <th style="color:white;background-color:red; ">수주가(예정)<br/>(견적가90%)</th>
							            <th style="color:white;background-color:red; ">투입예산<br/>(수주가55%)</th>
							            <th style="color:white;background-color:red; ">재료비</th>
							            <th style="color:white;background-color:red; ">설계비</th>
							            <th style="color:white;background-color:red; ">열처리</th>
							            <th style="color:white;background-color:red; ">연마</th>
							            <th style="color:white;background-color:red; ">선반</th>
							            <th style="color:white;background-color:red; ">면삭</th>
							            <th style="color:white;background-color:red; ">밀링</th>
							            <th style="color:white;background-color:red; ">MCT</th>
							            <th style="color:white;background-color:red; ">W/C</th>
							            <th style="color:white;background-color:red; ">기타</th>
							            <th style="color:white;background-color:red; ">가공비소계</th>
							            <th style="color:white;background-color:red; ">총계</th>
							        </tr>
							        
	                            </thead>
	                            <tbody style="color:black;">
	                              <tr>
	                                  <td rowspan="2">
	                                  <label for="elecpro_price"><span class="blind">전자 Pro</span></label>
	                                  	<input type="number" id="elecpro_price" name="elecpro_price" class="form-control"  style="width:140px;" onkeyup="elecprocal();">
	                                  </td>
							          <td rowspan="2" id="elecproval_1"></td>
							          <td rowspan="2" id="elecproval_2"></td>
							          <td style="height:40px;" id="elecproval_3"></td>
							          <td id="elecproval_4"></td>
							          <td id="elecproval_5"></td>
							          <td id="elecproval_6"></td>
							          <td id="elecproval_7"></td>	
							          <td id="elecproval_8"></td>
							          <td id="elecproval_9"></td>
							          <td id="elecproval_10"></td>
							          <td id="elecproval_11"></td>
							          <td id="elecproval_12"></td>
							          <td id="elecproval_13"></td>
							          <td id="elecproval_14"></td>										          
	                              </tr>
	                              <tr bgcolor="#D8D8D8">
							          <td style="height:40px;" id="elecprocal_1">21.3%</td>
							          <td id="elecprocal_2">4.2%</td>
							          <td id="elecprocal_3">8.4%</td>
							          <td id="elecprocal_4">1.7%</td>
							          <td id="elecprocal_5">5.0%</td>	
							          <td id="elecprocal_6">2.2%</td>
							          <td id="elecprocal_7">0.3%</td>
							          <td id="elecprocal_8">4.1%</td>
							          <td id="elecprocal_9">0.7%</td>
							          <td id="elecprocal_10">0.8%</td>
							          <td id="elecprocal_11">27.4%</td>
							          <td id="elecprocal_12">48.7%</td>
	                              </tr>
	                            
	                            </tbody>
	                          </table>
	                          </div>
                </div>
              
              </div>
            </div>
