class AssessmentController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user = current_user
    @assessment = AssessmentSelf.new # form_for 用
  end

# 診断結果の登録と同時にUser_detailの結果も保存すること。
#2回目の診断に対応すること。buildでいい？
  def create
    #テスト結果の集計

    #DBへの格納用にファイル編集
    @assessment = AssessmentSelf.new(assessment_params)


    #DB登録開始
    if @assessment.save
      flash[:success]= '診断お疲れさまでした！'
      redirect_to root_url #ユーザの診断結果画面へ遷移させる。※現在未対応。
    else
      flash[:danger] = '診断に問題が発生しました。'
      render 'toppages/index'
      # エラーでもメッセージが出ない。要修正。
    end
  end
  
    private

  def assessment_params
    params.require(:assessment_self).permit(:user_id, :organizationtype, :communication, :discussion, :confrontation, :trust, :decisionmaking, :responsibility, :value)
  end

end
