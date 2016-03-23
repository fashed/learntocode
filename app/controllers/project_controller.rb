class ProjectController < ApplicationController
  def index
  	@projects = Project.all
  end

  def show
  	@project = Project.find(params[:id])
  	@tasks = @project.tasks.order(:tag)

  	@joined = false

  	if !current_user.nil? && !current_user.projects.nil?
  		#check if @project is already inside current_user's project. if current user already joined project
  		@joined = current_user.projects.include?(@project)
  	end

  	@users = @project.users.order('created_at desc').first(10)
  end
  
end

