Collecting workspace information

# Euler Vault Kit Invariant Testing Analysis

## Base Protocol Invariants
- **Reentrancy Protection:**
  - `BASE_INVARIANT_A`: Ensures reentrancy lock is unlocked after operations
  - `BASE_INVARIANT_B`: Verifies snapshot state is properly reset after actions
  - `INTERNAL_INVARIANT_A/B/C/D`: Validates proper operation initialization and status checks

- **Ghost Variables:** 
  - None defined for base protocol invariants

## Token Module Invariants 
- **Supply and Balance Tracking:**
  - `TM_INVARIANT_A`: Total supply equals sum of all minted shares plus accumulated fees
  - `TM_INVARIANT_B`: Balance tracking accuracy per account
  - `TM_INVARIANT_C`: Total supply equals sum of all balances plus fees

- **Ghost Variables:**
  - `ghost_sumBalances`: Tracks total token balances
  - `ghost_sumBalancesPerUser`: Maps per-user token balances
  - `ghost_sumSharesBalances`: Tracks total shares
  - `ghost_sumSharesBalancesPerUser`: Maps per-user shares

## Vault Module Invariants (ERC4626)
- **Asset Related:**
  - `ERC4626_ASSETS_INVARIANT_A/B`: Asset interface and totalAssets must not revert
  - `ERC4626_ASSETS_INVARIANT_C/D`: Conversion functions must be caller-independent

- **Deposit/Withdraw Operations:**
  - `ERC4626_DEPOSIT_INVARIANT_A/B`: MaxDeposit/Preview validity
  - `ERC4626_WITHDRAW_INVARIANT_A/B`: MaxWithdraw/Preview validity
  - `ERC4626_MINT_INVARIANT_A/B`: MaxMint/Preview validity
  - `ERC4626_REDEEM_INVARIANT_A/B`: MaxRedeem/Preview validity

- **Round Trip Properties:**
  - `ERC4626_ROUNDTRIP_INVARIANT_A-H`: Validates various deposit/withdraw/mint/redeem combinations

## Interest Rate Invariants
- **Rate and Update Validation:**
  - `I_INVARIANT_A`: Interest fee within allowed range
  - `I_INVARIANT_B`: Last interest accumulator update ≤ current timestamp
  - `I_INVARIANT_D`: Interest rate within bounds
  - `I_INVARIANT_E`: Interest accumulator monotonicity

## Borrowing Module Invariants
- **Debt Tracking:**
  - `BM_INVARIANT_A`: Total borrows ≥ any individual debt
  - `BM_INVARIANT_B`: Total borrows equals sum of debts
  - `BM_INVARIANT_C`: Zero total implies zero individual debt

- **Ghost Variables:**
  - `ghost_totalBorrowed`: Tracks total borrowed amount
  - `ghost_owedAmountPerUser`: Maps per-user debt
  - `ghost_accountCollaterals`: Tracks enabled collaterals per user

## Liquidation Module Invariants
- **Health Status:**
  - `LM_INVARIANT_A`: Only unhealthy accounts can be liquidated
  - `LM_INVARIANT_B`: Exchange rate monotonicity without debt socialization
  - `LM_INVARIANT_C`: Only liquidations affect healthy account status
  - `LM_INVARIANT_D`: Only liquidations worsen unhealthy status

## Improvement Suggestions

1. **Additional Ghost Variables:**
   - Add historical exchange rate tracking
   - Track accumulated fees separately
   - Monitor liquidation events/amounts

2. **Additional Invariants:**
   - Validate fee accrual accuracy
   - Test edge cases in price oracles
   - Verify collateral value calculations
   - Check debt ceiling compliance

3. **Testing Enhancement:**
   - Add more exhaustive round-trip property tests
   - Increase coverage of interest rate scenarios
   - Test extreme market conditions
   - Add invariants for hooks and governance operations