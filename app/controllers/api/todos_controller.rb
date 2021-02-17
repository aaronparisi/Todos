class Api::TodosController < ApplicationController
  
  def index
    if @currentUser
      render json: Todo.where(user_id: @currentUser.id)
      # I think this will get replaced by some sort of current user thing?
    else
      render json: []  # I need to return ~something~ for the promise
    end
  end

  def completeTodos
    render json: Todo.where(done: true, user_id: @currentUser.id)
  end

  def incompleteTodos
    render json: Todo.where(done: false, user_id: @currentUser.id)
  end

  def show
    render json: Todo.where(id: params[:id], user_id: @currentUser.id).first
    # ! this doesn't seem right
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.user_id = @currentUser.id
    if @todo.save
      render json: @todo
    else
      render json: @todo.errors.full_messages, status: 422
    end
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      render json: @todo
    else
      render json: @todo.errors.full_messages, status: 422
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    if @todo.destroy
      render json: @todo
    else
      render json: @todo  # ? what do i return if it fails
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:id, :title, :body, :dueAt, :detailsShowing, :done, :created_at, :updated_at, :completedAt)
  end
end
