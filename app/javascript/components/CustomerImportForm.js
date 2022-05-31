import React, { useState } from "react"

const CustomerImportForm = () => {
  const [file, setFile] = useState(null);
  const [fileValidationMessage, setFileValidationMessage] = useState(null);

  const validateForm = () => {
    let isValid = true;

    if (!file) {
      isValid = false;
      setFileValidationMessage("File is required");
    }

    return isValid;
  };

  const handleSubmit = (event) => {
    event.preventDefault();
    const isValid = validateForm();

    if (isValid) {
      alert("File submitted");
    }
  };

  const handleFileChange = (event) => {
    const eventFile = event.target.files[0];

    setFile(eventFile);
    setFileValidationMessage(null);
  }

  return (
    <form onSubmit={handleSubmit}>
      <h1>Import New Customers</h1>

      <label htmlFor="file">File</label>
      <input
        id="file"
        type="file"
        accept=".txt,.csv"
        onChange={handleFileChange}
      />
      {fileValidationMessage && (
        <span>{fileValidationMessage}</span>
      )}

      <div>
        <input type="submit" value="Submit" />
      </div>
    </form>
  );
};

export default CustomerImportForm;
