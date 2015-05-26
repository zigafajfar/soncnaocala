class ModelsController < ApplicationController
  before_action :set_model, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: "wwwhmb", password: "spletneurice52", except: [:index, :show]

  # GET /models
  # GET /models.json
  def index
    @brand = Brand.find(params[:brand_id])
    @models = @brand.models
    @brands = Brand.all
  end

  # GET /models/1
  # GET /models/1.json
  def show
    @brands = Brand.all
  end

  # GET /models/new
  def new
    @model = Model.new
    @brand = Brand.find(params[:brand_id])
  end

  # GET /models/1/edit
  def edit
    @brand = Brand.find(params[:brand_id])
  end

  # POST /models
  # POST /models.json
  def create
    @model = Model.new(model_params)

    respond_to do |format|
      if @model.save
        format.html { redirect_to [@model.brand, @model], notice: 'Model was successfully created.' }
        format.json { render :show, status: :created, location: @model }
      else
        format.html { render :new }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /models/1
  # PATCH/PUT /models/1.json
  def update
    respond_to do |format|
      if @model.update(model_params)
        format.html { redirect_to [@model.brand, @model], notice: 'Model was successfully updated.' }
        format.json { render :show, status: :ok, location: @model }
      else
        format.html { render :edit }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /models/1
  # DELETE /models/1.json
  def destroy
    @model.destroy
    respond_to do |format|
      format.html { redirect_to models_url, notice: 'Model was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model
      @model = Model.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def model_params
      params.require(:model).permit(:name, :brand_id, :price, :description, :image)
    end
end
