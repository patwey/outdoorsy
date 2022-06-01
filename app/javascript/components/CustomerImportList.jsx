import React from "react"
import CustomerImport from "./CustomerImport";

const CustomerImportList = ({
  customerImports,
}) => {
  return (
    <React.Fragment>
      <h1>Customer Imports</h1>

      {customerImports.map(({id, ...customerImport}) => <CustomerImport key={id} {...customerImport} />)}
    </React.Fragment>
  );
};

export default CustomerImportList;
