class ArtworksController < ApplicationController
    def index
        @artworks = Artwork.all
        render json: @artworks
    end

    def create
        artwork = Artwork.new(artwork_params)
        if artwork.save
          render json: artwork
        else
          render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    # def create
    #     render json: params #['some_category']
    # end

    def show
      @artwork = Artwork.find(params[:id])
      render json: @artwork
    end

    def update
      @artwork = Artwork.find(params[:id])

      if @artwork.update(artwork_params)
          redirect_to artwork_url(@artwork.id)
      else
          render json: @artwork.errors.full_messages, status: :unprocessable_entity
      end
    end

    def destroy
      @artwork = Artwork.find(params[:id])
      if @artwork.destroy #delete vs destroy - destroy removes dependent whereas delete only that row
        render json: "Artwork destroyed"
      else
        render json: @artwork.errors.full_messages, status: :unprocessable_entity
      end
    end

    private 
    def artwork_params
      # debugger
      params.require(:artwork).permit(:title, :image_url, :artist_id) #params[:chirp] => {body: "My new"}
    end
end