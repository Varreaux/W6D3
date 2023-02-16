class ArtworkSharesController < ApplicationController
    def index
        @artwork_shares = ArtworkShare.all
        render json: @artwork_shares
    end

    def create
        artwork_share = ArtworkShare.new(artwork_share_params)
        if artwork_share.save
          render json: artwork_share, status: :created
        else
          render json: artwork_share.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
      @artwork_share = ArtworkShare.find(params[:id])
      if @artwork_share.destroy #delete vs destroy - destroy removes dependent whereas delete only that row
        render json: @artwork_share 
      else
        render json: @artwork_share.errors.full_messages, status: :unprocessable_entity
      end
    end

    private 
    def artwork_share_params
      # debugger
      params.require(:artwork_shares).permit(:artwork_id, :viewer_id) #params[:chirp] => {body: "My new"}
    end

    # def show
    #   @artwork_share = ArtworkShares.find(params[:id])
    #   render json: @artwork_share
    # end

    # def update
    #   @artwork_share = ArtworkShares.find(params[:id])

    #   if @artwork_share.update(artwork_share_params)
    #       redirect_to artwork_share_url(@artwork_share.id)
    #   else
    #       render json: @artwork_share.errors.full_messages, status: :unprocessable_entity
    #   end
    # end

end