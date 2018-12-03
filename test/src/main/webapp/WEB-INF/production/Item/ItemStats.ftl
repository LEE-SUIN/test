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
	                      <input type="text" name="start_date" id ="start_date" class="form-control" style="width:100px;" placeholder="시작일자" value="${start_date!}">&nbsp;
	                      <label for="start_date"><span class="blind">시작일자</span></label>
                          <input type="text" name="end_date" id ="end_date" class="form-control" style="width:100px;" placeholder="종료일자" value="${end_date!}">
                          <label for="end_date"><span class="blind">종료일자</span></label>
                          <span class="input-group-btn">
                              <button type="button" class="btn btn-primary" onclick="searchFrm();return false;">검색</button>
                          </span>
                          
                        </div>
                    
                         &nbsp;
                    </li>
                  </ul>      
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                	 
		                  <div  role="tabpanel" data-example-id="togglable-tabs">
		                    <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
		                   		<li role="presentation" >
		                      		<a href="#"  role="tab" data-toggle="tab" aria-expanded="true">전체</a>
		                      	</li>
		                      <#list List as Info>
		                      	<li role="presentation" >
		                      		<a href="#${Info.se_code!}"  role="tab" data-toggle="tab" aria-expanded="true">${Info.se_name!}</a>
		                      	</li>
		                      </#list>

		                    </ul>
		                    <div class="tab-content">
		                    
			                    <div style="width:100%;height:100%;" role="tabpanel" class="tab-pane fade" id="" aria-labelledby="">
			                    	<canvas id="stats"></canvas> 
			                    </div>
		                    
		                      
		                    </div>
		                  </div>
                </div>
              </div>
            </div>
            


<script>
	
 
   
    
  </script>