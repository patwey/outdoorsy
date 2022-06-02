import React, { useState } from "react";
import { nullSort, fullNameSort, firstVehicleKindSort } from "../utils/customer-sorts";
import Customer from "./Customer";

const CustomerList = ({
  customers,
}) => {
  const [sortType, setSortType] = useState("nullSort");

  const sorts = {
    nullSort,
    fullNameSort,
    firstVehicleKindSort,
  };

  const sortedCustomers = customers.slice().sort(sorts[sortType]);

  const handleSortChange = event => setSortType(event.target.value);

  return (
    <React.Fragment>
      <label htmlFor="sort">Sort:</label>
      <select name="sort" onChange={handleSortChange}>
        <option value="nullSort">Default</option>
        <option value="fullNameSort">Full Name</option>
        <option value="firstVehicleKindSort">Vehicle Type</option>
      </select>
      {sortedCustomers.map(({ id, ...customer }) => <Customer key={id} {...customer} />)}
    </React.Fragment>
  );
}

export default CustomerList;
