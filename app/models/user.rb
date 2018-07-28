class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :ability
  has_one :category
  has_many :careers
  
  def self.searchAbility(*ability)
    result = self.includes(:ability)
    if(ability.any?)
      ability.each do |a|
        if(a.any?)
          a.each do |b|
            result = result.where(:abilities => {b => true})
          end
        end
      end
    end
    return result
  end
  
  def self.searchCategory(*category)
    result = self.includes(:category)
    if(category.any?)
      category.each do |c|
        if(c.any?)
          c.each do |d|
            result = result.where(:categories => {d => true})
          end
        end 
      end
    end
    return result
  end
  
end
