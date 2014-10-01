class Film < ActiveRecord::Base
	has_many :sessions, dependent: :destroy
	has_many :cinemas, through: :sessions
end
