class UseremailsController < ApplicationController

	protect_from_forgery

	def create
		@useremail = Useremail.new(params[:useremail])
		@useremail.save
		flash[:message] = true

		redirect_to :controller => :main, :action => :index
	end
end
