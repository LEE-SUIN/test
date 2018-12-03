<#ftl encoding="UTF-8"/>
<#assign tiles=JspTaglibs["http://tiles.apache.org/tags-tiles"] />
<link href="/resources/uploadify/uploadifive.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/resources/uploadify/jquery.uploadifive.js"></script> 

 <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>${menutitle!}</h2>                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <br />
                  <form id="frm" action="/EmailSendUpdateProc.joil" name="frm" method="post" data-parsley-validate class="form-horizontal form-label-left" >
                    <input type="hidden" id="el_seq" name="el_seq" value="${EmailSendVo.el_seq!}" />
                    <!-- <input type="hidden" id="el_order_price" name="el_order_price" value="100" /> -->                
                    
                  
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="el_name">성명</label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        ${EmailSendVo.el_name!}
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="el_email">이메일</label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="el_email" name="el_email" class="form-control col-md-7 col-xs-12" value="${EmailSendVo.el_email!}" >
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="el_year">년차</label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="number" id="el_year" name="el_year" class="form-control col-md-7 col-xs-12" value="${EmailSendVo.el_year!}" >
                      </div>
                    </div>
                     <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="el_give_1">기본급</label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="number" id="el_give_1" name="el_give_1" class="form-control col-md-7 col-xs-12" value="${EmailSendVo.el_give_1!}" >
                      </div>
                    </div>
                     <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="el_give_2">직책수당</label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="number" id="el_give_2" name="el_give_2" class="form-control col-md-7 col-xs-12" value="${EmailSendVo.el_give_2!}" >
                      </div>
                    </div>
                     <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="el_give_3">식대</label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="number" id="el_give_3" name="el_give_3" class="form-control col-md-7 col-xs-12" value="${EmailSendVo.el_give_3!}" >
                      </div>
                    </div>
                     <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="el_give_4">잔업,특근</label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="number" id="el_give_4" name="el_give_4" class="form-control col-md-7 col-xs-12" value="${EmailSendVo.el_give_4!}" >
                      </div>
                    </div>
                     <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="el_give_5">교통비</label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="number" id="el_give_5" name="el_give_5" class="form-control col-md-7 col-xs-12" value="${EmailSendVo.el_give_5!}" >
                      </div>
                    </div>
                     <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="el_deduct_1">갑근세</label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="number" id="el_deduct_1" name="el_deduct_1" class="form-control col-md-7 col-xs-12" value="${EmailSendVo.el_deduct_1!}" >
                      </div>
                    </div>
                     <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="el_deduct_2">주민세</label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="number" id="el_deduct_2" name="el_deduct_2" class="form-control col-md-7 col-xs-12" value="${EmailSendVo.el_deduct_2!}" >
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="el_deduct_3">국민연금</label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="number" id="el_deduct_3" name="el_deduct_3" class="form-control col-md-7 col-xs-12" value="${EmailSendVo.el_deduct_3!}" >
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="el_deduct_4">건강보험</label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="number" id="el_deduct_4" name="el_deduct_4" class="form-control col-md-7 col-xs-12" value="${EmailSendVo.el_deduct_4!}" >
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="el_deduct_5">고용보험</label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="number" id="el_deduct_5" name="el_deduct_5" class="form-control col-md-7 col-xs-12" value="${EmailSendVo.el_deduct_5!}" >
                      </div>
                    </div>
                    
                                   
                  
                                      
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                        <button type="button" class="btn btn-primary" onClick="location.href='/EmailSend.joil?menuname=EmailSendList'">취소</button>
                        <button type="submit" class="btn btn-success">수정</button>
                      </div>
                    </div> 

                  </form>
                </div>
              </div>
            </div>
            
      