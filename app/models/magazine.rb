class Magazine < ActiveRecord::Base
    has_many :subscriptions
    has_many :readers, through: :subscriptions

    def email_list
        list = ''
        readers.each { |r| list += "#{r.email};" }
        list
    end

    scope :most_popular,
          -> {
              Magazine
                  .joins(:subscriptions)
                  .group('subscriptions.magazine_id')
                  .order('count(subscriptions.magazine_id) desc')
                  .first
          }
end
