class HoursController < ApplicationController

  private
  def hour_params
    params.require(:hour).permit(:hour, :user_id, :project_id)
  end
end
