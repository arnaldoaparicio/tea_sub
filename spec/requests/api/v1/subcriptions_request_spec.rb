require 'rails_helper'

RSpec.describe 'Subscriptions API' do
  it 'gets a customers subscriptions' do
    customer1 = Customer.create!(first_name: 'Jon', last_name: 'Doe', email: 'jon@mail.com', address: '12 Main St.')
    subscription1 = Subscription.create!(title: 'Top Tier', price: 100, status: true, customer_id: customer1.id)

    tea1 = Tea.create(title: 'Peach', description: 'Peach tea leaves', temperature: 90, brew_time: 100)

    get "/api/v1/customers/#{customer1.id}/subscriptions"
    customer_subscriptions = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(customer_subscriptions).to have_key(:data)
    expect(customer_subscriptions[:data][0]).to have_key(:attributes)
    expect(customer_subscriptions[:data][0][:attributes]).to have_key(:title)
    expect(customer_subscriptions[:data][0][:attributes]).to have_key(:price)
    expect(customer_subscriptions[:data][0][:attributes]).to have_key(:status)


  end

  it 'cancels a customers subscription' do
    customer1 = Customer.create!(first_name: 'Jon', last_name: 'Doe', email: 'jon@mail.com', address: '12 Main St.')
    subscription1 = Subscription.create!(title: 'Top Tier', price: 100, status: true, customer_id: customer1.id)

    tea1 = Tea.create(title: 'Peach', description: 'Peach tea leaves', temperature: 90, brew_time: 100)

    subscription1.teas << tea1

    subscription_params = { status: false }
    headers = { 'CONTENT_TYPE' => 'application/json' }

    patch "/api/v1/customers/#{customer1.id}/subscriptions/#{subscription1.id}", headers: headers, params: JSON.generate({ subscription: subscription_params })

    customer_subscription = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(customer_subscription[:data][:attributes][:status]).to eq(false)
  end


  it 'creates a new subscription' do
    customer1 = Customer.create!(first_name: 'Jon', last_name: 'Doe', email: 'jon@mail.com', address: '12 Main St.')
    tea1 = Tea.create(title: 'Peach', description: 'Peach tea leaves', temperature: 90, brew_time: 100)

    subscription_params = {
      title: 'Platinum Subscription',
      price: 2000,
      status: true,
      customer_id: customer1.id
    }
    headers = { 'CONTENT_TYPE' => 'application/json' }

    post '/api/v1/subscriptions', headers: headers, params: JSON.generate(subscription: subscription_params, tea: tea1.id)

    subscription = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    expect(subscription).to be_a Hash
    expect(subscription).to have_key(:data)
    expect(subscription[:data]).to have_key(:attributes)
    expect(subscription[:data][:attributes]).to have_key(:title)
    expect(subscription[:data][:attributes]).to have_key(:price)
    expect(subscription[:data][:attributes]).to have_key(:status)

    expect(subscription[:data][:attributes][:title]).to eq('Platinum Subscription')
    expect(subscription[:data][:attributes][:price]).to eq(2000)
    expect(subscription[:data][:attributes][:status]).to eq(true)

  end
end
