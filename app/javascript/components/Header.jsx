import React from "react";

const Header = () => {
  return (
    <div
      className="container"
      style={{ textAlign: "center", margin: "5rem auto 5rem" }}
    >
      <div className="row">
        <h2>Outdoor.sy</h2>
      </div>
      <div className="row">
        <div className="six columns">
          <h5>
            <a href="/customers">Customers</a>
          </h5>
        </div>
        <div className="six columns">
          <h5>
            <a href="/customer_imports/new">Add customers</a>
          </h5>
        </div>
      </div>
    </div>
  );
}

export default Header;
