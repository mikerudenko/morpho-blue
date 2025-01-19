Collecting workspace information

# Opyn Options Protocol Invariants Analysis

Based on analyzing the test files and contract behavior, here are the key invariants and properties that should be verified through fuzzing and invariant testing:

## Vault Management

### State Invariants
- **Vault Cannot Be Double-Created**: A vault cannot be created more than once for the same owner address
- **Initial Vault State**: New vaults must initialize with:
  - collateral = 0
  - oTokens issued = 0
  - underlying = 0
  - owned = true

### Functional Invariants
- **Collateral Addition**: 
  - Collateral can only increase when explicitly added
  - Addition amount must match collateral balance change
  - Only ETH or specified ERC20 token can be used as collateral

- **Token Issuance**:
  - Issued oTokens must be <= maxOTokensIssuable based on collateral
  - Total supply must increase by exactly issued amount 
  - Vault oTokens issued must match user oToken balance

### Safety Invariants  
- **Collateralization Ratio**: Vaults must maintain 

collateral * collateralToStrikePrice >= strikePrice * oTokensIssued * minCollateralizationRatio

 unless being liquidated
- **Token Burn Safety**: Cannot burn more tokens than issued by vault
- **Collateral Removal Safety**: Cannot remove collateral that would make vault unsafe

## Exercise Windows

### Temporal Invariants
- **Exercise Timing**: Exercise only allowed during exercise window
- **Expiry State**: After expiry:
  - No new oTokens can be minted
  - Existing oTokens cannot be exercised
  - Vault collateral can be redeemed

### Exercise Mechanics
- **Exercise Amount**: Cannot exercise more oTokens than owned
- **Collateral Distribution**: Exercised collateral must be proportional to exercised oTokens
- **Underlying Requirements**: Must provide sufficient underlying tokens to exercise

## Liquidation

### Liquidation Conditions
- **Vault Safety**: Can only liquidate unsafe vaults
- **Liquidation Limits**: Cannot liquidate more than liquidationFactor * vault.collateral
- **Incentive Distribution**: Liquidator receives correct incentive amount from collateral

### Ghost Variables
- `_totalCollateral`: Track total collateral across all vaults
- `_totalOTokensIssued`: Track total oTokens issued
- `_vaultStates`: Map of vault states to verify state transitions

## Suggested Improvements

1. Add strict accounting invariants:
```solidity
// Total collateral equals sum of individual vault collateral
invariant totalCollateralBalance()
    _totalCollateral == sum(vault.collateral for all vaults)

// Total supply equals sum of issued tokens
invariant totalSupplyConsistency() 
    _totalOTokensIssued == sum(vault.oTokensIssued for all vaults)
```

2. Add temporal safety checks:
```solidity
// Cannot perform critical actions after expiry
invariant postExpiryRestrictions()
    hasExpired() =>
        !canMint() && !canExercise() && canRedeem()
```

3. Add vault state transition verification:
```solidity
// Track valid vault state changes
ghost mapping(address => VaultState) _vaultStates
hook SSTORE vault[key].state (uint newState) {
    assert validStateTransition(_vaultStates[key], newState)
    _vaultStates[key] = newState  
}
```

4. Add strict collateral accounting:
```solidity
// Track collateral movements 
ghost uint256 _collateralBalance
hook SSTORE collateral (uint256 amount) {
    assert amount <= _collateralBalance + msg.value
    _collateralBalance = amount
}
```

The existing tests cover many key properties but could be enhanced with more systematic invariant testing using modern fuzzing tools to verify these critical safety and correctness properties.