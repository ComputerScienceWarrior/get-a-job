class Portfolio < ApplicationRecord
    belongs_to :user
    belongs_to :template, optional: true
    has_many :projects

    validates :title, presence: true, uniqueness: true
    validates :description, presence: true, uniqueness: true
end
