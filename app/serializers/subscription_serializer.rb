class SubscriptionSerializer
  include JSONAPI::Serializer

  attributes :title, :price, :status, :frequency, :teas
  set_type :subscription

end
