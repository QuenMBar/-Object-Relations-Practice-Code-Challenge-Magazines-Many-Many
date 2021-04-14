class Reader < ActiveRecord::Base
    has_many :subscriptions
    has_many :magazines, through: :subscriptions

    def subscribe(magazine, price)
        subscriptions << Subscription.create(magazine: magazine, price: price)
    end

    def total_subcription_price
        subscriptions.sum(:price)
    end

    def cancel_subscription(magazine)
        found_sub = subscriptions.find(magazine.id)
        found_sub.destroy
    end
end
