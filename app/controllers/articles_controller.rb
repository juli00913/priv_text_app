class ArticlesController < ApplicationController
	def index
	end
	
	def show
    	@article = Article.find(params[:id])
  	end
	
	def create
		@article = Article.new(article_params) 
		@article.save
		#render 'articles/url_link'
		respond_to do |format|
			if is_json?
	  			format.json {render 'articles/json_url'}
	  		elsif is_xml?
	  			format.xml {render 'articles/xml_url'}
  			else
  				format.html {render 'articles/url_link'}
			end
 		end

	end
		
	private
		def is_json?
			request.content_type == 'application/json'
		end
		
		def is_xml? 
		    request.content_type.include? 'xml'
		    #request.content_type == "text/xml" 
		end
		
  		def article_params
    		if is_json?
    			{'text' => params.permit(:message).to_h[:message] }
    		elsif is_xml?
    			{'text' => Nokogiri::XML(request.body).content }
    		else
    		    params.require(:article).permit(:text)
    		end
    	end
end	
