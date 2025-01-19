

# Immutable zkEVM Bridge Fuzzing Analysis

The project implements a token bridge between L1 (root) and L2 (child) chains with flow rate limiting and withdrawal queue mechanisms. Here's an analysis of the invariant categories and ghost variables needed:

## 1. Bridge Balance Invariants
These invariants ensure proper token accounting between L1 and L2.

### Key Invariants:
- Total supply on L2 must equal locked tokens on L1 bridge
- User balances across L1 + L2 must remain constant (conservation of tokens)
- Bridge contract WETH balance should always be 0 
- Bridge contract WIMX balance should always be 0
- Native ETH balance changes must match deposits/withdrawals
- Bridge gas fees must be accounted for correctly

### Ghost Variables:
- `totalL1Supply`: Track total token supply on L1
- `totalL2Supply`: Track total token supply on L2
- `userTotalBalance`: Track each user's combined L1+L2 balance
- `bridgeFees`: Track accumulated bridge fees

## 2. Flow Rate Control Invariants 
These verify the rate limiting mechanism works correctly.

### Key Invariants:
- Token bucket depth never exceeds capacity
- Withdrawal queue activation when bucket empty
- Bucket refill time updates after withdrawals
- Large transfers always added to queue
- Withdrawal delays respected

### Ghost Variables:
- `bucketState`: Track token bucket fill level
- `lastRefillTime`: Track last bucket refill timestamp
- `queuedWithdrawals`: Track pending withdrawals
- `withdrawalDelays`: Track withdrawal timeouts

## 3. Token Mapping Invariants
These ensure proper token registration and mapping between chains.

### Key Invariants:
- Cannot map same token twice
- Cannot map zero address
- Cannot map ETH/IMX tokens 
- Child token decimals match root token
- Token mappings are consistent between L1/L2

### Ghost Variables:
- `mappedTokens`: Track which tokens are mapped
- `tokenDecimals`: Track token decimal places
- `childToRoot`: Track child->root token mappings

## 4. Pause Mechanism Invariants
These verify pausing functionality works correctly.

### Key Invariants:
- All operations blocked when paused
- Only admin can pause/unpause
- Pause state consistent between L1/L2

### Ghost Variables:
- `isPaused`: Track pause state
- `lastPauseTime`: Track when pause occurred
- `pauseInitiator`: Track who initiated pause

## 5. Deposit/Withdrawal Invariants
These ensure proper token movement between chains.

### Key Invariants:
- Deposits increase L2 supply correctly 
- Withdrawals decrease L2 supply correctly
- IMX deposit limits respected
- Cross-chain messages sent correctly
- Native token wrapping/unwrapping works

### Ghost Variables:
- `pendingDeposits`: Track in-flight deposits
- `pendingWithdrawals`: Track in-flight withdrawals
- `depositLimits`: Track deposit caps
