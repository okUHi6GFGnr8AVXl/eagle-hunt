class Admin::FurnitureColorQualitiesController < ApplicationController
  before_action :set_admin_furniture_color_quality, only: [:show, :edit, :update, :destroy]

  # GET /admin/furniture_color_qualities
  # GET /admin/furniture_color_qualities.json
  def index
    @admin_furniture_color_qualities = Admin::FurnitureColorQuality.all
  end

  # GET /admin/furniture_color_qualities/1
  # GET /admin/furniture_color_qualities/1.json
  def show
  end

  # GET /admin/furniture_color_qualities/new
  def new
    @admin_furniture_color_quality = Admin::FurnitureColorQuality.new
  end

  # GET /admin/furniture_color_qualities/1/edit
  def edit
  end

  # POST /admin/furniture_color_qualities
  # POST /admin/furniture_color_qualities.json
  def create
    @admin_furniture_color_quality = Admin::FurnitureColorQuality.new(admin_furniture_color_quality_params)

    respond_to do |format|
      if @admin_furniture_color_quality.save
        format.html { redirect_to @admin_furniture_color_quality, notice: 'Furniture color quality was successfully created.' }
        format.json { render :show, status: :created, location: @admin_furniture_color_quality }
      else
        format.html { render :new }
        format.json { render json: @admin_furniture_color_quality.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/furniture_color_qualities/1
  # PATCH/PUT /admin/furniture_color_qualities/1.json
  def update
    respond_to do |format|
      if @admin_furniture_color_quality.update(admin_furniture_color_quality_params)
        format.html { redirect_to @admin_furniture_color_quality, notice: 'Furniture color quality was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_furniture_color_quality }
      else
        format.html { render :edit }
        format.json { render json: @admin_furniture_color_quality.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/furniture_color_qualities/1
  # DELETE /admin/furniture_color_qualities/1.json
  def destroy
    @admin_furniture_color_quality.destroy
    respond_to do |format|
      format.html { redirect_to admin_furniture_color_qualities_url, notice: 'Furniture color quality was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_furniture_color_quality
      @admin_furniture_color_quality = Admin::FurnitureColorQuality.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_furniture_color_quality_params
      params.require(:admin_furniture_color_quality).permit(:name, :comment)
    end
end
