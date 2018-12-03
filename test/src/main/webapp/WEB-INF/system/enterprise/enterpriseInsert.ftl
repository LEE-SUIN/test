<#ftl encoding="UTF-8"/>
<#assign tiles=JspTaglibs["http://tiles.apache.org/tags-tiles"] />

 <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>${menutitle!}</h2>                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <br />
                  <form id="frm" action="<#if EnterpriseVo.se_seq! &gt; 0>/EnterpriseUpdateProc.joil<#else>/EnterpriseInsertProc.joil</#if>" name="frm" method="post" data-parsley-validate class="form-horizontal form-label-left" >
                    <input type="hidden" id="seq" name="seq" value="${EnterpriseVo.se_seq!}" />                
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="se_name">업체명<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="se_name" name="se_name" required="required" class="form-control col-md-7 col-xs-12" value="${EnterpriseVo.se_name!}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="se_group">분류
                      </label>
                        <div class="radio">
                          <label>
                            <input type="radio" class="flat" <#if EnterpriseVo.se_group!?default('C') =='C'>checked</#if> name="se_group" id="se_group" value="C">자동차
                            <input type="radio" class="flat" <#if EnterpriseVo.se_group!?default('C') =='E'>checked</#if> name="se_group" id="se_group" value="E">전자
                          </label>
                        </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="se_code">코드명<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="se_code" name="se_code" required="required" class="form-control col-md-7 col-xs-12" value="${EnterpriseVo.se_code!}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="se_address">주소
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="se_address" name="se_address" class="form-control col-md-7 col-xs-12" value="${EnterpriseVo.se_address!}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="se_conumber">사업자번호
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="se_conumber" name="se_conumber" class="form-control col-md-7 col-xs-12" value="${EnterpriseVo.se_conumber!}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="se_tel">대표번호
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="se_tel" name="se_tel" class="form-control col-md-7 col-xs-12" value="${EnterpriseVo.se_tel!}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="se_man">담당자
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="se_man" name="se_man" class="form-control col-md-7 col-xs-12" value="${EnterpriseVo.se_man!}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="se_mannumber">담당자 연락처
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="se_mannumber" name="se_mannumber" class="form-control col-md-7 col-xs-12" value="${EnterpriseVo.se_mannumber!}">
                      </div>
                    </div>
                    
                    
                    
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="use_yn">사용 여부
                      </label>
                        <div class="radio">
                          <label>
                            <input type="radio" class="flat" <#if EnterpriseVo.use_yn!?default('Y') =='Y'>checked</#if> name="use_yn" id="use_yn" value="Y"> 사용 함
                            <input type="radio" class="flat" <#if EnterpriseVo.use_yn!?default('Y') =='N'>checked</#if> name="use_yn" id="use_yn" value="N"> 사용 안 함
                          </label>
                        </div>
                    </div>
                                      
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                        <button type="button" class="btn btn-primary" onClick="location.href='/enterprise.joil?menuname=EnterpriseList'">취소</button>
                        <button type="submit" class="btn btn-success"><#if EnterpriseVo.se_seq! &gt; 0>수정<#else>등록</#if> </button>
                      </div>
                    </div> 

                  </form>
                </div>
              </div>
            </div>
            
            