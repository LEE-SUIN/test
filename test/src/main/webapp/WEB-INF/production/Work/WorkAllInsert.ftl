<#ftl encoding="UTF-8"/>
<#assign tiles=JspTaglibs["http://tiles.apache.org/tags-tiles"] />
<#assign usize=uList?size>
<script>

$(function() {
	//var d = new Date().toISOString().slice(0,10);
	//$("#search_date").val(d);
	$("#pw_work_date").datepicker({
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


$(function() {
	var usize = "${usize!}";
	
	$("#addTR").click(function () {
		var tmprowi= $('#table tbody tr').length;
		var rowi=++tmprowi;
		var row = "<tr>";
			row += "<td>"+
			"<select class='form-control' name='pi_seq"+rowi+"' id='pi_seq"+rowi+"' >"+
			"<#list iList as iInfo>"+			
			"<option value='${iInfo.pi_seq!}' >${iInfo.pi_joil_number!}</option>"+
			//"<input type='hidden' name='pw_se_group"+rowi+"' id='pw_se_group"+rowi+"' value='${iInfo.pi_group!}' >"+
			"</#list></select>"+
			"</td>";
			for(var i=1;i<=usize;i++)
			{
				row += "<td><input type='number' id='num"+ rowi+""+i+"' name='num"+ rowi +""+i+"' style='width:20px;' /></td>";				
			}		
			
			row += "<td><span>Remove</span></td>";
			row += "</tr>";
		$("#table").append(row);
				
		
	});
	
	
	$("#table").on("click", "span", function() {
		$(this).closest("tr").remove();
	});
});
	
	
function subcheck()
{
	
	var usize = "${usize!}";
	var tmprowi= $('#table tbody tr').length;
		
	
	
	for(var i=1;i<=tmprowi;i++)
	{
		for(var j=1;j<=usize;j++)
		{
			if($("#num"+i+""+j).val() != "" && $("#num"+i+""+j).val() != null)
			{
				
				var pw_pi_seq;
				var pw_se_seq;
				var pw_se_group;
				var pw_se_group_temp;
				var pw_su_seq;
				var pw_su_job;
				var pw_select_work=60;
				var pw_work_date;
				//j가 입력된 사람의 값임.여기서 su_seq 로 정보 가져옴					
				getInfo($("#pi_seq"+i).val());
				
				pw_pi_seq = $("#pi_seq"+i).val();
				pw_su_seq = $("#su_seq"+j).val();
				pw_su_job = $("#su_job"+j).val().replace("|","");
				pw_pi_job = $("#su_job"+j).val().replace("|","");
				pw_pi_job_time = $("#num"+i+""+j).val();
				pw_se_seq = $("#pw_se_seq").val();
				pw_se_group = $("#pw_se_group").val();
				pw_se_group_temp = $("#pw_se_group_temp").val();
				//alert($("#pw_se_seq").val());
				//alert("비우기 전 pw_se_seq"+pw_se_seq+" \n input 값 = "+$("#pw_se_seq").val()+"\n pw_se_group"+pw_se_group+" \n input 값 = "+$("#pw_se_group").val()+"\n pw_se_group_temp"+pw_se_group_temp+" \n input 값 = "+$("#pw_se_group_temp").val());
				//alert("pi_seq = "+$("#pi_seq"+i).val() +"\n 값 ="+$("#num"+i+""+j).val()+"\n 작업자 시퀀스="+$("#su_seq"+j).val()+"\n 작업자 job="+$("#su_job"+j).val().replace("|","") );
				workinsert(pw_su_seq,pw_su_job,pw_se_seq,pw_se_group,pw_se_group_temp,pw_select_work,pw_pi_seq,pw_pi_job,pw_pi_job_time);
				//alert("비우기 후 pw_se_seq"+pw_se_seq+" \n input 값 = "+$("#pw_se_seq").val()+"\n pw_se_group"+pw_se_group+" \n input 값 = "+$("#pw_se_group").val()+"\n pw_se_group_temp"+pw_se_group_temp+" \n input 값 = "+$("#pw_se_group_temp").val());
			}	
		}		
	}
	
}

function getInfo(seq)
{
	$.ajax({
        type: "post",
        url : "/getItemOne.joil",
        dataType : "json",
        async:false,
        data: {
        	seq : seq
        },
      success : function(data) {	
    	  $("#pw_se_seq").val(data.ItemVo.pi_e_seq);			    
    	  //alert(" ajax 값 = "+data.ItemVo.pi_e_seq+"\n pw_se_seq = "+$("#pw_se_seq").val());
    	  $("#pw_se_group").val(data.ItemVo.pi_group);
    	  $("#pw_se_group_temp").val(data.ItemVo.pi_group_temp);
    	 
      },
      
      error : function(xhr, status, error) {
            alert("에러발생");
      }
 	});
}

function workinsert(pw_su_seq,pw_su_job,pw_se_seq,pw_se_group,pw_se_group_temp,pw_select_work,pw_pi_seq,pw_pi_job,pw_pi_job_time)
{
	//alert($("#pw_se_seq").val()+"\n pw_se_seq = "+pw_se_seq);
	$.ajax({
        type: "post",
        url : "/WorkAllInsertProc.joil",
        dataType : "json",
        data: {
        	  pw_su_seq : pw_su_seq
        	, pw_su_job : pw_su_job
        	, pw_se_seq : pw_se_seq
        	, pw_se_group : pw_se_group
        	, pw_se_group_temp : pw_se_group_temp
        	, pw_select_work : 60
        	, pw_pi_seq : pw_pi_seq
        	, pw_pi_job : pw_pi_job
        	, pw_pi_job_time : pw_pi_job_time
        	, pw_work_date : $("#pw_work_date").val()
        	, pw_etc1 : null
        	, pw_etc2 : null
        	, pw_etc3 : null
        	
        	
        },
      success : function(data) {
    	  if(data.resultCnt != 1 )
    	  {
    		  alert(data.pw_seq+" 등록에 실패하였습니다.");
    	  }else //성공적
    	  {
    		  //alert("성공");
    	  }
      },
      
      error : function(xhr, status, error) {
            alert("에러발생");
      }
 	});
}


</script>
<input type="hidden" name="pw_se_seq" id="pw_se_seq" />
<input type="hidden" name="pw_se_group" id="pw_se_group" />
<input type="hidden" name="pw_se_group_temp" id="pw_se_group_temp" />
	
 <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>${menutitle!}</h2>          
                  <ul class="nav navbar-right panel_toolbox">
                  	<li>
                  		<input type="text" id="pw_work_date" name="pw_work_date" required="required" class="form-control col-md-7 col-xs-12" >
                  	</li>
                    <li>
                    	
                    	<a href="#none" onclick="javascript:subcheck();">
	                    	<button type="button" class="btn btn-primary" >등록</button>
	                    </a>	                                        	       
                    </li>
                  </ul>      
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  
                	<table class="table table-bordered" id="table">
                      <thead>
                        <tr>
                          <th><button id="addTR" class="btn btn-primary" type="button">add</button></th>
                          <#if uList!?default('0')?size &gt; 0 > 
                    	  <#list uList as uInfo>
                          <th>${uInfo.su_name!}${uInfo.su_seq!}</th>
                          <input type="hidden" name="su_seq${uInfo_index+1}" id="su_seq${uInfo_index+1}" value="${uInfo.su_seq!}">
                          <input type="hidden" name="su_job${uInfo_index+1}" id="su_job${uInfo_index+1}" value="${uInfo.su_job!}">
                          </#list>
                          </#if>
                        </tr>
                      </thead>
                      <tbody>
                                                
                      </tbody>
                    </table>

                </div>
                
               
                
              </div>
            </div>
