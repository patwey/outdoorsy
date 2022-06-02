import React from "react";

const SortSelect = ({
  handleSortChange,
  options,
}) => {
  return (
    <React.Fragment>
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
};

export default SortSelect;
