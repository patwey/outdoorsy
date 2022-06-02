import React from "react";

const SortSelect = ({
  handleSortChange,
  options,
}) => (
  <React.Fragment>
    {/* eslint-disable-next-line jsx-a11y/label-has-associated-control */}
    <label
      htmlFor="sort"
      style={{ display: "inline", marginRight: "1rem" }}
    >
      Sort:
    </label>
    <select
      name="sort"
      onChange={handleSortChange}
      style={{ display: "inline" }}
    >
      {options.map(({ label, value }) => (
        <option key={value} value={value}>{label}</option>
      ))}
    </select>
  </React.Fragment>
);

export default SortSelect;
