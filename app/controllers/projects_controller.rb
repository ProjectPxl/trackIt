class ProjectsController < ApplicationController

  def show
    @project = Project.find(params[:id])
    @add_hours = Project.new
    @today      = @project.get_hours "day"
    @this_week  = @project.get_hours "week"
    @this_month = @project.get_hours "month"
    @all_hours = @project.hours.order(created_at: :desc)
    # @invoice = @project.hours.where('created_at > ? AND created_at <= ?', "2016-02-01 06:37:17 -0800", "2016-03-01 20:25:48 -0800").order(created_at: :desc)
    @invoice = @project.hours.where('created_at > ?', "2016-02-18 07:01:50 -0800").order(created_at: :desc)

    @map = {}
    @total = 0
    @rate = 50
    @invoice.each do |i|
      issue = i.note.split(" ")[0]
      if @map[issue]
        @map[issue] += i.hours
      else
        @map[issue] = i.hours
      end
      @total += i.hours
    end
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
