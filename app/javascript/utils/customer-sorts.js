export function nullSort() {
  return 0;
};

export function fullNameSort(customerA, customerB) {
  const { first_name: firstNameA, last_name: lastNameA } = customerA;
  const { first_name: firstNameB, last_name: lastNameB } = customerB;
  const fullNameA = `${firstNameA} ${lastNameA}`;
  const fullNameB = `${firstNameB} ${lastNameB}`;

  if (fullNameA < fullNameB) {
    return -1;
  }

  if (fullNameA > fullNameB) {
    return 1;
  }

  return 0;
};

export function firstVehicleKindSort(customerA, customerB) {
  const { vehicles: [{ kind: kindA }] } = customerA;
  const { vehicles: [{ kind: kindB }] } = customerB;

  if (kindA[0] < kindB[0]) {
    return -1;
  }

  if (kindA[0] > kindB[0]) {
    return 1;
  }

  return 0;
};
