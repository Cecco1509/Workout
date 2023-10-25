class DayToExercisesController < ApplicationController
  before_action :set_day_to_exercise, only: %i[ show edit update destroy ]

  # GET /day_to_exercises or /day_to_exercises.json
  def index
    @day_to_exercises = DayToExercise.all
  end

  # GET /day_to_exercises/1 or /day_to_exercises/1.json
  def show
  end

  # GET /day_to_exercises/new
  def new
    @day_to_exercise = DayToExercise.new
    @exercises = Array.new
  end

  # GET /day_to_exercises/1/edit
  def edit
  end

  # POST /day_to_exercises or /day_to_exercises.json
  def create
    @day_to_exercise = DayToExercise.new(day_to_exercise_params)

    respond_to do |format|
      if @day_to_exercise.save
        format.html { redirect_to day_to_exercise_url(@day_to_exercise), notice: "Day to exercise was successfully created." }
        format.json { render :show, status: :created, location: @day_to_exercise }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @day_to_exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /day_to_exercises/1 or /day_to_exercises/1.json
  def update
    respond_to do |format|
      if @day_to_exercise.update(day_to_exercise_params)
        format.html { redirect_to day_to_exercise_url(@day_to_exercise), notice: "Day to exercise was successfully updated." }
        format.json { render :show, status: :ok, location: @day_to_exercise }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @day_to_exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /day_to_exercises/1 or /day_to_exercises/1.json
  def destroy
    @day_to_exercise.destroy

    respond_to do |format|
      format.html { redirect_to day_to_exercises_url, notice: "Day to exercise was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_day_to_exercise
      @day_to_exercise = DayToExercise.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def day_to_exercise_params
      params.require(:day_to_exercise).permit(:day_id, :exercise_id)
    end
end
