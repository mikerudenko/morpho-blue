Collecting workspace information

# EVC (Ethereum Vault Connector) Playground Invariant Tests

## Base Vault Properties
- **Invariant A:** Reentrancy lock must always be in unlocked state (1) between calls
- **Invariant B:** Snapshot length must be 0 between operations
- **Ghost Variables:**
  - `REENTRANCY_LOCK_SLOT`: Tracks reentrancy lock state
  - `SNAPSHOT_SLOT`: Tracks snapshot array length

## ERC4626 Vault Properties

### Assets Management
- **Invariant A:** `asset()` function must never revert
- **Invariant B:** `totalAssets()` function must never revert
- **Invariant C:** `convertToShares()` must return same value regardless of caller
- **Invariant D:** `convertToAssets()` must return same value regardless of caller

### Deposit/Mint Operations
- **Invariant A:** `maxDeposit()` must never revert
- **Invariant B:** `previewDeposit()` must return close to but no more than actual shares minted
- **Invariant C:** `deposit()` should return same or more shares than preview
- **Invariant D:** `maxMint()` must never revert 
- **Invariant E:** `previewMint()` must return close to but no fewer than actual assets needed
- **Ghost Variables:**
  - `ghost_sumBalances`: Tracks total assets deposited
  - `ghost_sumBalancesPerUser`: Tracks per-user deposits

### Withdraw/Redeem Operations
- **Invariant A:** `maxWithdraw()` must never revert
- **Invariant B:** `previewWithdraw()` must return close to but no fewer than shares burned
- **Invariant C:** `maxRedeem()` must never revert
- **Invariant D:** `previewRedeem()` must return close to but no more than assets redeemed
- **Ghost Variables:**
  - `ghost_sumSharesBalances`: Tracks total shares issued
  - `ghost_sumSharesBalancesPerUser`: Tracks per-user shares

### Roundtrip Operations
- **Invariant A:** `redeem(deposit(a)) <= a` 
- **Invariant B:** Withdraw shares >= deposit shares for same asset amount
- **Invariant C:** `deposit(redeem(s)) <= s`
- **Invariant D:** Redeem assets from mint >= original mint shares
- **Invariant E:** `withdraw(mint(s)) >= s`
- **Invariant F:** Redeem assets <= mint assets for same shares
- **Invariant G:** `mint(withdraw(a)) >= a`
- **Invariant H:** Deposit shares <= withdraw shares for same asset amount

## Simple Vault Properties
- **Invariant A:** Vault's asset balance >= totalAssets
- **Invariant B:** totalSupply == sum of all minted shares
- **Invariant C:** `balanceOf(user)` == sum of user's share balance
- **Invariant D:** totalSupply == sum of all user balances

## Simple Borrowable Vault Properties  
- **Invariant A:** totalBorrowed >= any single account's owed balance
- **Invariant B:** totalBorrowed == sum of all user debt
- **Invariant C:** If sum of user debt is 0, totalBorrowed must be 0
- **Invariant D:** User liability should decrease after repayment
- **Invariant E:** Unhealthy accounts cannot borrow
- **Invariant F:** If there is any borrowing, vault must have positive asset balance
- **Ghost Variables:**
  - `ghost_totalBorrowed`: Tracks total borrowed amount
  - `ghost_owedAmountPerUser`: Tracks per-user borrowed amounts
  - `ghost_accountCollaterals`: Tracks enabled collaterals per account

## Improvement Suggestions
1. Add invariants for interest rate accrual
2. Add invariants for liquidation conditions
3. Consider adding invariants for price oracle integration
4. Add stress tests for extreme market conditions
5. Add invariants for controller enabled/disabled state transitions

The test suite uses Medusa and Echidna for fuzzing, with specialized handlers and ghost variables to track state. The architecture allows for modular testing of different vault types while maintaining core ERC4626 compliance.