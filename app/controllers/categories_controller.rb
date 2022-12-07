class CategoriesController < ApplicationController
    before_action :set_category, only: %i[ show edit update destroy ]

  def index
    @user = Current.user
    @categories = Category.all
  end

  def show
  end

  def new
    @user = Current.user
    @category = Category.new
  end

  def edit
  end

  def create
    @user = Current.user
    @category = @user.categories.new(category_params)

    respond_to do |format|
      if @category.save
          format.html { redirect_to create_category_path, notice: "Successfully created account" }
      else
          format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to category_url(@category), notice: "Category was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url, notice: "Category was successfully destroyed." }
    end
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
