import React from "react";
import VehicleList from "./VehicleList";
import Vehicle from "./Vehicle";

const Customer = ({
  email,
  first_name: firstName,
  last_name: lastName,
  vehicles,
}) => {
  const [firstVehicle, ...otherVehicles] = vehicles;

  return (
    <React.Fragment>
      <tr>
        <td rowSpan={vehicles.length}>{firstName} {lastName}</td>
        <td rowSpan={vehicles.length}>{email}</td>
        <Vehicle key={firstVehicle.id} {...firstVehicle} />
      </tr>
      <VehicleList vehicles={otherVehicles} />
    </React.Fragment>
  );
};

export default Customer;
