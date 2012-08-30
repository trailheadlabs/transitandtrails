class Trailhead < ActiveRecord::Base
  belongs_to :user
  belongs_to :park
  has_and_belongs_to_many :trailhead_features
  has_many :maps, :as => :mapable, :dependent => :destroy
  has_many :photos, :as => :photoable, :dependent => :destroy
  scope :approved, where(:approved => true)
  has_paper_trail
  attr_accessible :description, :latitude, :longitude, :name, :rideshare, :zimride_url
  reverse_geocoded_by :latitude, :longitude

  before_create :auto_approve

  def auto_approve
    if user && (user.trailblazer? || user.admin)
      self.approved = true
    end
  end

  def park_by_bounds
    park = Park.where(":latitude > min_latitude AND :latitude < max_latitude AND :longitude > min_longitude AND :longitude < max_longitude",
      :latitude => self.latitude, :longitude => self.longitude).first
  end

end
