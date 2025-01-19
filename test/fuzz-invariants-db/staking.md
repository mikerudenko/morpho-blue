Collecting workspace information

# Aragon Staking

## Logical Section 1: Staking

### Invariants
- **Invariant 1: Total Staked Balance**
  - **Description:** The total staked balance in the contract should match the sum of all users' staked balances.
  - **Significance:** Ensures that the contract's accounting for staked tokens is accurate and consistent.
- **Invariant 2: User Staked Balance**
  - **Description:** Each user's staked balance should be greater than or equal to their locked balance.
  - **Significance:** Prevents users from having more tokens locked than they have staked, ensuring logical consistency.

### Ghost Variables
- **totalStakedState**
  - **Role:** Represents the sum of all users' staked balances.
  - **Testing:** Compare 

totalStakedState

 with the contract's 

totalStaked

 value to ensure they match.

## Logical Section 2: Locking

### Invariants
- **Invariant 1: Lock Allowance**
  - **Description:** The allowance for each lock manager should be greater than or equal to the locked amount.
  - **Significance:** Ensures that lock managers cannot lock more tokens than they are allowed.
- **Invariant 2: Lock Existence**
  - **Description:** Locks should only exist if they have a non-zero allowance.
  - **Significance:** Prevents the creation of locks with zero allowance, which could lead to inconsistencies.

### Ghost Variables
- **lock.allowance**
  - **Role:** Represents the maximum amount of tokens a lock manager can lock.
  - **Testing:** Ensure that 

lock.allowance

 is always greater than or equal to 

lock.amount

.

## Logical Section 3: Unstaking

### Invariants
- **Invariant 1: Unstaking Balance**
  - **Description:** Users should not be able to unstake more tokens than their unlocked balance.
  - **Significance:** Prevents users from withdrawing more tokens than they have available, ensuring the integrity of the staking system.

### Ghost Variables
- **user.stakedBalance**
  - **Role:** Represents the total staked balance of a user.
  - **Testing:** Ensure that users cannot unstake more than 

user.stakedBalance - user.lockedBalance

.

## Logical Section 4: Slashing

### Invariants
- **Invariant 1: Slash Amount**
  - **Description:** Lock managers should not be able to slash more tokens than the locked balance.
  - **Significance:** Ensures that slashing operations are within the bounds of the locked tokens, preventing unauthorized token transfers.

### Ghost Variables
- **user.lockedBalance**
  - **Role:** Represents the total locked balance of a user.
  - **Testing:** Ensure that slashing operations do not exceed 

user.lockedBalance

.

## Improvement Suggestions
- **Additional Invariants:**
  - **Invariant:** Ensure that the total token balance in the staking contract matches the sum of all staked and locked balances.
  - **Significance:** Provides an additional layer of verification for the contract's token accounting.
- **Additional Ghost Variables:**
  - **totalLockedState**
    - **Role:** Represents the sum of all users' locked balances.
    - **Testing:** Compare `totalLockedState` with the contract's total locked tokens to ensure they match.

By organizing the invariants and ghost variables in this structured manner, we can ensure comprehensive and effective testing of the Aragon Staking contract.