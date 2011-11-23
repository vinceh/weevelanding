class MainController < ApplicationController

	protect_from_forgery

	def index
		@useremail = Useremail.new
	end
end
