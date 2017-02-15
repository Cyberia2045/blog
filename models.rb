class User < ActiveRecord::Base
	has_one :profile
	has_many :posts
	has_many :rooms
end

class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
end


class Profile < ActiveRecord::Base
	belongs_to :user
end

class Room <ActiveRecord::Base
	has_many :user
end