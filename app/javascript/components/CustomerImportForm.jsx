import React, { useState } from "react"

const CustomerImportForm = ({
  appendCustomerImport,
  token,
}) => {
  const [file, setFile] = useState(null);
  const [fileValidationMessage, setFileValidationMessage] = useState(null);
  const [submitErrors, setSubmitErrors] = useState([])

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
    setSubmitErrors([]);

    const isValid = validateForm();

    if (isValid) {
      const body = new FormData();

      body.append("file", file);

      fetch(
        "/customer_imports",
        {
          method: "POST",
          headers: {
            "X-CSRF-Token": token,
            Accept: "application/json",
          },
          body,
        },
      )
      .then(response => response.json())
      .then(({ data }) => {
        const { errors } = data;

        if (errors) {
          setSubmitErrors(errors);
        } else {
          appendCustomerImport(data);
        }
      });
    }
  };

  const handleFileChange = (event) => {
    const eventFile = event.target.files[0];

    setFile(eventFile);
    setFileValidationMessage(null);
  }

  return (
    <form onSubmit={handleSubmit}>
      <h1>New Customer Import</h1>

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

      {submitErrors.length > 0 && (
        <div>
          Unable to save import due to the following errors:
          <ul>
            {submitErrors.map(error => <li>{error}</li>)}
          </ul>
        </div>
      )}
    </form>
  );
};

export default CustomerImportForm;
