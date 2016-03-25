class GabsController < ApplicationController
  before_action :find_gab, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]

  def index
    @gabs = Gab.order("created_at DESC")
  end

  def new
    @gab = Gab.new
  end

  def create
    @gab = Gab.new(gab_params)
    if @gab.save
      redirect_to @gab
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

    private

      def find_gab
        @gab = Gab.friendly.find(params[:id])
      end

      def gab_params
        params.require(:gab).permit(:title, :body, {images: []})
      end

end
