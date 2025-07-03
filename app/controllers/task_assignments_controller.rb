class TaskAssignmentsController < ApplicationController
  before_action :set_task_assignment, only: %i[ show update destroy ]

  # GET /task_assignments
  def index
    @task_assignments = TaskAssignment.all

    render json: @task_assignments
  end

  # GET /task_assignments/1
  def show
    render json: @task_assignment
  end

  # POST /task_assignments
  def create
    @task_assignment = TaskAssignment.new(task_assignment_params)

    if @task_assignment.save
      render json: @task_assignment, status: :created, location: @task_assignment
    else
      render json: @task_assignment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /task_assignments/1
  def update
    if @task_assignment.update(task_assignment_params)
      render json: @task_assignment
    else
      render json: @task_assignment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /task_assignments/1
  def destroy
    @task_assignment.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_assignment
      @task_assignment = TaskAssignment.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def task_assignment_params
      params.expect(task_assignment: [ :task_id_id, :user_id_id ])
    end
end
