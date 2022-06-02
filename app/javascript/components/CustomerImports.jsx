import React, { useState, useEffect } from "react";
import CustomerImportForm from "./CustomerImportForm";
import CustomerImportList from "./CustomerImportList";

const CustomerImports = ({
  token,
}) => {
  const [customerImports, setCustomerImports] = useState([]);

  useEffect(() => {
    fetch(
      "/api/v1/customer_imports",
      {
        method: "GET",
        headers: {
          Accept: "application/json",
        },
      }
    )
    .then(response => response.json())
    .then(response => setCustomerImports(response.data));
  }, []);

  const appendCustomerImport = (customerImport) => {
    setCustomerImports([customerImport, ...customerImports])
  }

  return (
    <div className="container">
      <CustomerImportForm
        token={token}
        appendCustomerImport={appendCustomerImport}
      />
      <CustomerImportList customerImports={customerImports} />
    </div>
  );
};

export default CustomerImports;
