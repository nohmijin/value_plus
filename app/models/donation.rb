class Donation < ActiveRecord::Base
    has_one :assembly
    belongs_to :user
end
