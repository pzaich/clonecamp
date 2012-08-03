class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_id, :only => [:show, :edit, :update]

  def index
    @projects = Project.all
  end

  def new
    @project = current_user.projects.new
  end

  def show
    @lists = @project.lists.order('created_at DESC')
    if @project.public == false && current_user != @project.user
      redirect_to root_path, :flash => {:error => "you do not have access to this page"}
    end
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
    @project = current_user.projects.new(params[:project])
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
