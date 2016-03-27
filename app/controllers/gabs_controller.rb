class GabsController < ApplicationController
  before_action :find_gab, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def index
    @gabs = Gab.order("created_at DESC").page(params[:page]).per(10)
  end

  def new
    @gab = Gab.new
  end

  def create
    @gab = Gab.new(gab_params)
    @gab.user = current_user
    if @gab.save
      redirect_to @gab
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @gab.update(gab_params)
      redirect_to @gab
    else
      render :edit
    end
  end

  def destroy
    @gab.destroy
    respond_to do |format|
      format.html { redirect_to gabs_path, alert: "gab removed" }
      format.js { render }
    end
  end

    private

      def find_gab
        @gab = Gab.friendly.find(params[:id])
      end

      def gab_params
        params.require(:gab).permit(:title, :body, {images: []})
      end

      def authorize_user
        unless can? :manage, @gab
        redirect_to root_path , flash: { info: "Access Denied" }
        end
      end

end
