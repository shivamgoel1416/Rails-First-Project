Rails.configuration.stripe = {
  :publishable_key => 'pk_test_iBHgAt8CPW8U1q4vDHzebD87',
  :secret_key      => 'sk_test_kNYdfV7FauCYM5RjOPDyFTbc'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]