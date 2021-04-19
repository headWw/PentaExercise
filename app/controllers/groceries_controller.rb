class GroceriesController < ApplicationController
  before_action :set_grocery, only: %i[ show edit update destroy ]

  # GET /groceries or /groceries.json
  def index
    @groceries = Grocery.all
  end

  # GET /groceries/1 or /groceries/1.json
  def show
  end

  # GET /groceries/new
  def new
    @grocery = Grocery.new
  end

  # GET /groceries/1/edit
  def edit
  end

  def allowed_input
    @grocery = Grocery.new(grocery_params)
    allowed_grocery_name = !@grocery.name.match(/^[a-zA-Z\d\s]*$/) || @grocery.name.empty?
    positive_quantity = @grocery.quantity.to_i <= 0
    allowed_grocery_name || positive_quantity
  end

  # POST /groceries or /groceries.json
  def create
    @grocery = Grocery.new(grocery_params)
    respond_to do |format|
      if allowed_input
        format.html { redirect_to @grocery, notice: "Grocery was NOT successfully created." }
        format.json { render json: @grocery.errors, status: :unprocessable_entity }
      elsif @grocery.save
        format.html { redirect_to @grocery, notice: "Grocery was successfully created." }
        format.json { render :show, status: :created, location: @grocery }
      else
        format.html { redirect_to @grocery, notice: "Grocery was not successfully created." }
        format.json { render json: @grocery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groceries/1 or /groceries/1.json
  def update
    respond_to do |format|
      if allowed_input
        format.html { redirect_to @grocery, notice: "Grocery was NOT successfully updated." }
        format.json { render json: @grocery.errors, status: :unprocessable_entity }
      elsif @grocery.update(grocery_params)
        format.html { redirect_to @grocery, notice: "Grocery was successfully updated." }
        format.json { render :show, status: :ok, location: @grocery }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @grocery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groceries/1 or /groceries/1.json
  def destroy
    @grocery.destroy
    respond_to do |format|
      format.html { redirect_to groceries_url, notice: "Grocery was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grocery
      @grocery = Grocery.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def grocery_params
      params.require(:grocery).permit(:name, :quantity, :user_id)
    end
end
