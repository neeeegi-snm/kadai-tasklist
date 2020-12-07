class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = '新しいタスクを登録しました'
      redirect_to task_url(@task)
    else
      flash.now[:danger] = 'タスクを正常に登録できませんでした'
      render :new
    end
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    
    if @task.update(task_params)
      flash[:success] = 'タスクの内容を変更しました'
      redirect_to task_url(@task)
    else
      flash.now[:danger] = 'タスクを正常に変更できませんでした'
      render :edit
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    
    flash[:success] = 'タスクを削除しました'
    redirect_to tasks_url
  end
  
  
  
  private
  
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
  
end