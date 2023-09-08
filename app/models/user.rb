class User < ApplicationRecord
    has_secure_password
    has_many :portfolios
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true

    def fullname
      "#{firstname} #{lastname}"
    end
  end
