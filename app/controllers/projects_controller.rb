class ProjectsController < ApplicationController

  def show
    @project = Project.find(params[:id])
    @add_hours = Project.new
    @today      = @project.get_hours "day"
    @this_week  = @project.get_hours "week"
    @this_month = @project.get_hours "month"
    @all_hours = @project.hours.order(created_at: :desc)
  end

  def add_hours
    @project = Project.find(params[:project][:hours][:project_id])
    @project.hours << Hour.create({
      hours: params[:project][:hours][:hours],
      note: params[:project][:hours][:note],
      user_id: current_user.id
    })
    redirect_to :back
  end
end
