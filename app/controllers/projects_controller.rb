class ProjectsController < ApplicationController
  def index
    @projects = Project.verified.by_recently_created
  end

  def show
    @project = Project.find_by(slug: params[:id])
  end
end
