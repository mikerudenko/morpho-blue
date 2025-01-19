Collecting workspace information

# Primitive Replicating Market Maker

## Logical Section 1: Swaps
- **Invariant 1:** The invariant of the pool should not decrease after a swap. This ensures that the pool maintains its mathematical properties and prevents arbitrage opportunities.
- **Invariant 2:** The reserves of risky and stable tokens should be updated correctly after a swap. This ensures that the pool's state is consistent with the executed trades.
- **Ghost Variables:** 
  - 

invariantLast

: Used to compare the invariant before and after the swap to ensure it does not decrease.
  - 

deltaInWithFee

: Represents the input amount adjusted for fees, ensuring accurate reserve updates.

## Logical Section 2: Reserves
- **Invariant 1:** The cumulative reserves should increase over time. This ensures that the pool's reserves are correctly accounting for all trades and liquidity changes.
- **Invariant 2:** The block timestamp of the reserves should be updated correctly. This ensures that the pool's state reflects the correct time of the last update.
- **Ghost Variables:** 
  - `cumulativeRisky`: Tracks the cumulative amount of risky tokens in the pool.
  - 

cumulativeStable

: Tracks the cumulative amount of stable tokens in the pool.
  - 

blockTimestamp

: Ensures the reserves are updated with the correct timestamp.

## Logical Section 3: Margins
- **Invariant 1:** The margin balances should be updated correctly after deposits and withdrawals. This ensures that users' margin accounts reflect their actual balances.
- **Invariant 2:** The margin balances should not be negative. This prevents users from having a negative balance, which could lead to insolvency issues.
- **Ghost Variables:** 
  - 

balanceRisky

: Tracks the balance of risky tokens in a user's margin account.
  - 

balanceStable

: Tracks the balance of stable tokens in a user's margin account.

## Logical Section 4: Liquidity
- **Invariant 1:** The liquidity of the pool should increase when liquidity is added and decrease when it is removed. This ensures that the pool's liquidity accurately reflects the actions of liquidity providers.
- **Invariant 2:** The cumulative liquidity should be updated correctly over time. This ensures that the pool's state accurately reflects the total liquidity provided.
- **Ghost Variables:** 
  - 

cumulativeLiquidity

: Tracks the cumulative amount of liquidity in the pool.
  - 

liquidity

: Represents the current liquidity in the pool.

## Logical Section 5: Calibration
- **Invariant 1:** The calibration parameters should be consistent with the pool's state. This ensures that the pool's mathematical properties are correctly configured.
- **Invariant 2:** The calibration parameters should be updated correctly when the pool's state changes. This ensures that the pool's configuration remains accurate over time.
- **Ghost Variables:** 
  - 

scaleFactorRisky

: Represents the scaling factor for risky tokens.
  - 

scaleFactorStable

: Represents the scaling factor for stable tokens.

## Improvement Suggestions
- **Swaps:** Consider adding invariants to check for the accuracy of price calculations during swaps. This would ensure that the prices are calculated correctly and prevent potential arbitrage opportunities.
- **Reserves:** Add invariants to check for the correct handling of edge cases, such as zero reserves or maximum reserve values. This would ensure that the pool can handle extreme scenarios without issues.
- **Margins:** Include invariants to verify the correct handling of margin calls and liquidations. This would ensure that the margin system functions correctly under all conditions.
- **Liquidity:** Add invariants to check for the correct distribution of fees to liquidity providers. This would ensure that liquidity providers are rewarded accurately for their contributions.
- **Calibration:** Consider adding invariants to verify the correct handling of calibration updates during extreme market conditions. This would ensure that the pool remains stable and accurate even during volatile periods.