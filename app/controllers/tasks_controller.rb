class TasksController < ApplicationController
  before_action :require_login
  before_action :set_contract
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /contracts/:contract_id/tasks
  def index
    @tasks = @contract.tasks
  end

  # GET /contracts/:contract_id/tasks/:id
  def show
  end

  # GET /contracts/:contract_id/tasks/new
  def new
    @task = @contract.tasks.build
  end

  # GET /contracts/:contract_id/tasks/:id/edit
  def edit
  end

  # POST /contracts/:contract_id/tasks
  def create
    @task = @contract.tasks.create(task_params)
    @task.user_id = current_user.id
    if @task.save
      redirect_to [@contract, @task], notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /contracts/:contract_id/tasks/:id
  def update
    if @task.update(task_params)
      redirect_to [@contract, @task], notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /contracts/:contract_id/tasks/:id
  def destroy
    if @task.destroy
      redirect_to contract_url(@contract), notice: 'Task was successfully destroyed.'
    else
      render :show
    end
  end

  private
    def set_contract
      @contract = Contract.find(params[:contract_id])
    end

    def set_task
      @task = @contract.tasks.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :description)
    end
end
