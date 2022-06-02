import React from "react";
import VehicleList from "./VehicleList";

const Customer = ({
  email,
  first_name: firstName,
  last_name: lastName,
  vehicles,
}) => {
  return (
    <div>
      {firstName} {lastName} | {email}
      <VehicleList vehicles={vehicles} />
    </div>
  );
};

export default Customer;
