class Api::V1::SubscriptionsController < ApplicationController
  def index
    if params.has_key?(:customer_id)
      customer = Customer.find(params[:customer_id])
      render json: SubscriptionSerializer.new(customer.subscriptions)
    else
      render json: SubscriptionSerializer.new(Subscription.all)
    end
  end

  def update
    subscription = Subscription.find(params[:id])
    if subscription.update(subscription_params)
      # tea = subscription.teas.first
      # TeaSubscription.find_by(tea: tea, subscription: subscription).delete
      render json: SubscriptionSerializer.new(subscription)
    else
      render status: 400
    end
  end

  def create
    binding.pry
    subscription = Subscription.new(subscription_params)
    tea = Tea.find(params[:tea])
    if subscription.save
      TeaSubscription.create!(tea: tea, subscription: subscription)
      render json: SubscriptionSerializer.new(subscription)
    else
      render status: 404
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:title, :price, :status, :customer_id)
  end
end
