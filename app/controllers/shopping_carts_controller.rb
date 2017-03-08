class ShoppingCartsController < ApplicationController
  before_action :set_shopping_cart, only: [:show, :edit, :update, :destroy]

  # GET /shopping_carts
  # GET /shopping_carts.json
  def index
    @shopping_carts = ShoppingCart.all
  end

  # GET /shopping_carts/1
  # GET /shopping_carts/1.json
  def show
  end

  # GET /shopping_carts/new
  def new
    @shopping_cart = ShoppingCart.new
  end

  # GET /shopping_carts/1/edit
  def edit
  end

  # POST /shopping_carts
  # POST /shopping_carts.json
  def create
    @shopping_cart = ShoppingCart.new(shopping_cart_params)
    if user_signed_in?
      @shopping_cart.user_id = current_user.id
    end

    respond_to do |format|
      if @shopping_cart.valid? or not user_signed_in?
        # save the model in session or db
        if user_signed_in?
          @shopping_cart.save
        else
          (session[:shopping_cart] ||= []) << shopping_cart_params[:furniture_id]
          @shopping_cart.id = 0;
          @shopping_cart.readonly!
        end
        format.html { redirect_to @shopping_cart, notice: 'Shopping cart was successfully created.' }
        format.json { render :show, status: :created, location: @shopping_cart }
      else
        format.html { render :new }
        format.json { render json: @shopping_cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shopping_carts/1
  # PATCH/PUT /shopping_carts/1.json
  def update
    respond_to do |format|
      if @shopping_cart.update(shopping_cart_params)
        format.html { redirect_to @shopping_cart, notice: 'Shopping cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @shopping_cart }
      else
        format.html { render :edit }
        format.json { render json: @shopping_cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shopping_carts/1
  # DELETE /shopping_carts/1.json
  def destroy
    if user_signed_in?
      @shopping_cart.destroy
    else
      if session[:shopping_cart]
        session[:shopping_cart].delete(shopping_cart_params[:furniture_id])
      end
    end
    respond_to do |format|
      format.html { redirect_to shopping_carts_url, notice: 'Shopping cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopping_cart
      if user_signed_in?
        @shopping_cart = ShoppingCart.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shopping_cart_params
      params.require(:shopping_cart).permit(:furniture_id)
    end
end
