class ShortenedLinksController < ApplicationController
	
	skip_before_action :verify_authenticity_token
	
	def index
		@url = ShortenedLink.new
		@last_ten_rows = ShortenedLink.last(10).reverse
	end
	
	def show
		@url  = ShortenedLink.find_by_short_url(params[:short_url])
		hits = @url.hits + 1
		@url.update(hits: hits)
		redirect_to @url.original_url
	end
	
	def create
		@url = ShortenedLink.new
		@url.original_url = params[:original_url]
		if @url.save
			redirect_to shortened_path(@url.short_url)
		else
			flash[:error] = "Check error below: "
			render 'index'
		end
	end
	
	def shortened
		@url  = ShortenedLink.find_by_short_url(params[:short_url])
		@original_url = @url.original_url
		@short_url = root_url + @url.short_url
		@recently_created = ShortenedLink.last(10).reverse
	end
end
