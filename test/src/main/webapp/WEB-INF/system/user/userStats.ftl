<#ftl encoding="UTF-8"/>
<#assign tiles=JspTaglibs["http://tiles.apache.org/tags-tiles"] />

<script> 

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
	$("#end_date").datepicker({
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
		                	<a href="#${Info.su_seq}" data-toggle="tab">${Info.su_name!}</a>
		                </li>
	                </#list>
                    </ul>
                  </div>

                  <div id="scroll"class="col-xs-9" >
                    <!-- Tab panes -->
                    <div class="tab-content" >
                     <#list List as Info>    
	                      <div class="tab-pane" id="${Info.su_seq}">	                      
	                      	  <div class="panel-body" style="overflow:scroll;">
	                          <table class="table joiltable-bordered  joiltable-striped" style="text-align:right;font-size:11px;" summary="${menutitle!}">
	                       	   <caption><span class="blind">${menutitle!}</span></caption>
	                            <thead>
	                             	<tr >
							            <th style="color:white;background-color:red;text-align:center;width:20%; ">제번</th>
							            <th style="color:white;background-color:red;text-align:center;width:20%; ">가공</th>
							            <th style="color:white;background-color:red;text-align:center;width:10%; ">시간</th>
							        </tr>
	                            </thead>
	                            
	                            <tbody style="color:black;">
	                            <#assign pw_sum=0?number>
	                            <#list sList as sInfo>
	                            	<#if sInfo.pw_su_seq!?string = Info.su_seq!?string && sInfo.use_yn! = 'Y' >
		                              <tr>
		                                  <td >${sInfo.pi_joil_number!}<br/>${sInfo.pi_name!}</td>
		                                  <td >${sInfo.sc_name!}</td>
		                                  <td >${sInfo.pw_sum!}</td>                
		                              </tr>
		                              <#assign pw_sum=pw_sum?number + sInfo.pw_sum!?number>
		                            </#if>
		                        </#list>
	                              <tr bgcolor="#D8D8D8">
						            <td></td>
						            <td><b>총 시간</b></td>
						            <td bgcolor="red"><font color="white">${pw_sum!}</font></td>
						            
		                          </tr>
	                            </tbody>
	                          </table>
	                        </div>
	                      </div>
	                      </#list>    
                    </div>
                      <!-- Tab panes -->
                    
                  </div>
		                 
                </div>
              </div>
            </div>
            
