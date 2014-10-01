class Cinema < ActiveRecord::Base
	has_many :sessions, dependent: :destroy
	has_many :films, through: :sessions
end
