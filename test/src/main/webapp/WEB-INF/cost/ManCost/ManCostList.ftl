<#ftl encoding="UTF-8"/>
<#assign tiles=JspTaglibs["http://tiles.apache.org/tags-tiles"] />

 <div class="col-md-10 col-sm-12 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>${menutitle!}</h2>                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <br />
                  <form id="frm" action="/ManCostUpdateProc.joil" name="frm" method="post" data-parsley-validate class="form-horizontal form-label-left" >
                    
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="mc_cost_37">설계</label>
                      <div class="col-md-3 col-sm-9 col-xs-12">
                        <input type="number" id="mc_cost_37" name="mc_cost_37"  class="form-control col-md-7 col-xs-12" value="${ManCostVo.mc_cost_37!?number}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="mc_cost_27">선반</label>
                      <div class="col-md-3 col-sm-9 col-xs-12">
                        <input type="number" id="mc_cost_27" name="mc_cost_27"  class="form-control col-md-7 col-xs-12" value="${ManCostVo.mc_cost_27!?number}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="mc_cost_28">밀링</label>
                      <div class="col-md-3 col-sm-9 col-xs-12">
                        <input type="number" id="mc_cost_28" name="mc_cost_28"  class="form-control col-md-7 col-xs-12" value="${ManCostVo.mc_cost_28!?number}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="mc_cost_42">레디알</label>
                      <div class="col-md-3 col-sm-9 col-xs-12">
                        <input type="number" id="mc_cost_42" name="mc_cost_42"  class="form-control col-md-7 col-xs-12" value="${ManCostVo.mc_cost_42!?number}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="mc_cost_31">연마</label>
                      <div class="col-md-3 col-sm-9 col-xs-12">
                        <input type="number" id="mc_cost_31" name="mc_cost_31"  class="form-control col-md-7 col-xs-12" value="${ManCostVo.mc_cost_31!?number}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="mc_cost_30">MCT</label>
                      <div class="col-md-3 col-sm-9 col-xs-12">
                        <input type="number" id="mc_cost_30" name="mc_cost_30"  class="form-control col-md-7 col-xs-12" value="${ManCostVo.mc_cost_30!?number}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="mc_cost_35">조립</label>
                      <div class="col-md-3 col-sm-9 col-xs-12">
                        <input type="number" id="mc_cost_35" name="mc_cost_35"  class="form-control col-md-7 col-xs-12" value="${ManCostVo.mc_cost_35!?number}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="mc_cost_34">기타</label>
                      <div class="col-md-3 col-sm-9 col-xs-12">
                        <input type="number" id="mc_cost_34" name="mc_cost_34"  class="form-control col-md-7 col-xs-12" value="${ManCostVo.mc_cost_34!?number}">
                      </div>
                    </div>
                    
                            
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                        <button type="submit" class="btn btn-success">수정</button>
                      </div>
                    </div> 

                  </form>
                </div>
              </div>
            </div>
            
            