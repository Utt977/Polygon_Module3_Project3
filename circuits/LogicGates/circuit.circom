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