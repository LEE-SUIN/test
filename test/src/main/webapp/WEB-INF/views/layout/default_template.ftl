<#ftl encoding="UTF-8"/>
<#assign tiles=JspTaglibs["http://tiles.apache.org/tags-tiles"] />
<!DOCTYPE html>
<html lang="ko">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <!-- Meta, title, CSS, favicons, etc. -->
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <!-- Bootstrap core CSS -->
  <link href="/resources/css/bootstrap.min.css" rel="stylesheet" />
  <link href="/resources/fonts/css/font-awesome.min.css" rel="stylesheet" />
  <link href="/resources/css/animate.min.css" rel="stylesheet" />
  <!-- Custom styling plus plugins -->
  <link href="/resources/css/custom.css" rel="stylesheet" />
  <link href="/resources/css/icheck/flat/green.css" rel="stylesheet" />
 
  <script src="/resources/js/jquery.min.js"></script>
  <script src="/resources/js/util.js"></script>
  <script>
function printClock() {    
    var clock = document.getElementById("clock");            // 출력할 장소 선택
    var currentDate = new Date();                                     // 현재시간
    var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() // 현재 날짜
    var amPm = '오전'; // 초기값 AM
    var currentHours = addZeros(currentDate.getHours(),2); 
    var currentMinute = addZeros(currentDate.getMinutes() ,2);
    var currentSeconds =  addZeros(currentDate.getSeconds(),2);    
    if(currentHours >= 12){ // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
    	amPm = '오후';
    	currentHours = addZeros(currentHours - 12,2);
    }    
    clock.innerHTML = currentHours+":"+currentMinute+":"+currentSeconds +" <span style='font-size:12px;'>"+ amPm+"</span>"; //날짜를 출력해 줌    
    setTimeout("printClock()",1000);         // 1초마다 printClock() 함수 호출
}

function addZeros(num, digit) { // 자릿수 맞춰주기
	  var zero = '';
	  num = num.toString();
	  if (num.length < digit) {
	    for (i = 0; i < digit - num.length; i++) {
	      zero += '0';
	    }
	  }
	  return zero + num;
}

function passChange()
{
	var frm = document.pFrm;
	if(frm.su_password.value==null || frm.su_password.value=="")
	{
		alert("비밀번호를 입력하세요.");
		frm.su_password.focus();
		return false;
	}
	else
	{
		frm.action="/userPasswordUpdateProc.joil";
		frm.submit();
	}
	
}

</script>
  
  <@tiles.insertAttribute name="header"/>
  

  
 <title>${title!}</title> 
 </head>
<form name="forPrintForm" id="forPrintForm" method="post"  >
	<input type="hidden" name="print_html" id="print_html" value="">
	<input type="hidden" name="PrintCheck" id="PrintCheck" value="${PrintCheck!}">
	<input type="hidden" name="PrintVal" id="PrintVal" value="${PrintVal!}">	
</form>

<form name="forExcelForm" id="forExcelForm" method="post" >
	<input type="hidden" name="start_date" id="start_date" value="${start_date!}">
	<input type="hidden" name="end_date" id="end_date" value="${end_date!}">	
</form>

 <body class="nav-md" onload="printClock()">
 
  <!-- body 시작   -->
  <div class="container body">
  
  
    <!-- main 시작   --> 
    <div class="main_container">
    
      <div class="col-md-3 left_col">
        <div class="left_col scroll-view">

          <div class="navbar nav_title" style="border: 0;">
            <a href="/main.joil" class="site_title">
            <!-- <i class="fa fa-paw"></i>  -->
            	<span>
            		(주) 조 일 
            	</span>
            </a>
          </div>
          <div class="clearfix"></div>

          <!-- menu prile quick info -->
          <div class="profile">
            <div class="profile_pic">
            <#if UserInfo.filelist??>
               	<#list UserInfo.filelist as FileInfo>
               		<#if FileInfo.f_file_ext! = 'jpg' || FileInfo.f_file_ext! = 'jpeg' || FileInfo.f_file_ext! = 'png' || FileInfo.f_file_ext! = 'bmp'>
               			<img src="/resources/uploadFile/${FileInfo.f_save_name!}" class="img-circle profile_img" alt="사용자 사진">
               		</#if>
               	</#list>
	                        	
	        </#if>
            
             
            </div>
            <div class="profile_info">
              <span>반갑습니다.</span>
              <h2>${UserInfo.su_name!}님</h2>
            </div>
          </div>
          <!-- /menu prile quick info -->

          <br />
			
          <!-- leftmenu menu -->
          <!-- <tiles:insertAttribute name="leftmenu" /> -->
          <@tiles.insertAttribute name="leftmenu"/>
          <!-- /leftmenu menu -->

          <!-- /menu footer buttons -->
          <div class="sidebar-footer hidden-small">
          
          </div>
          <!-- /menu footer buttons -->
        </div>
      </div>

      <!-- top navigation -->
      <div class="top_nav">

        <div class="nav_menu">
          <nav class="" role="navigation">
            <div class="nav toggle">
              <a id="menu_toggle"><i class="fa fa-bars"></i></a> 
            </div>
            
            <ul class="nav navbar-nav navbar-right">              
              <li class="">              	
              	<a href="/logout.joil">로그 아웃</a>              	
              </li>
              <li class="">
            	<a data-toggle="modal" data-target=".password">비밀번호 변경</a>
              </li>
              <li role="presentation" class="dropdown">   
              	<a id="clock">
              		
              	</a>
              </li>
            </ul>
          </nav>
        </div>

      </div>
      <!-- /top navigation -->

	  <!--비밀번호 변경 모달 팝업 	 -->
	  <div class="modal fade password" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-sm">
                      <div class="modal-content">

                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span>
                          </button>
                          <h4 class="modal-title" id="myModalLabel2">비밀번호 변경</h4>
                        </div>
                        <div class="modal-body">
                        	
	                        	<form  method="post" name="pFrm"id="pFrm">
	                        		<input type="hidden" name="su_id" id="su_id" value="${UserInfo.su_id!}">
	                        		비밀번호 : <input type="text" name="su_password" id="su_password" class="form-control">
	                        		
	                        	</form>                           
                        	
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-primary" onclick="javascript:passChange();return false;">변경</button>
                          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        </div>

                      </div>
                    </div>
                  </div>

      <!-- page content -->
      <div class="right_col" role="main">
        <div class="">

          <!-- <div class="page-title">
            <div class="title_left">
              <h3>&nbsp;</h3>
            </div>

            <div class="title_right">
              <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                <div class="input-group">
                 
                </div>
              </div>
            </div>
          </div> -->
          <div class="clearfix"></div>
		
          <div class="row">
          <div class="pull-right" style="padding-right:10px;">
          	<button type="button" class="btn btn-default" onclick="javascript:forPrint();">
				<span class="glyphicon glyphicon-print" aria-hidden="true"> 프린트</span>
		  	</button>
		  	<#if menuname! == 'BuyBook'>
		  	<button type="button" class="btn btn-default" onclick="javascript:forExcel();">
				<span class="fa fa-file-excel-o" aria-hidden="true">엑셀다운</span>
		  	</button>
		  	</#if>
          </div>
       
           <!-- <tiles:insertAttribute name="body" />    -->        
           <@tiles.insertAttribute name="body"/>
          </div>

        </div>
 
        <!-- footer content -->
        <footer>
          <div class="pull-right">
                 
            	<!-- <tiles:insertAttribute name="footer" /> -->
            	    <@tiles.insertAttribute name="footer"/>
            	COPYRIGHT © JOIL Co.,Ltd. RIGHTS RESERVED.
            
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->

      </div>
      <!-- /page content -->
      
      
    </div>
	<!-- main 끝   -->


  </div>
  <!-- body 끝 -->
  

  <script src="/resources/js/bootstrap.min.js"></script>
<!-- bootstrap progress js -->
  <script src="/resources/js/progressbar/bootstrap-progressbar.min.js"></script>
  <script src="/resources/js/nicescroll/jquery.nicescroll.min.js"></script>
  <!-- icheck -->
  <script src="/resources/js/icheck/icheck.min.js"></script>
  <!-- tags -->
  <script src="/resources/js/tags/jquery.tagsinput.min.js"></script>
  <!-- switchery -->
  <script src="/resources/js/switchery/switchery.min.js"></script>
  <!-- daterangepicker -->
  <script type="text/javascript" src="/resources/js/moment/moment.min.js"></script>
  <script type="text/javascript" src="/resources/js/datepicker/daterangepicker.js"></script>
  <!-- richtext editor -->
  <script src="/resources/js/editor/bootstrap-wysiwyg.js"></script>
  <script src="/resources/js/editor/external/jquery.hotkeys.js"></script>
  <script src="/resources/js/editor/external/google-code-prettify/prettify.js"></script>
  <!-- select2 -->
  <script src="/resources/js/select/select2.full.js"></script>
  <!-- form validation -->
  <script type="text/javascript" src="/resources/js/parsley/parsley.min.js"></script>
  <!-- textarea resize -->
  <script src="/resources/js/textarea/autosize.min.js"></script>
  <script>
    autosize($('.resizable_textarea'));
  </script>
  <!-- Autocomplete -->
  <script type="text/javascript" src="/resources/js/autocomplete/countries.js"></script>
  <script src="/resources/js/autocomplete/jquery.autocomplete.js"></script>
  <!-- pace -->
  <script src="/resources/js/pace/pace.min.js"></script>
  
  
  <script src="/resources/js/custom.js"></script>            


</body>
</html>
