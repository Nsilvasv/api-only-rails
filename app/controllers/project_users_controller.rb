class ProjectUsersController < ApplicationController
  before_action :set_project_user, only: %i[ show update destroy ]

  # GET /project_users
  def index
    @project_users = ProjectUser.all

    render json: @project_users
  end

  # GET /project_users/1
  def show
    render json: @project_user
  end

  # POST /project_users
  def create
    @project_user = ProjectUser.new(project_user_params)

    if @project_user.save
      render json: @project_user, status: :created, location: @project_user
    else
      render json: @project_user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /project_users/1
  def update
    if @project_user.update(project_user_params)
      render json: @project_user
    else
      render json: @project_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /project_users/1
  def destroy
    @project_user.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_user
      @project_user = ProjectUser.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def project_user_params
      params.expect(project_user: [ :project_id_id, :user_id_id, :role ])
    end
end
