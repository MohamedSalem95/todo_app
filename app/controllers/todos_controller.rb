class TodosController < ApplicationController

	def index
		@todos = Todo.all
	end

	def show
		@todo = Todo.find(params[:id])
	end

	def new
		@todo = Todo.new
	end

	def create
		@todo = Todo.new(todo_params)
		if @todo.save
			set_flash(:notice, "todo was created successfully")
			redirect_to todo_path(@todo)
		else
			set_flash(:error, "Whoops, something went wrong please try again.")
			render :new
		end
	end

	def edit
		@todo = Todo.find(params[:id])
	end

	def update
		@todo = Todo.find(params[:id])
		if @todo.update(todo_params)
			set_flash(:notice, "todo was updated successfully")
			redirect_to todo_path(@todo)
		else
			set_flash(:error, "something went wrong please try again")
			render :edit
		end
	end

	private
		def todo_params
			params.require(:todo).permit(:name, :description)
		end

		def set_flash(type, msg)
			flash[type] = msg
		end
end