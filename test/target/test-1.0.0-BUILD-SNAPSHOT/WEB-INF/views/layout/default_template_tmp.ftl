<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
 <head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <link href="/resources/css/bootstrap.min.css" rel="stylesheet" />
  <link href="/resources/fonts/css/font-awesome.min.css" rel="stylesheet" />
  <link href="/resources/css/animate.min.css" rel="stylesheet" />
  <!-- Custom styling plus plugins -->
  <link href="/resources/css/custom.css" rel="stylesheet" />
  <link href="/resources/css/icheck/flat/green.css" rel="stylesheet" />
  <script src="/resources/js/jquery.min.js"></script>
  
  <tiles:insertAttribute name="header" />
  <tiles:insertAttribute name="menu" />
  <tiles:insertAttribute name="body" />
  <tiles:insertAttribute name="footer" />
 </head>
 <body class="nav-md">

  <div class="container body">


    <div class="main_container">

      <div class="col-md-3 left_col">
        <div class="left_col scroll-view">

          <div class="navbar nav_title" style="border: 0;">
            <a href="index.html" class="site_title"><i class="fa fa-paw"></i> <span>조일 마크</span></a>
          </div>
          <div class="clearfix"></div>

          <!-- menu prile quick info -->
          <div class="profile">
            <div class="profile_pic">
              프로필 사진
            </div>
            <div class="profile_info">
              <span>Welcome,</span>
              <h2>이름</h2>
            </div>
          </div>
          <!-- /menu prile quick info -->

          <br />

          <!-- sidebar menu -->
          <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">

            <div class="menu_section">
              <h3>General</h3>
              <ul class="nav side-menu">
                <li><a><i class="fa fa-home"></i> 메뉴 <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
                    <li><a href="index.html">하위 메뉴 1</a>
                    </li>
                    <li><a href="index2.html">하위 메뉴 2</a>
                    </li>
                    <li><a href="index3.html">하위 메뉴 3</a>
                    </li>
                  </ul>
                </li>
                <li><a><i class="fa fa-edit"></i> 메뉴 <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
                    <li><a href="form.html">메뉴</a>
                    </li>                   
                  </ul>
                </li>
                <li><a><i class="fa fa-desktop"></i> 메뉴 <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
                    <li><a href="general_elements.html">메뉴</a>
                    </li>                    
                  </ul>
                </li>
                <li><a><i class="fa fa-table"></i> 메뉴 <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
                    <li><a href="tables.html">메뉴</a>
                    </li>                   
                  </ul>
                </li>
                <li><a><i class="fa fa-bar-chart-o"></i> 메뉴 <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
                    <li><a href="chartjs.html">메뉴</a>
                    </li>                    
                  </ul>
                </li>
              </ul>
            </div>
            <!-- 
            <div class="menu_section">
              <h3>Live On</h3>
              <ul class="nav side-menu">
                <li><a><i class="fa fa-bug"></i> Additional Pages <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
                    <li><a href="e_commerce.html">E-commerce</a>
                    </li>
                    <li><a href="projects.html">Projects</a>
                    </li>
                    <li><a href="project_detail.html">Project Detail</a>
                    </li>
                    <li><a href="contacts.html">Contacts</a>
                    </li>
                    <li><a href="profile.html">Profile</a>
                    </li>
                  </ul>
                </li>
                <li><a><i class="fa fa-windows"></i> Extras <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
                    <li><a href="page_404.html">404 Error</a>
                    </li>
                    <li><a href="page_500.html">500 Error</a>
                    </li>
                    <li><a href="plain_page.html">Plain Page</a>
                    </li>
                    <li><a href="login.html">Login Page</a>
                    </li>
                    <li><a href="pricing_tables.html">Pricing Tables</a>
                    </li>

                  </ul>
                </li>
                <li><a><i class="fa fa-laptop"></i> Landing Page <span class="label label-success pull-right">Coming Soon</span></a>
                </li>
              </ul>
            </div>
			 -->          
 </div>
          <!-- /sidebar menu -->

          <!-- /menu footer buttons -->
          <div class="sidebar-footer hidden-small">
           	왼쪽 하단 고정
          <!--   <a data-toggle="tooltip" data-placement="top" title="Settings">
              <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="FullScreen">
              <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="Lock">
              <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="Logout">
              <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
            </a> -->
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
              	1
              </li>

              <li role="presentation" class="dropdown">
                2
              </li>

            </ul>
          </nav>
        </div>

      </div>
      <!-- /top navigation -->

      <!-- page content -->
      <div class="right_col" role="main">
        <div class="">

          <div class="page-title">
            <div class="title_left">
              <h3>
                    타이틀
                    <small>
               부가설명
                    </small>
                </h3>
            </div>

            <div class="title_right">
              <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                <div class="input-group">
                  타이틀 오른쪽
                </div>
              </div>
            </div>
          </div>
          <div class="clearfix"></div>

          <div class="row">

            123
          </div>
        </div>

        <!-- footer content -->
        <footer>
          <div class="copyright-info">
            <p class="pull-right">하단 카피라이터 부분</a>    
            </p>
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->

      </div>
      <!-- /page content -->
    </div>

  </div>

  <div id="custom_notifications" class="custom-notifications dsp_none">
    <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
    </ul>
    <div class="clearfix"></div>
    <div id="notif-group" class="tabbed_notifications"></div>
  </div>

  <script src="/resources/js/bootstrap.min.js"></script>

  <!-- bootstrap progress js -->
  <script src="/resources/js/progressbar/bootstrap-progressbar.min.js"></script>
  <script src="/resources/js/nicescroll/jquery.nicescroll.min.js"></script>
  <!-- icheck -->
  <script src="/resources/js/icheck/icheck.min.js"></script>
  <!-- pace -->
  <script src="/resources/js/pace/pace.min.js"></script>
  <script src="/resources/js/custom.js"></script>

</body>
</html>
