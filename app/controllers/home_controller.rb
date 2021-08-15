class HomeController < ApplicationController
  #before_action :set_livin_room, only: %i[ show edit update destroy ]

  before_action :authenticate_user!, except: [:index]
  
  def index
       @livin_rooms = LivinRoom.all
       @livinTe = LivinRoom.last
       @livins = LivinRoom.all
       
  end


  def create
    
    puts "ENTROU CREATEEE"

    @livin_room = LivinRoom.find(params[:id])

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

def edit
 
   @quarda = LivinRoom.find(params[:id])
   puts "NOME DA SALA #{@quarda.name}"

 
  respond_to do |format|
   
    #if @livin_room.update(livin_room_params)
    
    #if @livin_room.update(livin_room_params) 
     format.html { redirect_to @livin_room, notice: "Livin room was successfully updated." }
      format.json { render :show, status: :ok, location: @livin_room }
      format.js
    #else
     # format.html { render :edit, status: :unprocessable_entity }
      #format.json { render json: @livin_room.errors, status: :unprocessable_entity }
      #format.js
    #end
  end

end

def show
end

def teste

  puts "ENTROU NA ACAO TESTE"


  @quarda = LivinRoom.find(params[:quarda][:id])


  puts " valor do testeeee:::: #{@quarda.name}"

  @meutestes = "te amo jesus cristo"
  
  @vamostestar = @quarda

  #@vamostestar = LivinRoom.first

  


  @roms = LivinRoom.first
  #@roms = @roms.name


  # @roms = "Jesus salvadorrrrrrrr"

  @vamostestar = @quarda
  @vamostestar = @vamostestar.name


  puts "valor roms #{@roms}"

  #@vamostestar = @quarda


  respond_to do |format|

    format.js

  end
end

private

def livin_room_params
  params.require(:livin_room).permit(:name)
end







end
