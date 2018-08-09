class Scrap < ActiveRecord::Base
    belongs_to :assembly
    belongs_to :user
end
