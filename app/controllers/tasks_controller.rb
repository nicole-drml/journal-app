class TasksController < ApplicationController
    before_action :get_category
    before_action :set_task, only: %i[show edit update destroy]


    def index
        @tasks = @category.tasks
    end

    def show
    end
    
    def new
        @task = Task.new
    end

    def edit
    end

    def create
        @task = @category.tasks.new(task_params)

        respond_to do |format|
            if @task.save
                format.html { redirect_to category_path(@category), notice: 'Successfully added a new task' }
            else
                format.html { render :new }
            end
        end
    end


    def update
        respond_to do |format|
            if @category.task.update(task_params)
              format.html { redirect_to category_url(@category, @task), notice: "Task was successfully updated." }
            else
              format.html { render :edit, status: :unprocessable_entity }
            end
          end
    end

    def destroy
        @task.destroy

        respond_to do |format|
          format.html { redirect_to category_path(@category), notice: "Task was successfully destroyed." }
        end
    end
    
    private

    def set_task
        @task = Task.find(params[:id])
    end

    def get_category
        @category = Category.find(params[:category_id]) 
    end

    def task_params
        params.require(:task).permit(:name, :notes, :due)
    end
end
