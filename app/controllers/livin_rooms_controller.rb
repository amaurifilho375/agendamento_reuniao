class LivinRoomsController < ApplicationController
  before_action :set_livin_room, only: %i[ show edit update destroy ]

  #before_action :authenticate_user!

  before_action :authenticate_user!, except: [:index]





  # GET /livin_rooms or /livin_rooms.json
  def index
    @livin_rooms = LivinRoom.all
  end

  # GET /livin_rooms/1 or /livin_rooms/1.json
  def show
  end

  # GET /livin_rooms/new
  def new
    @livin_room = LivinRoom.new
  end

  # GET /livin_rooms/1/edit
  def edit
  end

  # POST /livin_rooms or /livin_rooms.json
  def create
    @livin_room = LivinRoom.new(livin_room_params)

    respond_to do |format|
      
      if @livin_room.save
        puts "VALOR DO ERRO: #{@livin_room.errors.count}"
        format.js
        format.html { redirect_to @livin_room, notice: "Livin room was successfully created." }
        format.json { render :show, status: :created, location: @livin_room }
        #format.js {render :layout=>false}
      else
        format.js
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @livin_room.errors, status: :unprocessable_entity }
       # format.js {render :layout=>false}
      end
    end
  end

  # PATCH/PUT /livin_rooms/1 or /livin_rooms/1.json
  def update
    respond_to do |format|
      if @livin_room.update(livin_room_params)
        format.html { redirect_to @livin_room, notice: "Livin room was successfully updated." }
        format.json { render :show, status: :ok, location: @livin_room }
        #format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @livin_room.errors, status: :unprocessable_entity }
        #format.js
      end
    end
  end

  # DELETE /livin_rooms/1 or /livin_rooms/1.json
  def destroy
    @livin_room.destroy
    respond_to do |format|
      format.html { redirect_to livin_rooms_url, notice: "Livin room was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_livin_room
      @livin_room = LivinRoom.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def livin_room_params
      params.require(:livin_room).permit(:name)
    end
end
