class AdminsController < ApplicationController
	protect_from_forgery

	before_filter :authed, :except => :login

	def login

		if session[:admin]
			redirect_to :action => :controlpanel
		end

		if request.post?
			admin = Admin.where(:username => params[:admin][:username]).first

			if admin != nil && check_password(admin, params[:admin][:password])
				session[:admin] = admin.username
				redirect_to :action => :controlpanel
			else
				redirect_to :controller => :main
			end
		end
	end

	def logout

		reset_session
		redirect_to :controller => :main
	end

	def controlpanel

	end
	protected

	def check_password(admin, password)
		return admin.hashed_password == Admin.encrypt(password, admin.salt)
	end

end
