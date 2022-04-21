class SubscriptionSerializer
  include JSONAPI::Serializer

  attributes :title, :price, :status
  set_type :subscription

end
