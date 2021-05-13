class Public::ApplicationController < ApplicationController
  layout 'public/application'
  before_action :authenticate_end_user!,except: [:top]
  
  def after_sign_in_path_for(resource)
    end_users_mypage_path
  end
end
