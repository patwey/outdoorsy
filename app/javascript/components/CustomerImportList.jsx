import React from "react"
import CustomerImport from "./CustomerImport";

const CustomerImportList = ({
  customerImports,
}) => {
  return (
    <div style={{ marginTop: "8rem" }}>
      <h5>Customer Imports</h5>
      <table className="u-full-width">
        <thead>
          <tr>
            <th>Filename</th>
            <th>Status</th>
            <th>Created At</th>
            <th>Successful</th>
            <th>Failed</th>
          </tr>
        </thead>
        <tbody>
          {customerImports.map(({id, ...customerImport}) => <CustomerImport key={id} {...customerImport} />)}
        </tbody>
      </table>
    </div>
  );
};

export default CustomerImportList;
