class User < ActiveRecord::Base
	def self.find_or_create_by_auth(auth)
		user = User.find_or_create_by(provider: auth['provider'], uid: auth['uid'])

		user.name = auth['info']['name']
		user.nickname = auth['info']['nickname']
		user.email = auth['info']['email']
		user.image_url = auth['info']['image_url']
		user.token = auth['info']['token']

		user.save
		user
	end

	def representatives
		service = GovDataService.new
		service.representatives(latitude, longitude)
	end

	def latitude
		(39.73696)
	end

	def longitude
		(-104.95776)
	end

end
