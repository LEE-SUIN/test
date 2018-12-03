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
                  <form id="frm" action="<#if CodeVo.sc_seq! &gt; 0>/codeUpdateProc.joil<#else>/codeInsertProc.joil</#if>" name="frm" method="post" data-parsley-validate class="form-horizontal form-label-left" >
                    <input type="hidden" id="seq" name="seq" value="${CodeVo.sc_seq!}" />                
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sc_group_seq">코드 그룹 SEQ <span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="sc_group_seq" name="sc_group_seq" required="required" class="form-control col-md-7 col-xs-12" value="${CodeVo.sc_group_seq!}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sc_group_name">코드 분류<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="sc_group_name" name="sc_group_name" required="required" class="form-control col-md-7 col-xs-12" value="${CodeVo.sc_group_name!}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sc_name">코드 명<span class="required">*</span>
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="sc_name" name="sc_name" required="required" class="form-control col-md-7 col-xs-12" value="${CodeVo.sc_name!}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sc_int_etc1">비고1
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="sc_int_etc1" name="sc_int_etc1"  class="form-control col-md-7 col-xs-12" value="${CodeVo.sc_int_etc1!}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sc_string_etc1">비고2
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="sc_string_etc1" name="sc_string_etc1"  class="form-control col-md-7 col-xs-12" value="${CodeVo.sc_string_etc1!}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sc_use_yn">사용 여부
                      </label>
                        <div class="radio">
                          <label>
                            <input type="radio" class="flat" <#if CodeVo.sc_use_yn!?default('Y') =='Y'>checked</#if> name="sc_use_yn" id="sc_use_yn" value="Y"> 사용 함
                            <input type="radio" class="flat" <#if CodeVo.sc_use_yn!?default('Y') =='N'>checked</#if> name="sc_use_yn" id="sc_use_yn" value="N"> 사용 안 함
                          </label>
                        </div>
                    </div>
                                      
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                        <button type="button" class="btn btn-primary" onClick="location.href='/code.joil?menuname=codeList'">취소</button>
                        <button type="submit" class="btn btn-success"><#if CodeVo.sc_seq! &gt; 0>수정<#else>등록</#if> </button>
                      </div>
                    </div> 

                  </form>
                </div>
              </div>
            </div>
            
            