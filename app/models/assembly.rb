class Assembly < ActiveRecord::Base
    belongs_to :user
    has_one :address
    has_one :host
    has_many :donations
    has_many :scraps
    has_many :likes
    has_many :liked_users, through: :likes, source: :user
    has_many :scraped_users, through: :scraps, source: :user
    
    mount_uploader :thumnail, ThumnailUploader
end
