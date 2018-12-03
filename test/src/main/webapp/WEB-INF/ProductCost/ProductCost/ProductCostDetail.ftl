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
                    
	                    <div class="input-group">
	                       
	                      <label for="tmp_search_word"><span class="blind">품목명</span></label>
						  <select  class="form-control" name="process_group" id="process_group" onchange="javascript:pChange();">
	                     	
                        		<option value="" ></option>
                        	
                         </select>
			  
                          <span class="input-group-btn" >
                             <button type="button" class="btn btn-primary" onclick="javascript:searchFrm();return false;">검색</button>
                          </span>
                           
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
                    	
	                    	<li >
	                      		<a href="#" data-toggle="tab">ㅁㅁㅁ</a>
	                    	</li>
                    	
                      
                    </ul>
                  </div>

                  <div id="scroll"class="col-xs-9" >
                    <!-- Tab panes -->
                    <div class="tab-content" >
                      
	                      <div class="tab-pane" id="">	                      
	                      	  <div class="panel-body" style="overflow:scroll; height:500px;">
	                          <table class="table joiltable-bordered  joiltable-striped" style="text-align:right;font-size:11px;" summary="">
	                       	   <caption><span class="blind"></span></caption>
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
	                           
	                            <tbody style="color:black;">
	                             
		                              <tr>
		                                  <td >ㅁㄴㅇㄹ</td>
		                                
		                            
		                              </tr>		                           
	                              <tr bgcolor="#D8D8D8">	
						            <td></td>
						            <td></td>
						           
						            <td></td>
		                          </tr>
	                            </tbody>
	                          </table>
	                        </div>
	                      </div>
                 
                    </div>
                  </div>

                  <div class="clearfix"></div>
		               
                </div>
              </div>
            </div>
            

  