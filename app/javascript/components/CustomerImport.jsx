import React from "react"

const CustomerImport = ({
  file: { filename },
  status,
  updated_at: updatedAt,
}) => {
  return (
    <div>
      {filename} | {status} - {new Date(updatedAt).toLocaleString()}
    </div>
  );
};

export default CustomerImport;
