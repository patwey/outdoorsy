import React from "react";
import VehicleRows from "./VehicleRows";
import VehicleRow from "./VehicleRow";

const CustomerRow = ({
  customer,
}) => {
  const {
    email,
    first_name: firstName,
    last_name: lastName,
    vehicles,
  } = customer;
  const [firstVehicle, ...otherVehicles] = vehicles;
  const vehicleCount = vehicles.length;

  return (
    <React.Fragment>
      <tr>
        <td rowSpan={vehicleCount}>
          {firstName}
          {" "}
          {lastName}
        </td>
        <td rowSpan={vehicleCount}>{email}</td>
        <VehicleRow key={firstVehicle.id} vehicle={firstVehicle} />
      </tr>
      <VehicleRows vehicles={otherVehicles} />
    </React.Fragment>
  );
};

export default CustomerRow;
