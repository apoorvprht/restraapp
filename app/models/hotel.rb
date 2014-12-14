class Hotel < ActiveRecord::Base
	has_many :plases , dependent: :destroy
end
