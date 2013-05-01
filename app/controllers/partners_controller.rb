class PartnersController < ApplicationController

	def create

		if params[:partner][:partner_id] == nil
			@community_partner = Partner.new(params[:partner])

			respond_to do |format|
		      if @community_partner.save
		      	@trip = Trip.find(params[:partner][:trip_id])
				@trip.partners << @community_partner
				@trip.save
		        format.html { redirect_to dashboard_url, notice: 'Community Partner was successfully created.' }
		        format.json { render json: @community_partner, status: :created, location: @community_partner }
		      else
		        format.html { render action: "new" }
		        format.json { render json: @community_partner.errors, status: :unprocessable_entity }
		      end
	    	end
	    else
	    	@community_partner = Partner.find(params[:partner][:partner_id])
	    	@trip = Trip.find(params[:partner][:trip_id])
			@trip.partners << @community_partner
			@trip.save
			
			respond_to do |format|
				if @trip.save
					format.html { redirect_to dashboard_url, notice: 'Community Partner was successfully created.' }
			     	format.json { render json: @community_partner, status: :created, location: @community_partner }
			   	else
			    	format.html { render action: "new" }
			    	format.json { render json: @community_partner.errors, status: :unprocessable_entity }
			    end
    		end
	    end
	end
end