class Donation < ActiveRecord::Base
    belongs_to :assembly
    belongs_to :user
end
