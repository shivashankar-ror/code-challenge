require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  test "email should accept blank value" do
    company = Company.new(email: nil)
    company.valid?

    assert_empty company.errors[:email]
  end

  test "email should accept getmainstreet.com domain" do
    company = Company.new(email: 'newaccount@getmainstreet.com')
    company.valid?

    assert_empty company.errors[:email]
  end

  test "email should not accept non getmainstreet.com domain" do
    company = Company.new(email: 'newaccount@example.com')
    company.valid?

    assert_includes company.errors[:email],
      'accepts only getmainstreet.com domain'
  end
end