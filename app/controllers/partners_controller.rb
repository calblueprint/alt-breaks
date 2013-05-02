class PartnersController < ApplicationController

	def create

		if not params[:partner][:name] == nil
			@community_partner = Partner.new(params[:partner])

			respond_to do |format|
		      if @community_partner.save
		        format.html { redirect_to dashboard_url, notice: 'Community Partner was successfully created.' }
		        format.json { render json: @community_partner, status: :created, location: @community_partner }
		      else
		        format.html { render action: "new" }
		        format.json { render json: @community_partner.errors, status: :unprocessable_entity }
		      end
	    	end
	    else
	    	partner_id = params[:partner][:partner_id]
			Partner.create(:partner => partner = Partner.find(partner_id))
			respond_to do |format|
      			format.html { redirect_to dashboard_url, notice: 'Partner(s) successfully created.' }
    		end
	    end
	end
end