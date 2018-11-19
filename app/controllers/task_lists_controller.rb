class TaskListsController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :create, :update]
  
  def index
    @tasklists = TaskList.all
  end
  
  def show
    @tasklist = TaskList.find(params[:id])
    
    @tasklists = TaskList.new
    
    @list_name = User.find_by(id: @tasklist.user_id)
  end
  
  def create
    @tasklist = current_user.task_lists.build(tasklist_params)
    
    if @tasklist.save
      flash[:success] = "作成したからには達成しましょうね！"
      redirect_to "/users/#{session[:user_id]}"
    else
      @tasklists = current_user.task_lists.build
      @user = User.find_by(id: session[:user_id])
      @mylists = current_user.task_lists.where(user_id: session[:user_id])
      
      flash.now[:danger] = 'タスクの作成に失敗したようです。'
      render :template => "users/show"
    end
  end

  def update
    @tasklist = TaskList.find(params[:id])
    
    if @tasklist.update(tasklist_params)
      redirect_to "/users/#{session[:user_id]}"
    else
      render :show
    end
  end
  
  def destroy
    @tasklist = TaskList.find(params[:id])
    @tasklist.destroy
    
    redirect_to "/users/#{session[:user_id]}"
  end
  
  private
  
  def tasklist_params
    params.require(:task_list).permit(:content, :status)
  end
  
end
