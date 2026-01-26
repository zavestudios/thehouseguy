class Listing < ApplicationRecord
  validates :external_id, presence: true
  validates :source, presence: true
end
