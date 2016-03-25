class ImagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @image = Image.new(image_params)
    respond_to do |format|
      if @image.save
        format.json { render json: { url: @image.image.url} }
      else
        redirect_to :back
      end
    end
  end

    private

      def image_params
        params.require(:image).permit(:image)
      end
end
