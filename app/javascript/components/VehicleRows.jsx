import React from "react";
import VehicleRow from "./VehicleRow";

const VehicleRows = ({
  vehicles,
}) => (
  <React.Fragment>
    {vehicles.map(({ id, ...vehicle }) => (
      <tr key={id}>
        <VehicleRow vehicle={vehicle} />
      </tr>
    ))}
  </React.Fragment>
);

export default VehicleRows;
