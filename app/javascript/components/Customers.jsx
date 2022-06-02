import React, { useState, useEffect } from "react"
import CustomerList from "./CustomerList";

const Customers = () => {
  const [customers, setCustomers] = useState([]);

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
    <React.Fragment>
      <h1>Customers</h1>
      <CustomerList customers={customers} />
    </React.Fragment>
  );
}

export default Customers;
