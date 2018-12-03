/**
 * 각종 유틸 모음
 */

function forPrint(){
	var forPrint = window.open("",'forPrintPage','resizable=yes,menubar=no,scrollbars=yes,width=1400,height=700,left=5,top=5');
	var html_print = $(".x_content").html();	
	$("#forPrintForm").attr("action","/forPrint.joil");
	$("#forPrintForm").attr("target","forPrintPage");
	
	if($("#PrintCheck").val() == "ProductCostBook"){
		 $(".panel-body").css("overflow","hidden");
		 $(".panel-body").css("height","100%");
		 $(".panel-body").removeAttr("style");
		 
		 $(".panel-body table th").css("position","static");
		 $(".panel-body table td").css("position","static");
		//$("#"+tmp_id).css("position","static");
		var tmp_val = $(".x_content").html();
		
		$("#print_html").val(tmp_val);
	}else if($("#PrintCheck").val() == "WorkStats")
	{
		var tmp_id = $(".in").attr("id");
		var tmp_val = $("#"+tmp_id).html();
		$("#print_html").val(tmp_val);
		
	}else if($("#PrintCheck").val() == "CostStandard")
	{
		$(".panel-body1").css("overflow","hidden");
		$(".panel-body2").css("overflow","hidden");
		$(".panel-body3").css("overflow","hidden");
		html_print = $(".x_content").html();
		$("#print_html").val(html_print);
	}else if($("#PrintCheck").val() == "BuyBook"){	
		
		//$(".joiltable-bordered").removeAttr("style");
		var tmp_val = $(".x_content").html();
		$("#print_html").val(tmp_val);
		
	}else{
		
		$("#print_html").val(html_print);
	}
	
	
	
	$("#forPrintForm").submit();		
	$("#forPrintForm").attr("action","");
	$("#forPrintForm").attr("target","");
	
}

function forExcel()
{
	$("#forExcelForm").attr("action","/forExcel.joil");
	//alert($("#start_date").val());
	$("#forExcelForm").submit();	
}
