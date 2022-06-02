import React from "react";
import VehicleRow from "./VehicleRow";

const VehicleRows = ({
  vehicles,
}) => {
  return (
    <React.Fragment>
      {vehicles.map(({ id, ...vehicle }) => (
        <tr>
          <VehicleRow key={id} {...vehicle} />
        </tr>
      ))}
    </React.Fragment>
  );
};

export default VehicleRows;
