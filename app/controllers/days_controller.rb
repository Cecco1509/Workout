class DaysController < ApplicationController
  before_action :set_day, only: %i[ show edit update destroy ]
  before_action :authenticate_user! , exept: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /days or /days.json
  def index
    @days = Day.all
    @exercises = Exercise.all
  end

  # GET /days/1 or /days/1.json
  def show
  end

  # GET /days/new
  def new
    @day = current_user.days.build
    @exercises = Exercise.all
  end

  # GET /days/1/edit
  def edit
    @exercises = Exercise.all
  end

  # POST /days or /days.json
  def create
    @day = current_user.days.build(day_params)

    respond_to do |format|
      if @day.save
        format.html { redirect_to day_url(@day), notice: "Day was successfully created." }
        format.json { render :show, status: :created, location: @day }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @day.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /days/1 or /days/1.json
  def update
    respond_to do |format|
      if @day.update(day_params)
        format.html { redirect_to day_url(@day), notice: "Day was successfully updated." }
        format.json { render :show, status: :ok, location: @day }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @day.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /days/1 or /days/1.json
  def destroy
    @day.destroy

    respond_to do |format|
      format.html { redirect_to days_url, notice: "Day was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @day = current_user.days.find_by(id: params[:id])
    redirect_to root_path, notice: "Not authorized to access this page." if @day.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_day
      @day = Day.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def day_params
      params.require(:day).permit(:name, :user_id, :exercise_ids => [])
    end
end
