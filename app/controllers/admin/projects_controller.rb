class Admin::ProjectsController < Admin::ApplicationController
  before_action :set_project, only: %i(edit update destroy)

  def new
    @project = Project.new
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: "Project has been updated."
    else
      flash.now[:alert] = "Project has not been updated."
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_url, notice: "Project has been deleted."
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project, notice: "Project has been created."
    else
      flash.now[:alert] = "Project has not been created."
      render :new
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end

  def set_project
    @project = Project.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to projects_url, alert: "The project you are looking for could not be found."
  end
end
