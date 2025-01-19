Collecting workspace information

# Autonolas Governance & Tokens

## Vote Weighting

### Invariants
- **Invariant 1:** `NomineeRemoved` - Ensures that a nominee that has been removed cannot be added again. This is crucial to maintain the integrity of the nominee list and prevent re-adding previously removed nominees.
- **Invariant 2:** `LockExpired` - Ensures that votes cannot be cast if the lock period has expired. This prevents users from voting with expired locks, maintaining the validity of the voting process.
- **Invariant 3:** `Overflow` - Ensures that the weight of a vote does not exceed the maximum allowed weight. This prevents overflow errors and ensures that the voting weight remains within acceptable limits.
- **Invariant 4:** `ZeroValue` - Ensures that values that are supposed to be non-zero are not zero. This prevents invalid operations that could lead to unexpected behavior.
- **Invariant 5:** `NonZeroValue` - Ensures that values that are supposed to be zero are indeed zero. This prevents invalid operations that could lead to unexpected behavior.
- **Invariant 6:** `WrongArrayLength` - Ensures that the lengths of arrays passed to functions match the expected lengths. This prevents mismatched array lengths that could lead to errors in processing.

### Ghost Variables
- **`lastUserVote`**: Tracks the last voting time for each user and nominee combination. This is used to enforce the voting delay and ensure that users cannot vote too frequently.
  - **Testing:** Verify that the `lastUserVote` is updated correctly after each vote and that the voting delay is enforced.
- **`voteUserSlopes`**: Tracks the voting slopes for each user and nominee combination. This is used to calculate the voting power and ensure that it is correctly accounted for.
  - **Testing:** Verify that the `voteUserSlopes` are updated correctly after each vote and that the voting power is calculated accurately.
- **`voteUserPower`**: Tracks the total voting power used by each user. This is used to ensure that users do not exceed their available voting power.
  - **Testing:** Verify that the `voteUserPower` is updated correctly after each vote and that users do not exceed their available voting power.

### Improvement Suggestions
- **Additional Invariant:** `NegativeSlope` - Ensure that the slope of a user's voting power is never negative. This would prevent invalid voting power calculations.
  - **Testing:** Add checks to ensure that the slope is always non-negative and handle cases where it might become negative.
- **Additional Ghost Variable:** `totalNumNominees` - Track the total number of nominees in the contract. This would help in verifying that the number of nominees is correctly managed.
  - **Testing:** Verify that the `totalNumNominees` is updated correctly when nominees are added or removed.

## Deployment

### Invariants
- **Invariant 1:** `ZeroAddressVW` - Ensures that the Voting Escrow contract address is not zero. This prevents invalid contract addresses that could lead to errors in deployment.
- **Invariant 2:** `OwnerOnly` - Ensures that only the owner can perform certain actions. This maintains the security and integrity of the contract by restricting access to sensitive functions.

### Ghost Variables
- **`timeSum`**: Tracks the last scheduled time for the sum of weights. This is used to ensure that the sum of weights is updated correctly over time.
  - **Testing:** Verify that the `timeSum` is updated correctly and that the sum of weights is calculated accurately.

### Improvement Suggestions
- **Additional Invariant:** `ValidDispenser` - Ensure that the dispenser address is valid and not zero. This would prevent invalid dispenser addresses that could lead to errors in deployment.
  - **Testing:** Add checks to ensure that the dispenser address is valid and handle cases where it might be invalid.

## Fuzzing

### Invariants
- **Invariant 1:** `EchidnaVoteWeightingAssert` - Ensures that the voting weighting logic is correct and does not lead to unexpected behavior. This is crucial for maintaining the integrity of the voting process.
- **Invariant 2:** `VotingEscrowVerySimple` - Ensures that the voting escrow logic is correct and does not lead to unexpected behavior. This is crucial for maintaining the integrity of the voting escrow process.

### Ghost Variables
- **`cond`**: Tracks the condition for the Echidna fuzzer. This is used to ensure that the fuzzer is working correctly and that the conditions are met.
  - **Testing:** Verify that the `cond` variable is updated correctly and that the fuzzer conditions are met.

### Improvement Suggestions
- **Additional Invariant:** `ValidTimestamp` - Ensure that timestamps are valid and not in the past. This would prevent invalid timestamps that could lead to errors in processing.
  - **Testing:** Add checks to ensure that timestamps are valid and handle cases where they might be invalid.

## General

### Invariants
- **Invariant 1:** `CorrectDataLength` - Ensures that the length of data passed to functions is correct. This prevents errors in processing due to incorrect data lengths.
- **Invariant 2:** `TargetExecFailed` - Ensures that target executions do not fail. This prevents errors in processing due to failed target executions.

### Ghost Variables
- **`dataLength`**: Tracks the length of data passed to functions. This is used to ensure that the data length is correct and prevent errors in processing.
  - **Testing:** Verify that the `dataLength` is updated correctly and that the data length is correct.

### Improvement Suggestions
- **Additional Invariant:** `ValidTarget` - Ensure that target addresses are valid and not zero. This would prevent invalid target addresses that could lead to errors in processing.
  - **Testing:** Add checks to ensure that target addresses are valid and handle cases where they might be invalid.