import React, { useState, useEffect } from "react"
import CustomerList from "./CustomerList";
import SortSelect from "./SortSelect";
import { nullSort, fullNameSort, firstVehicleKindSort } from "../utils/customer-sorts";

const Customers = () => {
  const [customers, setCustomers] = useState([]);
  const [sortType, setSortType] = useState("nullSort");

  const sorts = {
    nullSort,
    fullNameSort,
    firstVehicleKindSort,
  };

  const sortedCustomers = customers.slice().sort(sorts[sortType]);

  const handleSortChange = event => setSortType(event.target.value);

  useEffect(() => {
    fetch(
      "/api/v1/customers",
      {
        method: "GET",
        headers: {
          Accept: "application/json",
        },
      }
    )
    .then(response => response.json())
    .then(response => setCustomers(response.data));
  }, []);

  return (
    <div className="container">
      <div className="row">
        <div className="nine columns">
          <h5>Customers</h5>
        </div>
        <div className="three columns">
          <SortSelect
            handleSortChange={handleSortChange}
            options={[
              { label: "Default", value: "nullSort" },
              { label: "Full Name", value: "fullNameSort" },
              { label: "Vehicle Type", value: "firstVehicleKindSort" },
            ]}
          />
        </div>
      </div>
      <CustomerList customers={sortedCustomers} />
    </div>
  );
}

export default Customers;
