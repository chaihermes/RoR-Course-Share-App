class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :search]


  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all.order("created_at desc")
    @avaliations = Avaliation.all.order('created_at desc')
  end
  

  #Para a busca
  def search
    if params[:search].blank?
      @courses = Course.all.order("created_at desc")
    else
      @courses = Course.search(params)
    end
  end



  # GET /courses/1
  # GET /courses/1.json
  def show
    @courses = Course.all
    @avaliations = Avaliation.where('course_id = ?', @course.id)
  end

  # GET /courses/new
  def new
    @course = current_user.courses.build
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = current_user.courses.build(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to courses_path, notice: 'Course was successfully created.' }
        #redirect_to alterado de @course para courses_path
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to courses_path, notice: 'Course was successfully updated.' }
        #redirect_to alterado de @courses para courses_path
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Só permite alguns parâmetros passar. #FIXME: não tá aparecendo a avaliação.
    def course_params
      params.require(:course).permit(:title, :author, :description, :price, :image, :user_id, :avaliation_id)
    end
end