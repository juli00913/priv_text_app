class ArticlesController < ApplicationController
	def index
	end
	
	def show
    	@article = Article.find(params[:id])
  	end
	
	def create
		@article = Article.new(article_params) 
		@article.save
		render 'articles/url_link'

	end
	
	private
  		def article_params
    		params.require(:article).permit(:text)
    	end
end	
