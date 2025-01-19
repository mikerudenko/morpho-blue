Collecting workspace information

# Liquity Project

## Logical Section 1: Price Feed
- **Invariant 1 (PF-01):** The price feed must never revert. This ensures that the price feed contract is always operational and does not cause transaction failures.
- **Invariant 2 (PF-02):** The price feed must follow valid status transitions. This ensures that the price feed transitions between states correctly.
- **Invariant 3 (PF-03):** The price feed must never deadlock. This ensures that the price feed does not get stuck in an unusable state.
- **Invariant 4 (PF-04):** The price feed should never report an outdated price if Chainlink is working. This ensures the accuracy of the price feed when the primary oracle is operational.
- **Invariant 5 (PF-05):** The price feed should never use the fallback if Chainlink is working. This ensures that the fallback mechanism is only used when necessary.
- **Invariant 6 (PF-06):** The system never tries to use the fallback if it is not set. This ensures that the fallback mechanism is correctly configured before use.

## Logical Section 2: Sorted List
- **Invariant 1 (SL-01):** The NICR ranking in the sorted list should follow descending order. This ensures that the list is correctly ordered by NICR.
- **Invariant 2 (SL-02):** The first (highest) ICR in the sorted list should be greater or equal to TCR. This ensures that the top-ranked CDP has a healthy collateral ratio.
- **Invariant 3 (SL-03):** All CDPs have status active and stake greater than zero. This ensures that all CDPs in the list are valid and active.
- **Invariant 4 (SL-05):** The CDPs should be sorted in descending order of new ICR (accrued). This ensures that the list remains correctly ordered after accruals.

## Logical Section 3: General
- **Invariant 1 (GENERAL-01):** After any user operation, the system should not enter Recovery Mode. This ensures that normal operations do not destabilize the system.
- **Invariant 2 (GENERAL-02):** The dollar value of the locked stETH exceeds the dollar value of the issued eBTC if TCR is greater than 100%. This ensures that the system is always over-collateralized.
- **Invariant 3 (GENERAL-03):** CdpManager and BorrowerOperations do not hold value in terms of stETH and eBTC unless there are donations. This ensures that these contracts do not inadvertently hold value.
- **Invariant 4 (GENERAL-05):** At all times, the total stETH shares of the system exceed the deposits if there are no negative rebasing events. This ensures that the system's collateral is always sufficient.
- **Invariant 5 (GENERAL-06):** At all times, the total debt is greater than the sum of all debts from all CDPs. This ensures that the system's debt accounting is accurate.

## Logical Section 4: Liquidation Sequencer
- **Invariant 1 (L-09):** Undercollateralized liquidations are also incentivized with the Gas Stipend. This ensures that liquidations are economically viable.
- **Invariant 2 (L-12):** TCR must increase after liquidation with no redistributions if the liquidated CDP's ICR is less than TCR before liquidation. This ensures that liquidations improve the system's collateral ratio.
- **Invariant 3 (L-15):** The RM grace period should set if a BO/liquidation/redistribution makes the TCR below CCR. This ensures that the system enters Recovery Mode appropriately.
- **Invariant 4 (L-16):** The RM grace period should reset if a BO/liquidation/redistribution makes the TCR above CCR. This ensures that the system exits Recovery Mode appropriately.

## Logical Section 5: eBTC
- **Invariant 1 (EBTC-02):** Any eBTC holder (whether or not they have an active CDP) may redeem their eBTC unless TCR is below MCR. This ensures that eBTC holders can always redeem their tokens under normal conditions.

## Logical Section 6: Fee Recipient
- **Invariant 1 (F-01):** `claimFeeRecipientCollShares` allows claiming at any time. This ensures that fee recipients can claim their shares whenever needed.
- **Invariant 2 (F-02):** Fees from redemptions are added to `claimFeeRecipientCollShares`. This ensures that fees are correctly accounted for.
- **Invariant 3 (F-03):** Fees from flash loans are sent to the fee recipient. This ensures that flash loan fees are correctly distributed.
- **Invariant 4 (F-04):** `claimFeeRecipientCollShares` claiming increases the balance of the fee recipient. This ensures that claiming fees correctly updates the recipient's balance.

## Ghost Variables
- **Price Feed:**
  - `lastGoodPrice`: Tracks the last known good price to ensure the price feed does not report outdated prices.
  - `fallbackPrice`: Used to verify that the fallback mechanism is correctly implemented.
- **Sorted List:**
  - `NICR`: Ensures that the NICR ranking is correctly maintained.
  - `ICR`: Ensures that the ICR values are correctly calculated and ordered.
- **General:**
  - `totalStETHShares`: Ensures that the total stETH shares are always greater than the deposits.
  - `totalDebt`: Ensures that the total debt is accurately tracked.
- **Liquidation Sequencer:**
  - `TCR`: Ensures that the TCR is correctly updated after liquidations.
  - `RMGracePeriod`: Ensures that the Recovery Mode grace period is correctly managed.
- **eBTC:**
  - `redeemable`: Ensures that eBTC tokens are redeemable under normal conditions.
- **Fee Recipient:**
  - `feeShares`: Ensures that fee shares are correctly tracked and claimable.

## Improvement Suggestions
- **General:**
  - Add an invariant to ensure that the system's collateral ratio (TCR) is always above a minimum threshold.
  - Introduce ghost variables to track the cumulative fees collected and ensure they match the expected values.
- **Price Feed:**
  - Add an invariant to ensure that the price feed updates within a specified time interval to prevent stale prices.
- **Liquidation Sequencer:**
  - Introduce ghost variables to track the number of liquidations and ensure they match the expected values.

By organizing the invariants and ghost variables in this structured manner, it becomes easier to understand the purpose and significance of each invariant, as well as how to effectively test them.