<#ftl encoding="UTF-8"/>
<#assign tiles=JspTaglibs["http://tiles.apache.org/tags-tiles"] />



<script>
$(function() {	 
	   
 
});


</script>
 <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>${menutitle!}</h2>                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <br />
                  <form id="frm" action="<#if BuyManageVo.abe_seq! &gt; 0>/BuyEnterPriseUpdateProc.joil<#else>/BuyEnterPriseInsertProc.joil</#if>" name="frm" method="post" data-parsley-validate class="form-horizontal form-label-left" >
                    <input type="hidden" id="seq" name="seq" value="${BuyManageVo.abe_seq!}" />
                              
                    
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="abe_name">업체명
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="abe_name" name="abe_name" class="form-control col-md-7 col-xs-12" value="${BuyManageVo.abe_name!}">
                      </div>
                    </div>
                     <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="pi_e_seq">매입종류</label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <select class="form-control" name="abe_group" id="abe_group">
                        	<#list aList as aInfo>
                      			<option value="${aInfo.sc_seq!}" <#if aInfo.sc_seq! == BuyManageVo.abe_group! >selected</#if> >${aInfo.sc_name!}</option>
                            </#list>
                        </select>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="abe_main">주거래품목
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="abe_main" name="abe_main" class="form-control col-md-7 col-xs-12" value="${BuyManageVo.abe_main!}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="abe_owner">대표자
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="abe_owner" name="abe_owner" class="form-control col-md-7 col-xs-12" value="${BuyManageVo.abe_owner!}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="abe_co_number">사업자 번호
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="abe_co_number" name="abe_co_number" class="form-control col-md-7 col-xs-12" value="${BuyManageVo.abe_co_number!}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="abe_tel">전화 번호
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="abe_tel" name="abe_tel" class="form-control col-md-7 col-xs-12" value="${BuyManageVo.abe_tel!}">
                      </div>
                    </div>                    
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="abe_address">주소
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="abe_address" name="abe_address" class="form-control col-md-7 col-xs-12" value="${BuyManageVo.abe_address!}">
                      </div>
                    </div>
                    
                    
                    
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="use_yn">사용 여부
                      </label>
                        <div class="radio">
                          <label>
                            <input type="radio" class="flat" <#if BuyManageVo.use_yn!?default('Y') =='Y'>checked</#if> name="use_yn" id="use_yn" value="Y"> 사용 함
                            <input type="radio" class="flat" <#if BuyManageVo.use_yn!?default('Y') =='N'>checked</#if> name="use_yn" id="use_yn" value="N"> 사용 안 함
                          </label>
                        </div>
                    </div>
                                      
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                        <button type="button" class="btn btn-primary" onClick="location.href='/BuyManage.joil?menuname=BuyEnterPriseList'">취소</button>
                        <button type="submit" class="btn btn-success"><#if BuyManageVo.abe_seq! &gt; 0>수정<#else>등록</#if> </button>
                      </div>
                    </div> 

                  </form>
                </div>
              </div>
            </div>
            
            