class Company < ApplicationRecord
  has_rich_text :description

  before_save :set_resolved_city_and_state,
    if: -> { zip_code_changed? }

  private
  def set_resolved_city_and_state
    # TODO: 2  - move this to background Job
    zip_resolver = ZipcodeResolver.new(zip_code)
    zip_resolver.resolve

    unless zip_resolver.city.present?
      errors.add(:base, 'Unable to resolve zipcode')
      return false
    end

    self.city = zip_resolver.city
    self.state = zip_resolver.state
  end
end
