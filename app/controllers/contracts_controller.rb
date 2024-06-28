class ContractsController < ApplicationController
  before_action :require_login
  before_action :set_contract, only: [:show, :edit, :update, :destroy]

  def index
    @contracts = current_user.contracts
  end

  def show
    @tasks = @contract.tasks
  end

  def new
    @contract = Contract.new
  end

  def edit
  end

  def create
    @contract = current_user.contracts.build(contract_params)
    if @contract.save
      redirect_to @contract, notice: 'Contract was successfully created.'
    else
      render :new
    end
  end

  def update
    if @contract.update(contract_params)
      redirect_to @contract, notice: 'Contract was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @contract.destroy
    redirect_to contracts_url, notice: 'Contract was successfully destroyed.'
  end

  private

    def set_contract
      @contract = Contract.find(params[:id])
    end

    def contract_params
      params.require(:contract).permit(:title, :description, :rate)
    end
end