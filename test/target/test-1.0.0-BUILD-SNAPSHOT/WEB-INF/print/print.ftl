<#ftl encoding="UTF-8"/>
<#assign tiles=JspTaglibs["http://tiles.apache.org/tags-tiles"] />
<!-- Bootstrap core CSS -->
<link href="/resources/css/bootstrap.min.css" rel="stylesheet" />
<link href="/resources/fonts/css/font-awesome.min.css" rel="stylesheet" />
<link href="/resources/css/animate.min.css" rel="stylesheet" />
<!-- Custom styling plus plugins -->
<link href="/resources/css/custom.css" rel="stylesheet" />
<link href="/resources/css/icheck/flat/green.css" rel="stylesheet" />

<link href="/resources/css/editor/external/google-code-prettify/prettify.css" rel="stylesheet" />
<link href="/resources/css/editor/index.css" rel="stylesheet" />
<!-- select2 -->
<link href="/resources/css/select/select2.min.css" rel="stylesheet" />
<!-- switchery -->
<link rel="stylesheet" href="/resources/css/switchery/switchery.min.css" />
<link rel="stylesheet" href="/resources/css/jquery-ui.css" />
<script src="/resources/js/jquery-ui.js"></script>
<script type="text/javascript" src="/resources/js/DateTimePicker.js"></script>


<script src="/resources/js/jquery.min.js"></script>
<script>
	$(document).ready(function(e){		
		ActiveX_print();
		}					
	);
</script>
<script type="text/javascript" for="IEPageSetupX" event="OnError(ErrCode, ErrMsg)">alert('에러 코드: ' + ErrCode + "\n에러 메시지: " + ErrMsg);</script>
<script type="text/javascript">
function Installed(){try{return(new ActiveXObject('IEPageSetupX.IEPageSetup'));}catch(e){return false;}}
function PrintTest(){if(!Installed()){alert("컨트롤이 설치되지 않았습니다. 정상적으로 인쇄되지 않을 수 있습니다.");}else{alert("정상적으로 설치되었습니다.");}}
function ActiveX_print(){
 IEPageSetupX.header = ""; // 헤더설정
 IEPageSetupX.footer = ""; // 푸터설정
 IEPageSetupX.leftMargin = 0; // 왼쪽여백설정
 IEPageSetupX.rightMargin = 0; // 오른쪽여백 설정
 IEPageSetupX.topMargin = 0; // 윗쪽여백 설정
 IEPageSetupX.bottomMargin = 0; // 아랫쪽 여백설정
 IEPageSetupX.PrintBackground = true; // 배경색 및 이미지 인쇄
 IEPageSetupX.Orientation = "${PrintVal!}"; // 가로 출력을 원하시면 0을 넣으면 됩니다. 세로출력은 1입니다.
 IEPageSetupX.paper = "A4"; // 용지설정입니다.
 // IEPageSetupX.Print(); // 인쇄하기
 // IEPageSetupX.Print(true); // 인쇄대화상자 띄우기
 // PrintTest(); // 컨트롤설치여부 테스트
 // IEPageSetupX.RollBack(); // 수정 이전 값으로 되돌림(한 단계 이전만 지원)
 // IEPageSetupX.Clear(); // 여백은 0으로, 머리글/바닥글은 모두 제거, 배경색 및 이미지 인쇄 안함
 // IEPageSetupX.SetDefault(); // 기본값으로 되돌림
 // IEPageSetupX.SetDefault(); // 기본값으로 복원(여백 모두: 0.75mm, 머리글:&w&b페이지 &p / &P, 바닥글:&u&b&d, 배경색 및 이미지 인쇄: 안함)
  IEPageSetupX.Preview(); // 미리보기
 // IEPageSetupX.SetupPage(); // 페이지설정창 띄우기
}
</script>


<OBJECT id=IEPageSetupX classid="clsid:41C5BC45-1BE8-42C5-AD9F-495D6C8D7586" codebase="/WEB-INF/print/IEPageSetupX.cab#version=1,4,0,3" width=0 height=0> 
 <param name="copyright" value="http://isulnara.com">
 <table width="580" border="0" align="center" cellpadding="0" cellspacing="0" class="PrintWCheck">
   <tr>
  <td style="font-size:12px; border:1px solid #ddd; background:#efefef; padding:5px;">
  인쇄 제어 컨트롤이 설치되지 않았으며, <a href="/WEB-INF/print/IEPageSetupX.exe"><font color=red>이곳</font></a>을 클릭하여 수동으로 설치가 가능합니다.<br /><br />
  미설치에도 인쇄는 가능하며 설치시 여백 및 머리글, 바닥글을 최적화 합니다.<br /><br />
  컨트롤러 설치를 제외 후 인쇄는 <a href="#PagePrint" onclick="window.print();"><font color=red>이곳</font></a>을 클릭하여 인쇄가능합니다.
  </td>
   </tr>
 </table>
</OBJECT>
<body style="background-color:white;" >

	<div class="forPrint" id="forPrint" >${print_html!}</div>
</body>
</html>