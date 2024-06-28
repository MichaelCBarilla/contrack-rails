class ContractsController < ApplicationController
  before_action :require_login

  def index
    @contracts = current_user.contracts
  end
end
