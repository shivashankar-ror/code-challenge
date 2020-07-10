require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  def test_city_and_state_on_create
    company = Company.new(name: 'Mycompany', zip_code: '99501',
      phone: '555-555-5555', email: 'mycompany@getmainstreet.com')
    company.save

    company.reload
    assert_match company.state, "Alaska"
    assert_match company.city, "Anchorage"
  end

  def test_city_and_state_on_update
    company = Company.create(name: 'Mycompany', zip_code: '99501',
      phone: '555-555-5555', email: 'mycompany@getmainstreet.com')
    company.save
    company.reload

    company.update(zip_code: '85001')
    assert_match company.state, "Arizona"
    assert_match company.city, "Phoenix"
  end
end
