class ProjectsController < ApplicationController
  def index
    @projects = Project.by_recently_created # TODO: use verified scope
  end

  def show
    @project = Project.find_by(slug: params[:id])
  end
end
