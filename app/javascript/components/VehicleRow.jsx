import React from "react";

const VehicleRow = ({
  vehicle,
}) => {
  const {
    name,
    kind,
    length,
  } = vehicle;
  return (
    <React.Fragment>
      <td style={{ paddingLeft: "15px" }}>{name}</td>
      <td>{kind}</td>
      <td>{length}</td>
    </React.Fragment>
  );
};

export default VehicleRow;
