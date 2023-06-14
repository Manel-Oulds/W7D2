class BandsController < ApplicationController
    before_action :set_band, only: [:show, :edit, :update, :destroy]
    def index
        @bands = Band.all
        render :index
    end
    def new
        @band = Band.new
    end
    def create
        @band = Band.new(band_params)
        if @band.save!
            redirect_to band_url(@band.id)
        else    
            flash[:errors] = @band.errors.full_messages
            render :new
        end
    end

    def edit
        render :edit
    end
    def show
       render :show if set_band
        
    end

    def update
        if @band.update(band_params)
            redirect_to band_url(@band)
        else
            flash.now[:errors] = @band.errors.full_messages
            render :edit
        end
    end

    def destroy
        set_band.destroy
        redirect_to bands_url
    end

    def band_params
        params.require(:bands).permit(:name)
    end

    def set_band
        @band = Band.find(params[:id])
        # redirect_to bands_url
    end
end
