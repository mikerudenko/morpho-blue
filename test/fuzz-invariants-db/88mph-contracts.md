Collecting workspace information

Filtering to most relevant information

Still building the workspace index, response may be less accurate.

# 88mph Project

## Vaults
- **Invariant 1:** Ensure that the total value locked (TVL) in the vault never decreases unexpectedly. This invariant is crucial to ensure that user funds are secure and that no unauthorized withdrawals or losses occur.
- **Invariant 2:** Verify that the interest accrued in the vault is correctly calculated and distributed. This ensures that users receive the correct amount of interest based on their deposits.
- **Ghost Variables:** 
  - `totalValueLocked`: Tracks the total value locked in the vault. Test by simulating deposits and withdrawals and verifying that the value remains consistent with expected outcomes.
  - `interestAccrued`: Tracks the interest accrued over time. Test by simulating time progression and interest calculations to ensure accuracy.

## Loans
- **Invariant 1:** Ensure that loans are only issued to eligible borrowers. This prevents unauthorized access to funds and maintains the integrity of the lending process.
- **Invariant 2:** Verify that loan repayments are correctly processed and reflected in the borrower's balance. This ensures that the repayment process is transparent and accurate.
- **Ghost Variables:** 
  - `eligibleBorrowers`: Tracks the list of borrowers eligible for loans. Test by verifying that only users meeting specific criteria are included in this list.
  - `loanRepayments`: Tracks the repayments made by borrowers. Test by simulating loan issuance and repayments to ensure that the repayments are correctly recorded.

## Interest Rates
- **Invariant 1:** Ensure that interest rates are updated correctly based on market conditions. This is important to maintain fair and competitive rates for users.
- **Invariant 2:** Verify that the interest rate changes do not negatively impact existing loans or deposits. This ensures that users are not adversely affected by rate fluctuations.
- **Ghost Variables:** 
  - `currentInterestRate`: Tracks the current interest rate. Test by simulating market condition changes and verifying that the interest rate updates correctly.
  - `historicalRates`: Tracks the historical interest rates. Test by ensuring that the historical data is accurately recorded and can be used for analysis.

## Improvement Suggestions
- **Vaults:** Consider adding an invariant to ensure that the vault's smart contract code is not altered without proper authorization. This can be achieved by tracking a `contractHash` ghost variable that stores the hash of the contract code.
- **Loans:** Add an invariant to verify that the collateral provided for loans is sufficient and correctly valued. Introduce a `collateralValue` ghost variable to track the value of collateral and test its accuracy.
- **Interest Rates:** Include an invariant to ensure that interest rate changes are communicated to users in a timely manner. This can be tested by tracking a `rateChangeNotifications` ghost variable that records when notifications are sent.

By organizing the invariants and ghost variables in this structured manner, you can ensure comprehensive testing and improve the robustness of the 88mph project.