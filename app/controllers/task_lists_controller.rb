class TaskListsController < ApplicationController
  
  def index
    @tasklists = TaskList.all
  end
  
  def show
    @tasklist = TaskList.find(params[:id])
  end
  
  def new
    @tasklist = TaskList.new
  end
  
  def create
    @tasklist = TaskList.new(tasklist_params)
    
    if @tasklist.save
      redirect_to task_lists_path
    else
      render :new
    end
  end
  
  def edit
    @tasklist = TaskList.find(params[:id])
  end
  
  def update
    @tasklist = TaskList.find(params[:id])
    
    if @tasklist.update(tasklist_params)
      redirect_to task_lists_path
    else
      render :edit
    end
  end
  
  def destroy
    @tasklist = TaskList.find(params[:id])
    @tasklist.destroy
    
    redirect_to task_lists_path
  end
  
  private
  
  def tasklist_params
    params.require(:task_list).permit(:content, :status)
  end
  
end
