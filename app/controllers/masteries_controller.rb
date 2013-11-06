class MasteriesController < ApplicationController
  before_action :set_mastery, only: [:show, :edit, :update, :destroy]

  # GET /masteries
  # rails g scaffold MyModel --no-stylesheets
  # GET /masteries.json
  def index
    @masteries = Mastery.all
  end

  # GET /masteries/1
  # GET /masteries/1.json
  def show
  end

  # GET /masteries/new
  def new
    @mastery = Mastery.new
  end

  # GET /masteries/1/edit
  def edit
  end

  # POST /masteries
  # POST /masteries.json
  def create
    @mastery = Mastery.new(mastery_params)

    respond_to do |format|
      if @mastery.save
        format.html { redirect_to masteries_url, notice: 'Mastery was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mastery }
      else
        format.html { render action: 'new' }
        format.json { render json: @mastery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /masteries/1
  # PATCH/PUT /masteries/1.json
  def update
    respond_to do |format|
      if @mastery.update(mastery_params)
        format.html { redirect_to @mastery, notice: 'Mastery was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mastery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /masteries/1
  # DELETE /masteries/1.json
  def destroy
    @mastery.destroy
    respond_to do |format|
      format.html { redirect_to masteries_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mastery
      @mastery = Mastery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mastery_params
      params.require(:mastery).permit(:name, :description, :image)
    end
end
