class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :likes
  has_many :liked_assemblies, :through=> :likes, source: :assembly
  has_one :ability
  has_one :category
  has_many :careers
  has_many :assemblies
  has_many :donations
  has_many :scraps
  has_many :scraped_assemblies, through: :scraps, source: :assembly 
  
  def is_like? (assembly)
    Like.find_by(user_id: self.id, assembly_id: assembly.id).present?
  end
  
  def is_scrap? (assembly)
    Scrap.find_by(user_id: self.id, assembly_id: assembly.id).present?
  end
  
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
