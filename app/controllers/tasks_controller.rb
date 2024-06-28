class TasksController < ApplicationController
  before_action :require_login

  def index
    @tasks = current_user.tasks
  end
end
