<#ftl encoding="UTF-8"/>
<#assign tiles=JspTaglibs["http://tiles.apache.org/tags-tiles"] />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head>	
</head>

<body>

	<form id="frm" name="frm" method="post" action="${href!}" >
		<input type="hidden" name="url" id="url" value="${href!}" />
	</form>		
	
	
	<#if result!?default('onlygo')=='onlygo'>
	
		 <script language="javascript">		 			
			var frm = document.frm;
			frm.submit();
		</script> 	
	<#elseif result!?default('actiongo')=='alertgo'>	
		<script language="javascript">		
			var frm = document.frm;
			alert("${message!}");
			frm.submit();
		</script>
	<#elseif result!?default('noaction')=='noaction'>	
	
	</#if>

</body>
</html>
