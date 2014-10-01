class Film < ActiveRecord::Base
	has_many :sessions, dependent: :destroy
	has_many :cinemas, through: :sessions

	def self.search(search)
	    if search
	    	find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
	    else
	    	find(:all)
	    end
	end
end
