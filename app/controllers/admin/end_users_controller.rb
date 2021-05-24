class Admin::EndUsersController < Admin::ApplicationController
  
  def index
    @users = EndUser.all
  end
  
end
