import React from "react";
import Vehicle from "./Vehicle";

const VehicleList = ({
  vehicles,
}) => {
  return (
    <ul>
      {vehicles.length > 0 ? (
        <React.Fragment>
          {vehicles.map(({ id, ...vehicle }) => (
            <Vehicle key={id} {...vehicle} />
          ))}
        </React.Fragment>
      ) : (
        <li>No vehicles on record</li>
      )}
    </ul>
  );
};

export default VehicleList;
