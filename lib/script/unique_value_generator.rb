# frozen_string_literal: true

# generator
module UniqueValueGenerator
  def self.generate_unique_value
    loop do
      jti = SecureRandom.uuid
      return jti unless User.exists?(jti:)
    end
  end
end
