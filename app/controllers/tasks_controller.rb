# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :find_task, only: [:show, :update, :edit, :destroy]

  def index
    @tasks = Task.all
  end

  def show
   # @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    # @task = Task.new(params[:task])
    # @task.save
    Task.create(task_params)
    redirect_to task_path
  end

  def edit
   # @task = Task.find(params[:id])
  end

  def update
    # @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to @task
  end

  def destroy
    # @task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_path
  end

  # Private

  # def task_params
  #   params.require(:task).permit(:title, :details, :completed)
  # end

  private

  def task_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:task).permit(:title, :details, :completed)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
