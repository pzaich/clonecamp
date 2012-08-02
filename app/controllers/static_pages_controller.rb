class StaticPagesController < ApplicationController
  before_filter :authenticate_user!

  def home
    @projects = current_user.projects.all
  end
end
