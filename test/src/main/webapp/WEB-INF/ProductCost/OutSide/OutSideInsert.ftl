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
                  <form id="frm" action="<#if OutSideVo.oe_seq! &gt; 0>/OutSideUpdateProc.joil<#else>/OutSideInsertProc.joil</#if>" name="frm" method="post" data-parsley-validate class="form-horizontal form-label-left" >
                    <input type="hidden" id="seq" name="seq" value="${OutSideVo.oe_seq!}" />                
                                       
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="oe_type">구분<span class="required">*</span>
                      </label>
                        <div class="radio">
                          <label>                
                            <input type="radio" class="flat"  name="oe_type" id="oe_typeB" value="B" <#if OutSideVo.oe_type!?default('B') == 'B' >checked</#if> >매입
                            <input type="radio" class="flat"  name="oe_type" id="oe_typeS" value="S" <#if OutSideVo.oe_type!?default('B') == 'S' >checked</#if> >매출
                          </label>                     
                        </div>                
                               
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="oe_name">업체명
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="oe_name" name="oe_name" class="form-control col-md-7 col-xs-12" value="${OutSideVo.oe_name!}" >
                      </div>
                    </div>
                    <div class="form-group">
					  <label class="control-label col-md-3 col-sm-3 col-xs-12" for="oe_items">품목<span class="required">*</span>
					  </label>
					  <div class="checkbox col-md-6 col-sm-6 col-xs-12">
						  <label>
							<#list jList as jInfo>
								
									<input type="checkbox" class="flat" name="oe_items" id="oe_items" value="${jInfo.sc_seq!}"  
									<#list OutSideVo.oe_items?split("|") as items>
									<#if jInfo.sc_seq?string == items>checked</#if>
									</#list>
									>${jInfo.sc_name!}                           		   
							</#list>
						  </label>
					  </div>
					</div>
                   
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="oe_main">주거래품목
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="oe_main" name="oe_main" class="form-control col-md-7 col-xs-12" value="${OutSideVo.oe_main!}">
                      </div>
                    </div>
                   <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="oe_address">주소
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="oe_address" name="oe_address" class="form-control col-md-7 col-xs-12" value="${OutSideVo.oe_address!}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="oe_tel">전화번호
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="oe_tel" name="oe_tel" class="form-control col-md-7 col-xs-12" value="${OutSideVo.oe_tel!}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="oe_etc1">대표자
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="oe_etc1" name="oe_etc1" class="form-control col-md-7 col-xs-12" value="${OutSideVo.oe_etc1!}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="oe_etc2">사업자번호
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="oe_etc2" name="oe_etc2" class="form-control col-md-7 col-xs-12" value="${OutSideVo.oe_etc2!}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="oe_etc3">비고1
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="oe_etc3" name="oe_etc3" class="form-control col-md-7 col-xs-12" value="${OutSideVo.oe_etc3!}">
                      </div>
                    </div>
                    
                    
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="use_yn">사용 여부
                      </label>
                        <div class="radio">
                          <label>
                            <input type="radio" class="flat" <#if OutSideVo.use_yn!?default('Y') =='Y'>checked</#if> name="use_yn" id="use_yn" value="Y"> 사용 함
                            <input type="radio" class="flat" <#if OutSideVo.use_yn!?default('Y') =='N'>checked</#if> name="use_yn" id="use_yn" value="N"> 사용 안 함
                          </label>
                        </div>
                    </div>
                                      
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                        <button type="button" class="btn btn-primary" onClick="location.href='/OutSide.joil?menuname=OutSideList'">취소</button>
                        <button type="submit" class="btn btn-success"><#if OutSideVo.oe_seq! &gt; 0>수정<#else>등록</#if> </button>
                      </div>
                    </div> 

                  </form>
                </div>
              </div>
            </div>
            
            