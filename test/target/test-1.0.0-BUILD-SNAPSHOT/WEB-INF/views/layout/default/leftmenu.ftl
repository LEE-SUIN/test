<#ftl encoding="UTF-8"/>
<#assign tiles=JspTaglibs["http://tiles.apache.org/tags-tiles"] />
<script>
	$(document).ready(function(){
		var su_menu_auth = "${su_menu_auth!}";
		var menu_auth = su_menu_auth.split('|');		
		
		for(var i=0;i<menu_auth.length;i++)
		{
			$("#"+menu_auth[i]+"").show();
			//$("#"+menu_auth[i]+"").addClass("active");
			 

		}
		
	});
</script>
 <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
            <div class="menu_section">
              <h3>&nbsp;</h3>
              <ul class="nav side-menu">
                <li id="1" style="display: none;"><a><i class="fa fa-money"></i> 품목 관리 <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
                    <li>
                    	<a href="/Item.joil?menuname=ItemList">품목 관리</a>
                    </li>
                    <!-- <li>
                    	<a href="/Item.joil?menuname=ItemStats">품목 통계</a>
                    </li> -->
                  </ul>
                </li>
                <li id="2" style="display: none;"><a><i class="fa fa-wrench"></i> 생산 관리 <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
                    
                    <li><a href="/Work.joil?menuname=WorkList">작업 관리</a></li>
                    <li><a href="/Work.joil?menuname=WorkState">작업 현황</a></li>
                    <li><a href="/Work.joil?menuname=WorkStats">작업 통계</a></li>                  
                  </ul>
                </li>
                <li id="3" style="display: none;"><a><i class="fa fa-file-text-o"></i> 원가 관리 <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
                    <li><a>원가 관리<span class="fa fa-chevron-down"></span></a>
                    	<ul class="nav child_menu" >
                    		<li ><a href="/ProductCost.joil?menuname=ProductCostBook">원가 대장</a></li>
                    		<li ><a href="/ProductCost.joil?menuname=ProductCostList">원가 등록</a></li>                    		
                    		<li><a href="/ProductCost.joil?menuname=ProductCostStats">원가 검색</a></li>
                    		<li><a href="/ProductCost.joil?menuname=ProductCostChart">원가 통계</a></li>
                  		</ul>
                    </li>
                    <li><a>외주 업체 관리<span class="fa fa-chevron-down"></span></a>
                    	<ul class="nav child_menu" >
                    		<li ><a href="/OutSide.joil?menuname=OutSideList">외주 업체 관리</a></li>
                    		<li ><a href="/OutSide.joil?menuname=OutSideWorkList">외주 가공 관리</a></li>
                    		<li ><a href="/OutSide.joil?menuname=OutSideStats">외주 업체 통계</a></li>
                    	</ul>
                    </li>
                    <li><a href="/ProductCost.joil?menuname=CostStandard">외주매입 투입예산</a></li>
                    <li><a href="/ManCost.joil?menuname=ManCostList">임률 관리</a></li>
                  </ul>
                </li>
                <li id="4" style="display: none;"><a><i class="fa fa-hdd-o"></i> 재고 관리 <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
                    <li><a href="tables.html">메뉴4</a>
                    </li>                   
                  </ul>
                </li>
                <li id="5" style="display: none;"><a><i class="fa fa-check-square"></i> 품질 관리 <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
                    <li><a href="chartjs.html">메뉴5</a>
                    </li>                    
                  </ul>
                </li>
                <li id="6" style="display: none;"><a><i class="fa fa-user"></i> 영업 관리 <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
                    <li > <!-- class="current-page" -->
                    	<a href="/enterprise.joil?menuname=EnterpriseList">업체 관리</a>
                    </li>                  
                  </ul>
                </li>
                <li id="7" style="display: none;"><a><i class="fa fa-credit-card"></i> 회계 관리 <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
                   <!--  <li><a>은행별 잔고현황<span class="fa fa-chevron-down"></span></a>
                    	<ul class="nav child_menu" >
                    		<li ><a href="/MoneyManage.joil?menuname=BankState">은행별 잔고현황</a></li>
                    		<li ><a href="/MoneyManage.joil?menuname=BankManage">은행 관리</a></li>
                    		<li ><a href="/MoneyManage.joil?menuname=MoneyState">월 자금현황</a></li>
                    		
                    	</ul>
                    </li> -->
                     <!--
                    <li><a>수주,수금 관리<span class="fa fa-chevron-down"></span></a>
                    	<ul class="nav child_menu" >
                    		<li ><a href="/OrderManage.joil?menuname=CompanyOrderState">업체별 견적 및 수주 현황</a></li>
                    		<li ><a href="/OrderManage.joil?menuname=CollectMoneyState">자동차,전자 수주 진행 수금 현황</a></li>
                    	</ul>
                    </li>   
                    <li><a>마감 현황<span class="fa fa-chevron-down"></span></a>
                    	<ul class="nav child_menu" >
                    		<li ><a href="/FinishState.joil?menuname=MonthState">월 사업부별</a></li>
                    		<li ><a href="/FinishState.joil?menuname=TotalState">매입,매출 현황</a></li>
                    	</ul>
                    </li>  -->  
                    <li><a>매입 관리<span class="fa fa-chevron-down"></span></a> 
                    	<ul class="nav child_menu" >
                    		<li><a href="/BuyManage.joil?menuname=BuyBook">매입 대장</a></li>
                    		<li><a href="/BuyManage.joil?menuname=BuyList">매입 등록</a></li>
                    		<li><a href="/BuyManage.joil?menuname=BuyEnterPriseList">매입 업체 관리</a></li>
                    	</ul>
                    </li> 
                    <li><a>매출 관리<span class="fa fa-chevron-down"></span></a>
                    	<ul class="nav child_menu">
                    		<li ><a href="/BuyManage.joil?menuname=BuyBook">1</a></li>
                    		<li ><a href="/BuyManage.joil?menuname=BuyBook">2</a></li>
                    	</ul>
                    </li>                
                  </ul>
                </li>
                  <li id="8" style="display: none;"><a><i class="fa fa-sitemap"></i> 인사 관리 <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
                    <li > <!-- class="current-page" -->
                    	<a href="/user.joil?menuname=userList">인원 관리</a>
                    </li>                   
                    <li > <!-- class="current-page" -->
                    	<a href="/user.joil?menuname=userStats">직원 통계</a>
                    </li>
                  </ul>
                </li>
                  <li id="9" style="display: none;"><a><i class="fa fa-share-alt"></i> 공정 관리 <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
                    <li><a href="chartjs.html">메뉴9</a>
                    </li>                    
                  </ul>
                </li>
                  <li id="10" style="display: none;"> <a><i class="fa fa-sun-o"></i> 주요 기능 <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
                    <li>
                    	<a href="/BuySell.joil?menuname=BuyStats">1</a>
                    </li>
                    <li>
                    	<a href="/BuySell.joil?menuname=SellStats">2</a>
                    </li>                    
                  </ul>
                </li> 
                <li id="99" style="display: none;"><a><i class="fa fa-gears"></i> 시스템 관리 <span class="fa fa-chevron-down"></span></a>
                  <ul class="nav child_menu" style="display: none">
                  	
                    
                    <li >
                    	<a href="/code.joil?menuname=codeList">코드 관리</a>
                    </li>                    
                  </ul>
                </li>
                
              </ul>
            </div>
                  
 </div>