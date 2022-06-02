import React from "react";
import VehicleRows from "./VehicleRows";
import VehicleRow from "./VehicleRow";

const CustomerRow = ({
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
        <VehicleRow key={firstVehicle.id} {...firstVehicle} />
      </tr>
      <VehicleRows vehicles={otherVehicles} />
    </React.Fragment>
  );
};

export default CustomerRow;
