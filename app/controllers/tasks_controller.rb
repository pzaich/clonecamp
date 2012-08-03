class TasksController < ApplicationController
  before_filter :find_list
  before_filter :find_task, :only => [:edit, :update]

  def new
    @task = @list.tasks.new
  end

  def create
    @task = @list.tasks.new(params[:task])
    if @task.save
      respond_to do |format|
        format.js { render 'create', :locals => {:list => @list, :task => @task}}
        format.html { redirect_to :back }
      end
    else
      respond_to do |format|
        format.js { render :partial => 'error' }
        format.html { redirect_to :back }
      end
    end
  end

  def edit
    @task = Task.find_by_id(params[:id])
  end

  def update
    @task.update_attributes(params[:task])
  end

  private
  def find_task
    @task = Task.find_by_id(params[:id])
  end

  def find_list
    @list = List.find_by_id(params[:list_id])
  end
end
