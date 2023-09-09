class Portfolio < ApplicationRecord
    belongs_to :user
    belongs_to :template, optional: true
    has_many :projects, dependent: :destroy

    validates :title, presence: true, uniqueness: true
    validates :description, presence: true, uniqueness: true
    validate :validate_portfolio_limit, on: :create

    private

    def validate_portfolio_limit
        if user.portfolios.count >= 3
            errors.add(:base, "A User cannot have more than 3 portfolios.")
        end
    end
end
