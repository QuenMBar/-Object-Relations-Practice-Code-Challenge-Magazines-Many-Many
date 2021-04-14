class Magazine < ActiveRecord::Base
    has_many :subscriptions
    has_many :readers, through: :subscriptions

    def email_list
        readers.map(&:email).join('; ')
    end

    def self.most_popular2
        self.all.sort_by { |m| m.subscriptions.size }.last
    end
end
