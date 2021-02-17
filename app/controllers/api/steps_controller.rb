class Api::StepsController < ApplicationController
  def index
    render json: Step.rank(:row_order).all
  end

  def completeSteps
    render json: Step.where(done: true)
  end

  def incompleteSteps
    render json: Step.where(done: false)
  end

  def show
    render json: Step.find(params[:id])
  end

  def create
    @step = Step.new(step_params)
    if @step.save
      render json: @step
    else
      render json: @step.errors.full_messages, status: 422
    end
  end

  def update
    @step = Step.find(params[:id])
    if @step.update(step_params)
      render json: @step
    else
      render json: @step.errors.full_messages, status: 422
    end
  end

  def destroy
    @step = Step.find(params[:id])
    if @step.destroy
      render json: @step
    else
      render json: @step  # ? what do i return if it fails
    end
  end

  private

  def step_params
    params.require(:step).permit(:title, :done, :todo_id, :row_order_position)
  end
end
