class MasteriesController < ApplicationController
	before_action :set_mastery, only:[:show, :edit, :update, :destroy]
  def index
  	@masteries = Masteries.all
  end

  def show
  end

  def new
  	@mastery = Masteries.new
  end

  def edit
  end

  def create
  	@mastery = Masteries.new(mastery_params)
  	respond_to do |format|
      if @mastery.save
        format.html { redirect_to @mastery, notice: 'Masteries was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mastery }
      else
        format.html { render action: 'new' }
        format.json { render json: @mastery.errors, status: :unprocessable_entity }
      end
    end
  end

  private
   def set_mastery
      @mastery = Masteries.find(params[:id])
   end
   def mastery_params
   	params.require(:masteries).permit(:name, :description,:image)
   end
end
