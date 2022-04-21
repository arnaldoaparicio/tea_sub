class Subscription < ApplicationRecord
  belongs_to :customer
  has_many :tea_subscriptions
  has_many :teas, through: :tea_subscriptions
  validates_presence_of :title
  validates_presence_of :price
  validates_presence_of :status, allow_blank: true
end
