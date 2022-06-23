import React, { useState, useEffect } from "react";

const CustomerImportForm = ({
  appendCustomerImport,
  token,
  fetchCustomerImports,
}) => {
  const [file, setFile] = useState(null);
  const [submitErrors, setSubmitErrors] = useState([]);
  const [processing, setProcessing] = useState([]);

  useEffect(getStatuses, [processing])

  const getStatuses = () => {
    processing.forEach((id) => {
      fetch(
        `api/v1/customer_imports/${id}`,
        {
          headers: {
            "X-CSRF-Token": token,
            Accept: "application/json",
          },
        },
      )
        .then((response) => response.json())
        .then(({ data: { status } }) => {
          if (status === "complete") {
            const newProcessing = processing.filter((pid) => pid !== id);

            setProcessing(newProcessing);
            fetchCustomerImports();
          }});
    });

    if (processing.length > 0) {
      getStatuses();
    }
  };

  const handleSubmit = (event) => {
    event.preventDefault();

    const body = new FormData();

    body.append("file", file);

    fetch(
      "/api/v1/customer_imports",
      {
        method: "POST",
        headers: {
          "X-CSRF-Token": token,
          Accept: "application/json",
        },
        body,
      },
    )
      .then((response) => response.json())
      .then(({ data }) => {
        const { errors } = data;

        if (errors) {
          setSubmitErrors(errors);
        } else {
          appendCustomerImport(data);
          setProcessing([data.id ,...processing]);
        }
      });
  };

  const handleFileChange = (event) => {
    const eventFile = event.target.files[0];

    setFile(eventFile);
  };

  return (
    <React.Fragment>
      <h5>Add Customers</h5>
      <form onSubmit={handleSubmit}>
        {submitErrors.length > 0 && (
          <div className="row">
            <ul>
              Unable to save customer import:
              {submitErrors.map((error) => <li>{error}</li>)}
            </ul>
          </div>
        )}
        <div className="row">
          <div className="ten columns">
            {/* eslint-disable-next-line jsx-a11y/label-has-associated-control */}
            <label htmlFor="file">File</label>
            <input
              id="file"
              type="file"
              accept=".txt,.csv"
              onChange={handleFileChange}
            />
          </div>
          <div className="two columns">
            <input
              style={{ marginTop: "2.5rem" }}
              type="submit"
              value="Submit"
              className={file ? "button-primary" : "button"}
              disabled={!file}
            />
          </div>
        </div>
      </form>
    </React.Fragment>
  );
};

export default CustomerImportForm;
