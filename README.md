## Polygon Advance Module 3 of Project 3

## Getting Started
Compile the LogicGate() circuit and verify it.

```
pragma circom 2.0.0;


template LogicGate () {  
   signal input a;  
   signal input b; 

   signal x;
   signal y;

   signal output Q;

   component andGate = AND();
   component orGate = OR();
   component notGate = NOT();

   // circuit logic
   andGate.a <== a;
   andGate.b <== b;

   notGate.in <== b;

   x <== andGate.out;
   y <== notGate.out;

   orGate.a <== x;
   orGate.b <== y;
   Q <== orGate.out;
}
template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

component main = LogicGate();
```
### Install
`npm i`

### Compile
`npx hardhat circom` 
This will generate the **out** file with circuit intermediaries and geneate the **MultiplierVerifier.sol** contract

### Prove and Deploy
`npx hardhat run scripts/deploy.ts`

`npx hardhat run scripts/deploy.ts --network mumbai`

This script does 4 things  
1. Deploys the MultiplierVerifier.sol contract
2. Generates a proof from circuit intermediaries with `generateProof()`
3. Generates calldata with `generateCallData()`
4. Calls `verifyProof()` on the verifier contract with calldata

With two commands you can compile a ZKP, generate a proof, deploy a verifier, and verify the proof 🎉

 ## Author

This project was developed by Uttam Kumar.

## License

This project is licensed under the MIT License.



