class TasksController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy, :change]

  def index
    @to_do = current_user.tasks.where(state: "to_do")
    @doing = current_user.tasks.where(state: "doing")
    @done = current_user.tasks.where(state: "done")
    @task = Task.new
    respond_to do |format|
      format.html
    end
  end

  def show
    respond_to do |format|
      format.html
    end
  end

  def new
    @task = Task.new
    respond_to do |format|
      format.html
    end
  end

  def edit
  end

  def create
    @task = current_user.tasks.new(task_params)
    @task.save
    respond_to do |format|
      format.html {redirect_to tasks_path, notice: "Task Created" }
    end
  end

  def update
    if params[:state]
      @task.update_attributes(state: params[:state])
    else
      @task.update(task_params)
    end
      respond_to do |format|
        format.html {redirect_to tasks_path, notice: "Task Updated" }
      end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html {redirect_to tasks_path, notice: "Task Destroyed" }
    end
  end

  private

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:content, :state)
    end
end
