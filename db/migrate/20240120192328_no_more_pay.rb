class NoMorePay < ActiveRecord::Migration[7.0]
  def change
    drop_table :pay_payment_methods
    drop_table :pay_charges
    drop_table :pay_subscriptions
    drop_table :pay_customers
    drop_table :pay_webhooks
    drop_table :pay_merchants
  end
end
