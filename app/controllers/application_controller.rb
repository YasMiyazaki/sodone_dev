class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def after_sign_in_path_for(resource)

    @user = resource

    a = session[:previous_url]
    b = requestassessment_user_url(resource.id)
    
    # requestassessmentからの遷移かどうかをチェック

    if !(session[:previous_url].nil?)
    
      if a[-17, 17] == b[-17, 17]
        session[:previous_url]
      end
    
    elsif Userprofile.exists?(user_id: resource.id)
      @user
    else
      assessment_index_path
    end
    
  end

  def after_sign_out_path_for(resource)
    root_url
  end


end
