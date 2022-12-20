class PagesController < ApplicationController
  load_and_authorize_resource

  before_action :set_page, only: %i[show edit update destroy]
  # before_action :authenticate_user!, except: [:show]

  # GET /pages or /pages.json
  def index
    @pages = current_user.pages.order(created_at: :asc)
  end

  # GET /pages/1 or /pages/1.json
  def show; end

  # GET /pages/new
  def new
    @page = Page.new
  end

  # GET /pages/1/edit
  def edit; end

  # POST /pages or /pages.json
  def create
    # @page = Page.new(page_params)
    @page = current_user.pages.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to page_url(@page), notice: "Page was successfully created." }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1 or /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to page_url(@page), notice: "Page was successfully updated." }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1 or /pages/1.json
  def destroy
    @page.destroy

    respond_to do |format|
      format.html { redirect_to pages_url, notice: "Page was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_page
    @page = Page.find(params[:id])

    redirect_to @page, status: :moved_permanently if params[:id] != @page.slug
  end

  # Only allow a list of trusted parameters through.
  def page_params
    params.require(:page).permit(:first_name, :last_name, :about, :avatar,
                                 :page_type, :gender, :birthday, :current_address,
                                 :telephone_number, :email, :other_links, :education, :education_start_date,
                                 :education_end_date, :education2, :education2_start_date,
                                 :education2_end_date, :experience, :experience_start_date, :experience_end_date,
                                 :experience2, :experience2_start_date, :experience2_end_date,
                                 :experience3, :experience3_start_date, :experience3_end_date,
                                 :experience4, :experience4_start_date, :experience4_end_date, :current_role)
  end
end
