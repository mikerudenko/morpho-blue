

## Merging my template with Recon

1. move code Tester.t.sol -> CryticTester.sol
    - Remove `TargetFunctions`
    - inherit from `Invariants, Setup`, don't forget IMPORT this contracts
2. update Setup.sol
    - add inheritance from `BaseTest`,  don't forget IMPORT this contract
    - add `base` & `helpers` & `utils` & `mocks` & `hooks` folders in recon dir
3. add `Invariants.t.sol`, `invariants` folder from my template, `HandlerAggregator.t.sol`, `InvariantsSpec.t.sol`, invariants folder


## Some `forge` installation commands

- `forge install OpenZeppelin/openzeppelin-contracts --no-commit`