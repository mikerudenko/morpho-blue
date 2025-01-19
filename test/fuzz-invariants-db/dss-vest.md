Collecting workspace information

# dss-vest

## Vaults
- **Invariant 1: `clfGreaterOrEqualBgn`**
  - **Description:** Ensures that the cliff time (`clf`) is greater than or equal to the beginning time (`bgn`).
  - **Significance:** This invariant is crucial to ensure that the cliff period is valid and does not start before the vesting period begins.

- **Invariant 2: `finGreaterOrEqualClf`**
  - **Description:** Ensures that the finish time (`fin`) is greater than or equal to the cliff time (`clf`).
  - **Significance:** This invariant ensures that the vesting period is valid and does not end before the cliff period.

- **Invariant 3: `rxdLessOrEqualTot`**
  - **Description:** Ensures that the received amount (`rxd`) is less than or equal to the total amount (`tot`).
  - **Significance:** This invariant ensures that the received amount does not exceed the total vesting amount, maintaining the integrity of the vesting plan.

- **Ghost Variables:**
  - `lockedGhost`: Used to track the locked state of the contract.
    - **Role:** Ensures that the contract's locked state is correctly maintained and verified during tests.
    - **Testing:** Use the `Sstore` and `Sload` hooks to manipulate and verify the `lockedGhost` variable.

## Awards
- **Invariant 1: `everythingNotSetIfUsrNotSet`**
  - **Description:** Ensures that if the user (`usr`) is not set, all other parameters (`bgn`, `clf`, `fin`, `mgr`, `res`, `tot`, `rxd`) are also not set.
  - **Significance:** This invariant ensures that a vesting plan is only considered valid if the user is set, preventing incomplete or invalid vesting plans.

- **Invariant 2: `usrCantBeZeroIfCreate`**
  - **Description:** Ensures that the user (`usr`) is not zero if a vesting plan is created.
  - **Significance:** This invariant prevents the creation of vesting plans with an invalid user address, ensuring the integrity of the vesting process.

- **Ghost Variables:**
  - `rxdGhost`: Used to track the received amount (`rxd`) for a specific vesting plan.
    - **Role:** Ensures that the received amount is correctly maintained and verified during tests.
    - **Testing:** Use the `Sstore` and `Sload` hooks to manipulate and verify the `rxdGhost` variable.

## Governance
- **Invariant 1: `wardsBehaveCorrectlyOnRely`**
  - **Description:** Ensures that the `wards` mapping is correctly updated when the `rely` function is called.
  - **Significance:** This invariant ensures that the authorization mechanism works correctly, maintaining the security of the contract.

- **Invariant 2: `wardsBehaveCorrectlyOnDeny`**
  - **Description:** Ensures that the `wards` mapping is correctly updated when the `deny` function is called.
  - **Significance:** This invariant ensures that the authorization mechanism works correctly, maintaining the security of the contract.

- **Ghost Variables:**
  - `wardsGhost`: Used to track the authorization state of addresses.
    - **Role:** Ensures that the authorization state is correctly maintained and verified during tests.
    - **Testing:** Use the `Sstore` and `Sload` hooks to manipulate and verify the `wardsGhost` variable.

## Improvement Suggestions
- **Additional Invariants:**
  - **Invariant:** Ensure that the `cap` value is correctly set and enforced.
    - **Significance:** This invariant would ensure that the vesting cap is correctly maintained, preventing over-allocation of tokens.

- **Additional Ghost Variables:**
  - **Variable:** `capGhost`
    - **Role:** Track the cap value for the vesting contract.
    - **Testing:** Use the `Sstore` and `Sload` hooks to manipulate and verify the `capGhost` variable.

By organizing the invariants and ghost variables in this structured manner, it becomes easier to understand the purpose and significance of each test, ensuring comprehensive coverage and effective verification of the contract's behavior.