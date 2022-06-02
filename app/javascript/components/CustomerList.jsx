import React, { useState } from "react";
import Customer from "./Customer";

const CustomerList = ({
  customers,
}) => {
  return (
    <React.Fragment>
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
          {customers.map(({ id, ...customer }) => <Customer key={id} {...customer} />)}
        </tbody>
      </table>
    </React.Fragment>
  );
}

export default CustomerList;
