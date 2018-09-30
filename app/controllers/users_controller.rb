class UsersController < ApplicationController

  def show

    # URLのShare用
    require "uri"
    @request_url = URI.encode(requestassessment_user_url(params[:id]))
    @result_url = URI.encode(user_url(params[:id]))

    @user = User.find(params[:id]) #ログインユーザではなく、URLのユーザを取得していること

    if AssessmentSelf.where(user_id: @user.id).exists?

      @mxv = 12 #maximum value in assessment
      
      @gon = AssessmentSelf.select(
        :organizationtype,
        :communication,
        :decisionmaking,
        :discussion,
        :confrontation,
        :responsibility,
        :trust,
        :value).find_by(user_id: @user.id).attributes.values
        
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
      
      gon.username = @user.name # URLのユーザ
      
      # 他者のデータ
      if AssessmentOther.where(user_id: @user.id).exists? && @user == current_user
      
        @assessother = AssessmentOther.where(user_id: @user.id)

        gon.assessother = @assessother.to_a

        @requesteduser = Array.new   
        for @n_assessother in @assessother
          
          @requesteduser << User.select(:name).find(@n_assessother.requesteduser_id).attributes.values

        end

        gon.requesteduser = @requesteduser
      
      end
    else
      redirect_back(fallback_location: root_path)
    end

  end
  

  def requestassessment

    if User.exists?(current_user)
      
      @user = User.find(params[:id])

      #一度テスト済みならテストできない。
      if AssessmentOther.where(requesteduser_id: current_user.id).exists?
        flash[:notice] = 'すでに一度このユーザに対して診断済みです。同一ユーザでは一度しかテストができません。'
        redirect_to root_path
      
      elsif current_user.id == params[:id].to_i
        flash[:notice] = '自ユーザが自ユーザに対する他者診断をすることはできません。'
        redirect_to root_path
      
      else
      end
    
    else
      session[:previous_url] = request.fullpath
      redirect_to new_user_session_url
    end
  end
end
