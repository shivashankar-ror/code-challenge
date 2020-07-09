class Company < ApplicationRecord
  has_rich_text :description

  validates :email,
    format: {
      with: /\A(^[A-Za-z0-9+_.-]+@getmainstreet.com)\z/i,
      allow_blank: true,
      message: 'accepts only getmainstreet.com domain'
    }
end
