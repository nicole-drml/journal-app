class TasksController < ApplicationController
    before_action :get_category
    before_action :set_task


    def index
        @tasks = @category.tasks
    end

    def show
        #@category = Category.find(params[:category_id])
        #@task = Task.find(params[:id])
    end
    
    def new
        @task = @category.tasks.new
    end

    def edit
    end
    
    def create
        @task = Task.find(params[:category_id])

        respond_to do |format|
            if @task.save
                format.html { redirect_to create_task_path, notice: "Successfully created account" }
            else
                format.html { render :new, status: :unprocessable_entity }
            end
          end




          @comment = @post.comments.build(comment_params)

          respond_to do |format|
          if @comment.save
              format.html { redirect_to post_comments_path(@post), notice: 'Comment was successfully created.' }
              format.json { render :show, status: :created, location: @comment }
          else
              format.html { render :new }
              format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
      end
    end


    def update
    end

    def destroy
    end
    
    private

    def get_category
        @category = Category.find(params[:category_id])
    end

    def set_task
        @task = @category.tasks.find(params[:id])
    end

    def task_params
        params.require(:task).permit(:name, :details, :due)
    end
end
