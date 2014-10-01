class Session < ActiveRecord::Base
  belongs_to :film
  belongs_to :cinema

	def self.search(from, to)
	    if from && to
	    	find(:all, :conditions => ['start >= ? AND end <= ?', from, to])
	    else
	    	find(:all)
	    end
	end
end
