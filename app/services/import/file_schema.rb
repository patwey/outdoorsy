module Import
  class FileSchema
    CUSTOMER_COLUMNS = %i[first_name last_name email].freeze

    VEHICLE_COLUMNS = %i[kind name length].freeze

    COLUMNS = [*CUSTOMER_COLUMNS, *VEHICLE_COLUMNS].freeze
  end
end
