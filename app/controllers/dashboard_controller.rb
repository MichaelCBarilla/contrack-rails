class DashboardController < ApplicationController
  before_action :require_login

  def index
    @user = current_user
    @contracts = @user.contracts
    @tasks = @user.tasks
  end
end
