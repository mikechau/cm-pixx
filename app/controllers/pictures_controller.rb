class PicturesController < ApplicationController

	def index
		# @size = params["size"]
		# @color = params["color"]
		@pictures = Picture.all
		@picture = Picture.new
	end

	def new
		@picture = Picture.new
	end

	def create
		@picture = Picture.new(params[:picture])

			if @picture.save
				redirect_to pictures_url, :notice => "Picture created successfully!"
			else
				render 'new'
			end
	end

	def show
		@picture = Picture.find_by_id(params[:id])
	end

	def edit
		@picture = Picture.find_by_id(params[:id])
	end

	def update
		@picture = Picture.find_by_id(params[:id])
			if @picture.update_attributes(params[:picture])
				redirect_to pictures_url(@picture.id), :notice => "Picture updated successfully!"
			else
				render 'edit'
			end
	end

	def destroy
		p = Picture.find_by_id(params[:id])
		p.destroy
		redirect_to pictures_url
	end

end