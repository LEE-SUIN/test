<#ftl encoding="UTF-8"/>
<#assign tiles=JspTaglibs["http://tiles.apache.org/tags-tiles"] />
<title>조일 ERP</title>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/resources/css/bootstrap.min.css" rel="stylesheet" />
<link href="/resources/fonts/css/font-awesome.min.css" rel="stylesheet" />
<link href="/resources/css/animate.min.css" rel="stylesheet" />
<!-- Custom styling plus plugins -->
<link href="/resources/css/custom.css" rel="stylesheet" />
<link href="/resources/css/icheck/flat/green.css" rel="stylesheet" />
<link rel="stylesheet" href="/resources/css/jquery-ui.css" />

<script src="/resources/js/jquery.min.js"></script>
<script>
	function search()
	{
		alert("관련 사항은 이수인 연구원에게 문의 바랍니다.\n 010-6660-7051");
	}
	
	function frmCheck()
	{
		var frm = document.frm;
		if(frm.su_id.value=="" || frm.su_id.value=="")
		{
			alert("아이디를 입력하여 주십시오.");
			frm.su_id.focus();
			return false;
		}
		if(frm.su_password.value=="" || frm.su_password.value=="")
		{
			alert("비밀번호를 입력하여 주십시오.");
			frm.su_password.focus();
			return false;
		}
		frm.submit();
	}
	
</script>  
<title>${title!}</title>
</head>
<body style="background:#F7F7F7;">

  <div class="">
    <a class="hiddenanchor" id="toregister"></a>
    <a class="hiddenanchor" id="tologin"></a>

    <div id="wrapper">
      <div id="login" class="animate form">
        <section class="login_content">
          <form id="frm" name="frm" action="/login.joil" method="post">
            <h1>ERP 로그인</h1>
            <div>
              <input id="su_id" name="su_id" type="text" class="form-control" placeholder="아이디" required="" />
              <label for="su_id"><span class="blind">아이디</span></label>
            </div>
            <div>
              <input id="su_password" name="su_password" type="password" class="form-control" placeholder="비밀번호" required="" />
              <label for="su_password"><span class="blind">비밀번호</span></label>
            </div>
            <div style="text-align: center;">                            
              <input type="submit" class="btn btn-default submit" value="로그인" onClick="javascript:frmCheck();">
            </div>
            <div>
            	<a class="reset_pass" href="javascript:search();">아이디 또는 비밀번호 문의</a>
            </div>
            <div class="clearfix"></div>
  
          </form>
          <!-- form -->
        </section>
        <!-- content -->
      </div>
      
        <!-- content -->
      </div>
    </div>
  

</body>
</html>