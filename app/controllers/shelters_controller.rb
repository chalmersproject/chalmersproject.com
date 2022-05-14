# typed: true
# frozen_string_literal: true

class SheltersController < ApplicationController
  before_action :set_shelter, only: %i[show edit update destroy]

  # GET /shelters or /shelters.json
  def index
    @shelters = Shelter.all.includes(image_attachment: :blob)
  end

  # GET /shelters/1 or /shelters/1.json
  def show; end

  # GET /shelters/new
  def new
    @shelter = Shelter.new
  end

  # GET /shelters/1/edit
  def edit; end

  # POST /shelters or /shelters.json
  def create
    @shelter = Shelter.new(shelter_params)

    respond_to do |format|
      if @shelter.save
        format.html do
          redirect_to(
            shelter_url(@shelter),
            notice: "Shelter was successfully created.",
          )
        end
        format.json { render(:show, status: :created, location: @shelter) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json do
          render(json: @shelter.errors, status: :unprocessable_entity)
        end
      end
    end
  end

  # PATCH/PUT /shelters/1 or /shelters/1.json
  def update
    respond_to do |format|
      if @shelter.update(shelter_params)
        format.html do
          redirect_to(
            shelter_url(@shelter),
            notice: "Shelter was successfully updated.",
          )
        end
        format.json { render(:show, status: :ok, location: @shelter) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json do
          render(json: @shelter.errors, status: :unprocessable_entity)
        end
      end
    end
  end

  # DELETE /shelters/1 or /shelters/1.json
  def destroy
    @shelter.destroy

    respond_to do |format|
      format.html do
        redirect_to(shelters_url, notice: "Shelter was successfully destroyed.")
      end
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_shelter
    @shelter = Shelter.friendly.find(params[:id]).decorate
  end

  # Only allow a list of trusted parameters through.
  def shelter_params
    shelter = T.cast(params.require(:shelter), ActionController::Parameters)
    shelter
      .permit(
        :name,
        :slug,
        :about,
        :image,
        :location,
        :address,
        :contact_email,
        :contact_phone,
      )
      .tap do |shelter|
        # Set image to nil if blank
        shelter["image"] = nil if shelter["image"] == ""

        # Set contact_email, contact_phone to nil if blank
        %w[contact_email contact_phone].each do |field|
          shelter[field] = nil if shelter[field].blank?
        end
      end
  end
end
