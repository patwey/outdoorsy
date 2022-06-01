class CustomerImport::FileSchema
  CUSTOMER_COLUMNS = [
    :first_name,
    :last_name,
    :email,
  ]

  VEHICLE_COLUMNS = [
    :kind,
    :name,
    :length,
  ]

  COLUMNS = [
    *CUSTOMER_COLUMNS,
    *VEHICLE_COLUMNS,
  ]
end
