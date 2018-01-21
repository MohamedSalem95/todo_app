class TodosController < ApplicationController
	# before_action :set_todo, only: [:show, :edit, :update, :destroy]
	before_action :set_todo, except: [:index, :new, :create]

	def index
		@todos = Todo.all
	end

	def show
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
	end

	def update
		if @todo.update(todo_params)
			set_flash(:notice, "todo was updated successfully")
			redirect_to todo_path(@todo)
		else
			set_flash(:error, "something went wrong please try again")
			render :edit
		end
	end

	def destroy
		@todo.destroy
		set_flash(:notice, "todo deleted successfully.")
		redirect_to todos_path
	end

	private
		def todo_params
			params.require(:todo).permit(:name, :description)
		end

		def set_flash(type, msg)
			flash[type] = msg
		end

		def set_todo
				@todo = Todo.find(params[:id])
		end
end