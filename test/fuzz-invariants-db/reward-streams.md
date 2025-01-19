Collecting workspace information

# Reward Streams - Invariant Testing Analysis

A comprehensive testing suite for validating the billion-dollar reward distribution algorithm implementation.

## Base Reward Distribution
- **Invariant B:** When no users are earning rewards, someone must be able to claim them
  - Validates that rewards aren't permanently locked
  - Tests by checking if updateReward() can be called when totalEligible = 0

- **Invariant E:** Total registered rewards must exceed total claimed rewards
  - Ensures reward accounting remains solvent
  - Validates `totalRewardRegistered >= totalRewardClaimed`

## Update Rewards Mechanism
- **Invariant B:** Current epoch must be greater than or equal to last updated epoch
  - Maintains chronological reward updates
  - Validates epoch progression

- **Invariant C:** Global accumulator must be greater than user accumulator
  - Ensures users can't claim more rewards than distributed
  - Compares `globalAccumulator >= userAccumulator`

- **Invariant D:** Zero address accumulator must always be 0
  - Prevents rewards from being lost to zero address
  - Checks zero address earnStorage.accumulator

**Ghost Variables:**
- `ghost_claims`: Tracks total claimed rewards per (target, rewarded, reward)
- `ghost_addressZeroClaimedRewards`: Tracks zero address claims per target

## Distribution Controls
- **Invariant A:** LastUpdated timestamp must increase monotonically
  - Ensures proper chronological updates
  - Compares previous and current lastUpdated values

- **Invariant B:** Distribution accumulator must increase monotonically  
  - Validates reward accrual behavior
  - Tracks accumulator changes

- **Invariant C:** Contract balance must cover unclaimed rewards
  - Ensures sufficient reward token balance
  - Validates `balance >= totalRegistered - totalClaimed`

- **Invariant D:** TotalClaimed must match actual transfers
  - Reconciles claimed amounts with transfers
  - Uses ghost_claims for verification

- **Invariant E:** Distribution epochs must be within bounds
  - Enforces MAX_EPOCHS_AHEAD and MAX_DISTRIBUTION_LENGTH
  - Checks epoch ranges

- **Invariant I:** TotalEligible equals sum of active account balances
  - Validates eligible reward calculation
  - Sums balances of enabled accounts

## Staking Mechanism
- **Invariant A:** User balance must equal sum of deposits
  - Ensures accurate stake accounting
  - Uses ghost_deposits mapping

**Ghost Variables:**
- `ghost_deposits`: Tracks user deposits per (address, token)

## Tracking Mechanism
- **Invariant A:** BalanceTrackerHook must never revert
  - Ensures balance tracking reliability
  - Tests hook behavior

- **Invariant B:** ForfeitRecentRewards prevents DOS on liquidation
  - Validates forfeiture mechanism
  - Tests liquidation scenarios

- **Invariant C:** Multiple balanceTrackerHook calls with same balance don't affect distributor
  - Ensures idempotency
  - Tests repeated hook calls

## Testing Tools
- Uses Echidna for fuzzing with configurable test parameters
- Supports both invariant and assertion testing modes
- Includes corpus collection for improved coverage

## Suggested Improvements
1. Add invariants for reward registration bounds
2. Include timing-based invariants for epoch transitions
3. Add ghost variables to track epoch-specific distributions
4. Consider adding invariants for concurrent reward stream interactions
5. Add explicit invariants for the billion-dollar algorithm's core properties

The test suite provides good coverage but could benefit from additional invariants around the core algorithm's mathematical properties and edge cases in the epoch transition logic.