class User < ApplicationRecord
    has_secure_password
    has_many :portfolios
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true

    validate :validate_portfolio_limit

    def fullname
        firstname + ' ' + lastname
    end

    private

    def validate_portfolio_limit
        if portfolios.count >= 3
            errors.add(:base, "You can only have a maximum of 3 portfolios.")
        end
    end
end
