class Assembly < ActiveRecord::Base
    has_one :address
    has_one :host
    belongs_to :user
end
