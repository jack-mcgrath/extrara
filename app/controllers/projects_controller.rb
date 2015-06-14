class ProjectsController < ApplicationController
  def index
   @users = User.all
  end
  def new
      @project = Project.new
  end
  def create
      @project = current_user.projects.new(projects_params)
      if @project.save
          redirect_to projects_path, :notice => "Your post has been saved"
      else
      format.html { render :new }
      format.json { render json: @project.errors, status: :unprocessable_entity }
      end
      

  end
  def show
      @project = Project.find(params[:id])
  end
  private
  # Use callbacks to share common setup or constraints between actions.
  def new_project
      @project = Projects.find(params[:id])
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def projects_params
      params.require(:project).permit(:user_id, :title, :subtitle, :des, :s1, :s2, :s3, :s4, :s5)
  end
 
end