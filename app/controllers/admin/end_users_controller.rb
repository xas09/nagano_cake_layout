class Admin::EndUsersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @users = EndUser.all
  end
  
end
