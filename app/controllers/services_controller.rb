class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  # GET /services
  def index
    @services = Service.order(position: :asc)
  end

  # POST /services/move
  def movedown
    redirect_to services_url
  end

  # POST /services/moveup
  def moveup
    actual = Service.where(id: params[:id]).first
    if actual.present?
      original = Service.where(position: actual.position.to_i + 1).first
      actual.position = actual.position.to_i + 1
      if actual.save
        original.position = original.position.to_i - 1
        original.save
      end
    end
    redirect_to services_url
  end

  # POST /services/movedown
  def movedown
    actual = Service.where(id: params[:id]).first
    if actual.present?
      original = Service.where(position: actual.position.to_i - 1).first
      actual.position = actual.position.to_i - 1
      if actual.save
        original.position = original.position.to_i + 1
        original.save
      end
    end
    redirect_to services_url
  end

  # GET /services/new
  def new
    @service = Service.new
  end

  # GET /services/1/edit
  def edit
    @position = Service.where(id: params[:id]).first.position
  end

  # POST /services
  def create
    @service = Service.new(service_params)

    respond_to do |format|
      if @service.save
        format.html { redirect_to services_url, notice: 'Service was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /services/1
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to services_url, notice: 'Service was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /services/1
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:name, :address, :port, :position)
    end
end
