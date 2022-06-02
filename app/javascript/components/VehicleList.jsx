import React from "react";
import Vehicle from "./Vehicle";

const VehicleList = ({
  vehicles,
}) => {
  return (
    <React.Fragment>
      {vehicles.map(({ id, ...vehicle }) => (
        <tr>
          <Vehicle key={id} {...vehicle} />
        </tr>
      ))}
    </React.Fragment>
  );
};

export default VehicleList;
