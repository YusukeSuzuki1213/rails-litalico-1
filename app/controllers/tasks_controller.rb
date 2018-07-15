class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update]

  
  def index
    @todos = Task.where(isdone:false)
    @dones = Task.where(isdone:true)
    @dummy = Task.new(isdone:false)
  end

  def edit 
  end

  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_path, notice: 'Task was successfully created.' }
      else
        format.html { redirect_to tasks_path, notice: 'Failed to create the Task.' }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to tasks_path, notice: 'Task was successfully updated.' }
      else
        format.html { redirect_to tasks_path, notice: 'Failed to update the Task.' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :body, :isdone)
    end
end
