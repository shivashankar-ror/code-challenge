class ZipcodeResolver
  attr_accessor :zip_code
  attr_reader   :response

  def initialize(zip_code)
    @zip_code = zip_code.to_s.strip
  end

  def city
    @response.to_h.dig(:city)
  end

  def state
    @response.to_h.dig(:state_name)
  end

  def resolve
    begin
      @response = ZipCodes.identify(zip_code)
    # TODO: 1 Introduce custom exception
    rescue Exception => e
      msg = "[ZipcodeResolver]: Error occurred while resolving #{zip_code}."
      msg += "Details: #{e.message}"
      Rails.logger.info msg
      @response = {}
    end
  end
end