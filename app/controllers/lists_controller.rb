class ListsController < ApplicationController
  before_filter :find_project
  before_filter :find_list, :only => [:show, :edit, :update]

  def create
    @list = @project.lists.new(params[:list])
    if @list.save
      respond_to do |format|
        format.js { render 'create', :locals => {:list => @list}}
        format.html { redirect_to :back }
      end
    else
      respond_to do |format|
        format.js { render :partial => 'error' }
        format.html { redirect_to :back }
      end
    end
  end

  def new
    @list = @project.lists.new
  end

  def show
    @new_task = @list.tasks.new
    @tasks = @list.tasks.order("created_at DESC")
  end

  def edit
  end

  def update
    if @list.update_attributes(params[:list])
      respond_to do |format|
        format.js { render 'update', :locals => {:list => @list}}
        format.html { redirect_to :back }
      end
    else
      respond_to do |format|
        format.js { render :partial => 'error' }
        format.html { redirect_to :back }
      end
    end
  end

  private

  def find_list
    @list = List.find_by_id(params[:id])
  end

  def find_project
    @project = Project.find_by_id(params[:project_id])
  end
end
