class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :ability
  has_one :category
  has_many :careers
  
  def self.searchAbility(*ability)
    if(ability.any?)
      result = self.includes(:ability)
      ability.each do |a|
        if(a.any?)
          a.each do |b|
            result = result.where(:abilities => {b => true})
          end
        end
      end
      return result
    end
    return self.includes(:ability)
  end
  
  def self.searchCategory(*category)
    if(category.any?)
      result = self.includes(:category)
      category.each do |c|
        if(c.any?)
          c.each do |d|
            result = result.where(:categories => {d => true})
          end
        end 
      end
      return result
    end
    return self.includes(:category)
  end
  
end
