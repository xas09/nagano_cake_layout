class Public::EndUsersController < Public::ApplicationController
  
  def show
    @user = current_end_user
  end
  
  def edit
    @user = current_end_user
  end
  
  def update
    @user = current_end_user
    if @user.update(user_params)
      redirect_to end_users_mypage_path
    else
      render :edit
    end
  end

  def confirm
  end

  def unsubscribe
    @user = current_end_user
    @user.update(is_unsubscribed: true)
    reset_session
    redirect_to root_path
  end
  
  private
  
  def user_params
    params.require(:end_user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :zip_code, :address, :phone_number, :email)
  end

end
