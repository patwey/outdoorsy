import React from "react"

const CustomerImportRow = ({
  file: { filename },
  status,
  created_at: createdAt,
  metadata,
}) => {
  const succesful = metadata.success.length;
  const failed = metadata.error.length;
  const formattedCreatedAt = new Date(createdAt).toLocaleString();

  return (
    <tr>
      <td>{filename}</td>
      <td>{status}</td>
      <td>{formattedCreatedAt}</td>
      <td>{succesful}</td>
      <td>{failed}</td>
    </tr>
  );
};

export default CustomerImportRow;
