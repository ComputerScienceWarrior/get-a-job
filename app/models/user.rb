class User < ApplicationRecord
    has_secure_password
    has_many :portfolios, dependent: :destroy
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true

    def fullname
      "#{firstname} #{lastname}"
    end
  end
