import React from "react";

const Vehicle = ({
  name,
  kind,
  length,
}) => {
  return (
    <div>
      <em>{name}</em> | {kind} | {length}
    </div>
  );
};

export default Vehicle;
