class AvaliationsController < ApplicationController
  before_action :set_avaliation, only: [:show, :edit, :update, :destroy]
  before_action :find_channels, only: [:index, :show, :new, :edit]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /avaliations
  # GET /avaliations.json
  def index
    @avaliations = Avaliation.all.order('created_at desc')
  end

  # GET /avaliations/1
  # GET /avaliations/1.json
  def show
    @avaliations = Avaliation.all.order('created_at desc')
  end

  # GET /avaliations/new
  def new
    @avaliation = current_user.avaliations.build
  end

  # GET /avaliations/1/edit
  def edit
  end

  # POST /avaliations
  # POST /avaliations.json
  def create
    @avaliation = current_user.avaliations.build(avaliation_params)

    respond_to do |format|
      if @avaliation.save
        format.html { redirect_to @avaliation, notice: 'Avaliation was successfully created.' }
        format.json { render :show, status: :created, location: @avaliation }
      else
        format.html { render :new }
        format.json { render json: @avaliation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /avaliations/1
  # PATCH/PUT /avaliations/1.json
  def update
    respond_to do |format|
      if @avaliation.update(avaliation_params)
        format.html { redirect_to @avaliation, notice: 'Avaliation was successfully updated.' }
        format.json { render :show, status: :ok, location: @avaliation }
      else
        format.html { render :edit }
        format.json { render json: @avaliation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /avaliations/1
  # DELETE /avaliations/1.json
  def destroy
    @avaliation.destroy
    respond_to do |format|
      format.html { redirect_to avaliations_url, notice: 'Avaliation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_avaliation
      @avaliation = Avaliation.find(params[:id])
    end

    def find_channels
      @courses = Course.all.order('created_at desc')
    end
    # Only allow a list of trusted parameters through.
    def avaliation_params
      params.require(:avaliation).permit(:title, :content, :note, :course_id)
    end
end
