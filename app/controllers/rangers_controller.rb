class RangersController < ApplicationController
  before_action :find_ranger, only: [:show, :edit, :update, :destroy]

  # GET /rangers/new
  def new
    @ranger = Ranger.new
  end

  # GET /rangers/:id
  def show
  end

  # POST /rangers
  def create
    @park_ids = ranger_params[:park_ids]
    @ranger = Ranger.new(:name => ranger_params[:name])

    if @ranger.save
      if @park_ids.length > 1
        # shift out the first empty string
        ## from the hidden value in ranger_params
        ### reference all the rangers in jobs table
        @park_ids.shift
        @park_ids.each do | id |
          puts "id: #{id}"
          @park = Park.find(id)
          @ranger.jobs.create(park: @park)
        end
      end
      flash[:success] = "Ranger Created!"
      redirect_to ranger_path(@ranger)
    else
      flash[:danger] = "Unable to create ranger!"
      render 'new'
    end
  end

  # GET /rangers
  def index
    @ranger = Ranger.all
  end

  # PATCH /rangers/:id
  def update
    
  end

  def destroy

  end

  private
    def find_ranger
      @ranger = Ranger.find(params[:id])
    end

    def ranger_params
      params.require(:ranger).permit(:name, park_ids:[])
    end
end
