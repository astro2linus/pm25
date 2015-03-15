class PmUpdate < ActiveRecord::Base
  has_many :pm_update_items

  scope :latest, -> { order('created_at DESC').limit(10) }
end
