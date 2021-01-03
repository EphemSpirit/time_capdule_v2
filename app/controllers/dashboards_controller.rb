class DhasboardsController < ApplicationController

  def new
    @dashboard = current_user.dashboard.build
  end

  def create
    @dashboard = current_user.dashboard.build(dashboard_params)
    if @dashboard.save
      redirect_to dashboard_path
    end
  end

  def show
    @journals = current_user.journals.all
  end

  def show
    @dashboard = current_user.dashboard
  end

  private

    def dashboard_params
      params.require(:dashboard).permit(:user_id)
    end

end
