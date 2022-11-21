namespace :stripe do
  namespace :products do
    desc "Create bike Stripe products."
    task :create => :environment do
      require 'stripe'
      Stripe.api_key = ENV["STRIPE_SECRET_KEY"]
      prod_id = 'STANDARD_RIDE'
      begin
        product = Stripe::Product.create({
          id: prod_id,
          name: 'Standard Ride',
          default_price_data: {
            currency: 'usd',
            unit_amount: 699
          }
        })
        Rails.logger.debug "[o] Stripe: Created product #{product['name']} with ID #{product['id']}"
      rescue Stripe::InvalidRequestError => error
        Rails.logger.debug "[!] Stripe: Creating #{prod_id} failed with #{error}"
      end
    end
  end
end
