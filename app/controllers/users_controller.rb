class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show]
  
  def show
    @user = User.find_by(id: params[:id])
    
    @mylists = TaskList.where(user_id: params[:id])
    
    @tasklists = TaskList.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "登録が完了しました！"
      redirect_to @user
    else
      flash.now[:danger] = "登録失敗・・再度登録願います！"
      render :new
    end
  end

  def destroy
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
