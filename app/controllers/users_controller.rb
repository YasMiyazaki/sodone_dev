class UsersController < ApplicationController

  def show
      binding.pry
  
    @mxv = 12
    
    # 要修正 自ユーザの値を取得。今は最後のレコードをlastで取得している。
    @gon = AssessmentSelf.select(:organizationtype, :communication, :decisionmaking, :discussion, :confrontation, :responsibility, :trust, :value).last.attributes.values
    gon.organizationtype1 = [@mxv-@gon[1],0,0,0,0,0,0,0] #フラット
    gon.organizationtype2 = [@gon[1],0,0,0,0,0,0,0] #ピラミッド
    gon.communication1 = [0,@mxv-@gon[2],0,0,0,0,0,0]
    gon.communication2 = [0,@gon[2],0,0,0,0,0,0] #ハイコンテクスト
    gon.decisionmaking1 = [0,0,@mxv-@gon[3],0,0,0,0,0]
    gon.decisionmaking2 = [0,0,@gon[3],0,0,0,0,0] #合意形成型
    gon.discussion1 = [0,0,0,@mxv-@gon[4],0,0,0,0]
    gon.discussion2 = [0,0,0,@gon[4],0,0,0,0] #制限
    gon.confrontation1 = [0,0,0,0,@mxv-@gon[5],0,0,0]
    gon.confrontation2 = [0,0,0,0,@gon[5],0,0,0] #回避/建前
    gon.responsibility1 = [0,0,0,0,0,@mxv-@gon[6],0,0] #
    gon.responsibility2 = [0,0,0,0,0,@gon[6],0,0] # 組織
    gon.trust1 = [0,0,0,0,0,0,@mxv-@gon[7],0]
    gon.trust2 = [0,0,0,0,0,0,@gon[7],0] #共感
    gon.value1 = [0,0,0,0,0,0,0,@mxv-@gon[8]] #
    gon.value2 = [0,0,0,0,0,0,0,@gon[8]] #プロセス/型
    
    gon.selfassess = @gon[1..8]
    
    gon.name = current_user.name

  end
end