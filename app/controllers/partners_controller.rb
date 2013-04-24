class PartnersController < ApplicationController

	def create
		@community_partner = Partner.new(params[:partner])

		respond_to do |format|
	      if @community_partner.save
	        format.html { redirect_to dashboard_url, notice: 'Community Partner was successfully created.' }
	        format.json { render json: @trip, status: :created, location: @community_partner }
	      else
	        format.html { render action: "new" }
	        format.json { render json: @community_partner.errors, status: :unprocessable_entity }
	      end
    	end
	end
end