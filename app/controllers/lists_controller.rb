class ListsController < ApplicationController
  before_filter :find_project
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

  private

  def find_project
    @project = Project.find_by_id(params[:project_id])
  end
end
