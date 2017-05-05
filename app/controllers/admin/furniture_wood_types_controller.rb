class Admin::FurnitureWoodTypesController < ApplicationController
  before_action :set_admin_furniture_wood_type, only: [:show, :edit, :update, :destroy]

  # GET /admin/furniture_wood_types
  # GET /admin/furniture_wood_types.json
  def index
    @admin_furniture_wood_types = Admin::FurnitureWoodType.all
  end

  # GET /admin/furniture_wood_types/1
  # GET /admin/furniture_wood_types/1.json
  def show
  end

  # GET /admin/furniture_wood_types/new
  def new
    @admin_furniture_wood_type = Admin::FurnitureWoodType.new
  end

  # GET /admin/furniture_wood_types/1/edit
  def edit
  end

  # POST /admin/furniture_wood_types
  # POST /admin/furniture_wood_types.json
  def create
    @admin_furniture_wood_type = Admin::FurnitureWoodType.new(admin_furniture_wood_type_params)

    respond_to do |format|
      if @admin_furniture_wood_type.save
        format.html { redirect_to @admin_furniture_wood_type, notice: 'Furniture wood type was successfully created.' }
        format.json { render :show, status: :created, location: @admin_furniture_wood_type }
      else
        format.html { render :new }
        format.json { render json: @admin_furniture_wood_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/furniture_wood_types/1
  # PATCH/PUT /admin/furniture_wood_types/1.json
  def update
    respond_to do |format|
      if @admin_furniture_wood_type.update(admin_furniture_wood_type_params)
        format.html { redirect_to @admin_furniture_wood_type, notice: 'Furniture wood type was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_furniture_wood_type }
      else
        format.html { render :edit }
        format.json { render json: @admin_furniture_wood_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/furniture_wood_types/1
  # DELETE /admin/furniture_wood_types/1.json
  def destroy
    @admin_furniture_wood_type.destroy
    respond_to do |format|
      format.html { redirect_to admin_furniture_wood_types_url, notice: 'Furniture wood type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_furniture_wood_type
      @admin_furniture_wood_type = Admin::FurnitureWoodType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_furniture_wood_type_params
      params.require(:admin_furniture_wood_type).permit(:name, :comment)
    end
end
