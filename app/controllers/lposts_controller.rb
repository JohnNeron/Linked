class LpostsController < ApplicationController
  before_action :set_lpost, only: %i[ show edit update destroy ]
  before_action :authenticate_luser!
  before_action only: %i[create new destroy edit update] do
    authorize_request(["admin"])
  end

  # GET /lposts or /lposts.json
  def index
    @lposts = Lpost.all
  end

  # GET /lposts/1 or /lposts/1.json
  def show
    mark_notifications_as_read
  end

  # GET /lposts/new
  def new
    @lpost = Lpost.new
  end

  # GET /lposts/1/edit
  def edit
  end

  # POST /lposts or /lposts.json
  def create
    @lpost = Lpost.new(lpost_params)
    @lpost.luser = current_luser
    respond_to do |format|
      if @lpost.save
        format.html { redirect_to lpost_url(@lpost), notice: "La oferta ha sido publicada" }
        format.json { render :show, status: :created, location: @lpost }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lposts/1 or /lposts/1.json
  def update
    respond_to do |format|
      if @lpost.update(lpost_params)
        format.html { redirect_to lpost_url(@lpost), notice: "La oferta ha sido modificada" }
        format.json { render :show, status: :ok, location: @lpost }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lposts/1 or /lposts/1.json
  def destroy
    @lpost.destroy

    respond_to do |format|
      format.html { redirect_to lposts_url, notice: "La oferta se ha eliminado" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lpost
      @lpost = Lpost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lpost_params
      params.require(:lpost).permit(:title, :content, limages: [])
    end

    def mark_notifications_as_read
      if current_luser
        notifications_to_mark_as_read = @lpost.notifications_as_lpost.where(recipient: current_luser)
        notifications_to_mark_as_read.update_all(read_at: Time.zone.now)
      end
    end
end
