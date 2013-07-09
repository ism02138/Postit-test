class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update]

	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def create
 		@category = Category.new(post_params)
 		if @category.save
 			redirect_to root_path, notice: "Successfully created"
 		else
 			render :new
 		end
 	end

	def show
		
	end

 	private

  def set_category
    @category = Category.find(params[:id])
  end

 	def post_params
 		params.require(:category).permit!
 	end

end