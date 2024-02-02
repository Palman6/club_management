# frozen_string_literal: true

module UniqueValueGenerator
    def self.generate_unique_value
      loop do
        jti = SecureRandom.uuid
        return jti unless User.exists?(jti: jti)
      end
    end
  end