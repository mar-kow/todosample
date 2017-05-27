class TasksController < ApplicationController
  before_action :fetch_task, only: %i(show edit update destroy)

  def index
    @task = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    @task.valid? ? create_task : handle_task_validation_failed
  end

  def show; end

  private

  def create_task
    @task.save
    current_user.tasks << @task
    flash[:notice] = 'Task created!'
    redirect_to @task
  end

  def handle_task_validation_failed
    flash[:errors] = @task.errors.full_messages
    redirect_back(fallback_location: root_path)
  end

  def task_params
    params.require(:task).permit(:title, :description)
  end

  def fetch_task
    @task = Task.find(params[:id])
  end
end
