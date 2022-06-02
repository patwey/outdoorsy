import React from "react";
import CustomerRow from "./CustomerRow";

const CustomerTable = ({
  customers,
}) => {
  return (
    <table className="u-full-width">
      <thead>
        <tr>
          <th>Full Name</th>
          <th>Email</th>
          <th>Vehicle Name</th>
          <th>Vehicle Type</th>
          <th>Vehicle Length (ft.)</th>
        </tr>
      </thead>
      <tbody>
        {customers.map(({ id, ...customer }) => <CustomerRow key={id} {...customer} />)}
      </tbody>
    </table>
  );
}

export default CustomerTable;
