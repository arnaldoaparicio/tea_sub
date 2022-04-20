class Tea < ApplicationRecord
  has_many :tea_subscriptions
  has_many :subscriptions, through: :tea_subscriptions
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :temperature
  validates_presence_of :brew_time
end
