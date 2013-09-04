class PartnersController < ApplicationController
	def destroy
		partner = Partner.find(params[:id])
		partner.destroy
		redirect_to dashboard_url, notice: 'Community Partner was destroyed'
	end

	def create
		partner = Partner.new(params[:partner])
		respond_to do |format|
			if partner.save
				format.html { redirect_to dashboard_url, notice: 'Community Partner was successfully created.' }
	   	else
	    	format.html { render action: "new" }
	    end
    end
	end

	def update
		partner = Partner.find(params[:id])
		respond_to do |format|
			if partner.update_attributes(params[:partner])
				format.html { redirect_to dashboard_url, notice: 'Community Partner was successfully updated.' }
	   	else
	    	format.html { render action: "new" }
	    end
    end
	end
end