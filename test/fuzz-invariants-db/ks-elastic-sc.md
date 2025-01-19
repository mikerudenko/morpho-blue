Collecting workspace information

# KyberSwap Elastic v2

## Logical Section 1: Anti-Snipping Attack
- **Invariant 1:** 

feesLocked

 should be zero if `feesClaimableSinceLastActionBps` and `feesLockedCurrent` are zero.
  - **Significance:** Ensures that no fees are locked when there are no claimable or locked fees since the last action.
- **Invariant 2:** 

feesClaimable

 should be zero if `feesClaimableSinceLastActionBps` and `feesLockedCurrent` are zero.
  - **Significance:** Ensures that no fees are claimable when there are no claimable or locked fees since the last action.
- **Invariant 3:** 

feesLockedNew

 should be zero when all fees are claimable.
  - **Significance:** Ensures that all fees are correctly marked as claimable when there are no locked fees.
- **Invariant 4:** 

feesClaimable

 should equal 

feesSinceLastAction

 when the vesting period is zero.
  - **Significance:** Ensures that all fees since the last action are claimable immediately if there is no vesting period.
- **Ghost Variables:** 
  - 

feesLocked

: Tracks the amount of fees locked since the last update.
  - 

feesClaimable

: Tracks the amount of fees that are claimable.
  - **Testing Suggestions:** Use assertions to verify that 

feesLocked

 and 

feesClaimable

 are updated correctly after each action.

## Logical Section 2: Oracle
- **Invariant 1:** 

cardinalityNext

 should be equal to the maximum cardinality.
  - **Significance:** Ensures that the oracle can handle the maximum number of observations.
- **Invariant 2:** 

index

 should wrap around correctly.
  - **Significance:** Ensures that the oracle's index wraps around when it reaches the maximum value.
- **Invariant 3:** 

tickCumulative

 should be correctly updated for each observation.
  - **Significance:** Ensures that the cumulative tick value is accurately tracked over time.
- **Ghost Variables:** 
  - 

tickCumulative

: Tracks the cumulative tick value over time.
  - **Testing Suggestions:** Use assertions to verify that 

tickCumulative

 is updated correctly after each observation.

## Logical Section 3: Pool Ticks State
- **Invariant 1:** 

nearestCurrentTick

 should be correctly updated after each tick list update.
  - **Significance:** Ensures that the nearest current tick is accurately tracked.
- **Invariant 2:** 

initializedTicks

 should be correctly updated after each tick list update.
  - **Significance:** Ensures that the list of initialized ticks is accurately tracked.
- **Ghost Variables:** 
  - 

nearestCurrentTick

: Tracks the nearest current tick.
  - 

initializedTicks

: Tracks the list of initialized ticks.
  - **Testing Suggestions:** Use assertions to verify that 

nearestCurrentTick

 and 

initializedTicks

 are updated correctly after each tick list update.

## Logical Section 4: Linked List
- **Invariant 1:** The linked list should maintain correct order after each insertion.
  - **Significance:** Ensures that the linked list maintains the correct order of elements.
- **Invariant 2:** The linked list should maintain correct order after each removal.
  - **Significance:** Ensures that the linked list maintains the correct order of elements.
- **Ghost Variables:** 
  - 

previous

: Tracks the previous element in the linked list.
  - 

next

: Tracks the next element in the linked list.
  - **Testing Suggestions:** Use assertions to verify that 

previous

 and 

next

 are updated correctly after each insertion and removal.

## Improvement Suggestions
- **Anti-Snipping Attack:** Consider adding invariants to check the correct handling of multiple liquidity addition instances.
- **Oracle:** Consider adding invariants to check the gas cost of growing the oracle's cardinality.
- **Pool Ticks State:** Consider adding invariants to check the correct handling of liquidity updates and cross-tick updates.
- **Linked List:** Consider adding invariants to check the correct handling of boundary conditions and edge cases.