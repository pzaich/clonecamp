class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_id, :only => [:show, :edit, :update]

  def new
    @project = Project.new
  end

  def show
    @list = @project.lists.new
  end

  def edit
  end

  def update
    if @project.update_attributes(params[:project])
      redirect_to project_path(@project)
    else
      render :back
    end
  end

  def create
    @project = Project.new(params[:project])

    if @project.save
      flash[:success] = "Successfully created project!"
      redirect_to project_path(@project)
    else
      flash[:error] = "You did something wrong."
      render :new
    end
  end

  private

  def find_id
    @project = Project.find_by_id(params[:id])
  end
end
