class AssessmentController < ApplicationController
  before_action :authenticate_user!, except: [:about]
  
  def index
    @user = current_user
    @assessment = AssessmentSelf.new # form_for 用
  end

# 診断結果の登録と同時にUser_detailの結果も保存すること。
#2回目の診断に対応すること。buildでいい？
  def create


    # Userprofileの編集
    @sex = params[:sex]
    @nationality = params[:nationality]
    @age = params[:age]
    @occupation = params[:occupation]
    @sizeoforg = params[:sizeoforg]

    @userprofile = Userprofile.new(
      user_id: current_user.id,
      sex: @sex,
      nationality: @nationality,
      age: @age,
      occupation: @occupation,
      sizeoforg: @sizeoforg)

    #テスト結果の集計
    @user = current_user.id

    #DBへの格納用にファイル編集
    
      # Organization Type
      @organizationtype1 = params[:organizationtype1].map(&:to_i)
      @organizationtype2 = params[:organizationtype2].map(&:to_i)
      @organizationtype3 = params[:organizationtype3].map(&:to_i)
      
      @organizationtype = @organizationtype1 + @organizationtype2 + @organizationtype3
      @organizationtype = @organizationtype.sum
  
      # Communication
      @communication1 = params[:communication1].map(&:to_i)
      @communication2 = params[:communication2].map(&:to_i)
      @communication3 = params[:communication3].map(&:to_i)
      
      @communication = @communication1 + @communication2 + @communication3
      @communication = @communication.sum
    
       # discussion
      @discussion1 = params[:discussion1].map(&:to_i)
      @discussion2 = params[:discussion2].map(&:to_i)
      @discussion3 = params[:discussion3].map(&:to_i)
      
      @discussion = @discussion1 + @discussion2 + @discussion3
      @discussion = @discussion.sum

      # confrontation
      @confrontation1 = params[:confrontation1].map(&:to_i)
      @confrontation2 = params[:confrontation2].map(&:to_i)
      @confrontation3 = params[:confrontation3].map(&:to_i)
      
      @confrontation = @confrontation1 + @confrontation2 + @confrontation3
      @confrontation = @confrontation.sum

      # trust
      @trust1 = params[:trust1].map(&:to_i)
      @trust2 = params[:trust2].map(&:to_i)
      @trust3 = params[:trust3].map(&:to_i)
      
      @trust = @trust1 + @trust2 + @trust3
      @trust = @trust.sum
      
      # decisionmaking
      @decisionmaking1 = params[:decisionmaking1].map(&:to_i)
      @decisionmaking2 = params[:decisionmaking2].map(&:to_i)
      @decisionmaking3 = params[:decisionmaking3].map(&:to_i)
      
      @decisionmaking = @decisionmaking1 + @decisionmaking2 + @decisionmaking3
      @decisionmaking = @decisionmaking.sum
      
      # responsibility
      @responsibility1 = params[:responsibility1].map(&:to_i)
      @responsibility2 = params[:responsibility2].map(&:to_i)
      @responsibility3 = params[:responsibility3].map(&:to_i)
      
      @responsibility = @responsibility1 + @responsibility2 + @responsibility3
      @responsibility = @responsibility.sum
      
      # value
      @value1 = params[:value1].map(&:to_i)
      @value2 = params[:value2].map(&:to_i)
      @value3 = params[:value3].map(&:to_i)
      
      @value = @value1 + @value2 + @value3
      @value = @value.sum
    
    @assessment = AssessmentSelf.new(
      user_id: @user,
      organizationtype: @organizationtype,
      communication: @communication,
      discussion: @discussion,
      confrontation: @confrontation,
      trust: @trust,
      decisionmaking: @decisionmaking,
      responsibility: @responsibility,
      value: @value)

    #DB登録開始
    if @assessment.save && @userprofile.save
      flash[:success]= '診断お疲れさまでした！'
      redirect_to current_user
    else
      flash[:danger] = '診断に問題が発生しました。'
      render 'toppages/index'
      # エラーでもメッセージが出ない。要修正。
    end
  end
  
  def about
    
  end
  
    private

  def userprofile_params
    params.require(:userprofile).permit(:sex, :nationality, :age, :occupation, :sizeoforg)
  end


end
