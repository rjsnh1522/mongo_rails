class ProjectsController < ApplicationController
  before_action :authenticate_user!

	def index

		@projects = current_user.projects
	end

	def new 
		@project = Project.new
	end
	def show
		@project = current_user.projects.where(id:params[:id]).last
	end
	def destroy
		project = current_user.projects.where(id:params[:id]).last
		project.destroy if project.present?
		# redirect_to projects_path
	end
	def create
		@project = current_user.projects.build(project_params)
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
	end


	private 

	def project_params
		params.require(:project).permit(:title, :start_date, :end_date, :category)
	end


end
