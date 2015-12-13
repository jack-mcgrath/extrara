class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @projects = Project.all
    respond_with(@projects)
    @users = User.all
  end

  def show
    respond_with(@project)
  end

  def new
    @project = Project.new
    respond_with(@project)
  end

  def edit
  end

  def create
    @project = current_user.projects.new(project_params)
    if @project.save
        redirect_to @project, :notice => "Your post has been saved"
    end
  end

  def update
    @project.update(project_params)
    respond_with(@project)
  end

  def destroy
    @project.destroy
    respond_with(@project)
  end
  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
        params.require(:project).permit(:title,:subtitle, :S1, :des, :avatar)
    end
end
