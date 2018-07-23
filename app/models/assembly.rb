class Assembly < ActiveRecord::Base
    has_one :address
    has_one :host
end
