class ContactmesController < ApplicationController
  before_action :set_contactme, only: [:show, :edit, :update, :destroy]

  # GET /contactmes
  # GET /contactmes.json
  def index
    @contactmes = Contactme.all
  end

  # GET /contactmes/1
  # GET /contactmes/1.json
  def show
  end

  # GET /contactmes/new
  def new
    @contactme = Contactme.new
  end

  # GET /contactmes/1/edit
  def edit
  end

  # POST /contactmes
  # POST /contactmes.json
  def create
    @contactme = Contactme.new(contactme_params)

    respond_to do |format|
      if @contactme.save
        format.html { redirect_to "/contactmes/new", notice: 'Tu mensaje fue enviado con éxito.' }
        format.json { render :show, status: :created, location: @contactme }
      else
        format.html { render :new }
        format.json { render json: @contactme.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contactmes/1
  # PATCH/PUT /contactmes/1.json
  def update
    respond_to do |format|
      if @contactme.update(contactme_params)
        format.html { redirect_to @contactme, notice: 'Contactme was successfully updated.' }
        format.json { render :show, status: :ok, location: @contactme }
      else
        format.html { render :edit }
        format.json { render json: @contactme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contactmes/1
  # DELETE /contactmes/1.json
  def destroy
    @contactme.destroy
    respond_to do |format|
      format.html { redirect_to contactmes_url, notice: 'Contactme was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contactme
      @contactme = Contactme.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contactme_params
      params.require(:contactme).permit(:name, :email, :description)
    end
end
