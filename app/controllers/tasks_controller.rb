class TasksController < ApplicationController
    before_action :set_category


    def index
        @tasks = @category.tasks
    end

    def show
    end
    
    def new
        @task = @category.tasks.new
    end

    def create
    end

    def edit
    end

    def update
    end

    def destroy
    end
    private
    def set_category
        @category = Category.find params[:task_id]
    end

    def task_params
        params.require(:task).permit(:name, :details, :due)
    end
end
