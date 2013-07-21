class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]
  before_action :require_user, only: [:new, :create]
  before_action :require_admin, except: [:show]

	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def create
 		@category = Category.new(post_params)
 		if @category.save
 			redirect_to root_path, notice: "Category created"
 		else
 			render :new
 		end
 	end

	def show
		
	end

 	private

  def set_category
    @category = Category.find_by slug: params[:id]
  end

 	def post_params
 		params.require(:category).permit!
 	end

end