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

 <body class="nav-md">
 
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
           	왼쪽 하단 고정
          
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
              <li role="presentation" class="dropdown">                
              </li>
            </ul>
          </nav>
        </div>

      </div>
      <!-- /top navigation -->

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
