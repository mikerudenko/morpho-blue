Collecting workspace information

# Size Protocol Fuzzing & Invariant Analysis

## Risk Management & Accounting
- **Collateral Value Invariant:** The total value of collateral must always be greater than the required minimum collateral value based on debt positions
  - Uses accounting variables from `AccountingLibrary.sol` to track positions
  - Coverage shows 96.81% test coverage for accounting functions

- **Debt Ceiling Invariant:** Total protocol debt must not exceed configured debt ceilings
  - Tracked in `CapsLibrary.sol` with 93.33% test coverage
  - Tests market and per-user debt limits

## Liquidation Safety
- **Liquidation Ratio Invariant:** Positions can only be liquidated when their collateral ratio falls below the configured threshold
  - Verified across `Liquidate.sol`, `LiquidateWithReplacement.sol`, and `SelfLiquidate.sol`
  - All liquidation modules show 100% test coverage

- **Liquidation Pricing Invariant:** Liquidation prices must be fair and follow configured spreads
  - Uses oracle price feeds from `PriceFeed.sol` implementations
  - Price feed adapters show strong coverage (100% for core components)

## Market Operations 
- **Order Matching Invariant:** Credit limit and market orders must be matched at fair prices
  - Tested in `BuyCreditMarket.sol` and `SellCreditMarket.sol` with 100% coverage
  - Validates offer creation and matching logic

- **Rate Calculation Invariant:** Interest rates must be calculated correctly based on market conditions
  - Covered in `YieldCurveLibrary.sol` with 92.31% coverage
  - Uses explicit rounding with Solady's FixedPointMathLib

## Token Economics
- **Token Balance Invariant:** Sum of user token balances must equal total supply
  - Implemented in `NonTransferrableToken.sol` base with 94.74% coverage
  - Ensures accounting consistency for deposit tokens

## Ghost Variables
- `totalCollateral`: Tracks aggregate collateral value
- `totalDebt`: Tracks aggregate debt value
- `positionStates`: Maps addresses to their position states
- `marketPrices`: Records historical market clearing prices

## Improvement Suggestions
1. Add explicit invariants for:
   - Oracle freshness and validity checks
   - Market state transitions
   - Access control permissions

2. Increase test coverage for:
   - `Initialize.sol` (currently at 70.18%)
   - Deprecated token implementations
   - Price feed edge cases

3. Consider adding more ghost variables for:
   - Historical liquidation events
   - Market depth metrics
   - User interaction patterns

The protocol shows strong test coverage overall with most core components at or near 100% coverage. The invariant testing framework leverages both Echidna and Foundry's capabilities for comprehensive verification of critical properties.