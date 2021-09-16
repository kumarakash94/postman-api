class Api::V1::UsersController < ApplicationController

	def facebook
		if params[:facebook_access_token]	
			graph = Koala::Facebook::API.new params[:facebook_access_token]
			user_data = graph.get_object("me?fileds=name,email,id,picture")
			user = User.find_by email: user_data["email"]
		if user
			user.generate_new_authentication_token
			json_response "User info", true, {user: user}, :ok
		else
			user = User.new(email: user_data["email"],
											uid: user_data["id"],
											provider: "facebook",
											image: user_data["picture"],
											image: user_data["data"],
											image: user_data["url"] ,
											password: Devise.friendly_token[0,20])
											
			user.authentication_token = User.generate_unique_secure_token
			if user.save
				json_response "Login Facebook Susseccfully", true, {user: user}, :ok
			else
				json_response user.errors, false, {}, :unprocessable_entity
			end
		end
	else
			json_response "Token is missing", false, {}, :unprocessable_entity
		end
	end
end