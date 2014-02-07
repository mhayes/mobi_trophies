class TrophiesController < ApplicationController
  before_action :set_trophy, only: [:show, :edit, :update, :destroy]

  # GET /trophies
  # GET /trophies.json
  def index
    @trophies = Trophy.all
  end

  # GET /trophies/1
  # GET /trophies/1.json
  def show
  end

  # GET /trophies/new
  def new
    @trophy = Trophy.new
  end

  # GET /trophies/1/edit
  def edit
  end

  # POST /trophies
  # POST /trophies.json
  def create
    @trophy = Trophy.new(trophy_params)

    respond_to do |format|
      if @trophy.save
        format.html { redirect_to @trophy, notice: 'Trophy was successfully created.' }
        format.json { render action: 'show', status: :created, location: @trophy }
      else
        format.html { render action: 'new' }
        format.json { render json: @trophy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trophies/1
  # PATCH/PUT /trophies/1.json
  def update
    respond_to do |format|
      if @trophy.update(trophy_params)
        format.html { redirect_to @trophy, notice: 'Trophy was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @trophy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trophies/1
  # DELETE /trophies/1.json
  def destroy
    @trophy.destroy
    respond_to do |format|
      format.html { redirect_to trophies_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trophy
      @trophy = Trophy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trophy_params
      params.require(:trophy).permit(:name)
    end
end
