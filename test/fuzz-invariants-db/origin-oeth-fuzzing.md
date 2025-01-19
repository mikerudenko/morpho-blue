Collecting workspace information

# Origin Protocol OETH Vault Fuzzing Suite

## Global Invariants
- **Total WETH vs Starting Balance**: The sum of WETH held by all actors never exceeds their initial WETH starting balances
- **Total OETH vs Starting Balance**: The sum of OETH held by actors never exceeds their initial WETH starting balances 
- **Total Yield vs Donations**: The total generated yield equals the total WETH donated to the Vault (within tolerance)
- **Global Accounting**: `totalStarting - totalDonated = totalWeth + totalOeth - totalYield`
- **OETH Supply Cap**: Total OETH supply never exceeds total WETH supply
- **Vault Balance vs Total OETH**: Vault's WETH balance aligns with total OETH held by actors

**Ghost Variables:**
- `totalDonated`: Tracks total WETH donated to vault
- `totalYield`: Tracks total OETH yield generated from donations
- `STARTING_BALANCE`: Initial WETH balance for active actors
- `STARTING_BALANCE_OUTSIDER`: Initial balance for non-interactive actors

## Vault Operations
- **Minting**: 
  - Actor WETH decreases by minted amount
  - Actor OETH increases by minted amount  
  - Vault WETH increases by minted amount
- **Redeeming**:
  - Actor WETH increases by redeemed amount
  - Actor OETH decreases by redeemed amount
  - Vault WETH decreases by redeemed amount
- **Rebase**:
  - Rebasing never decreases OETH balance for any actor
  - Total OETH after rebase matches yield generation

**Ghost Variables:**
- `MINT_TOLERANCE`: Allowance for rounding in mint operations
- `REDEEM_TOLERANCE`: Allowance for rounding in redeem operations
- `BALANCE_AFTER_REBASE_TOLERANCE`: Allowance for rebase calculations

## OETH Token
- **Transfers**: OETH transfers between actors execute without unexpected reverts
- **Opt In/Out**: Actors can opt in/out of rebasing without issues

## Improvement Suggestions
1. Add invariants for:
   - Maximum supply drift checks
   - Strategy allocation limits
   - Fee calculations accuracy
   - Price oracle integration

2. Consider additional ghost variables for:
   - Cumulative fees collected
   - Strategy-specific balances
   - Historical rebase metrics

The fuzzing suite provides good coverage of core vault mechanics but could be enhanced with more specific invariants around edge cases and complex interactions between multiple operations.