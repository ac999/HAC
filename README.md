# HAC
Hardware Architectures in Cryptography - Master's in Information Security

1. We consider an LFSR of degree m = 3 with flip-flops
FF2, FF1, FF0, and a feedback path. The internal state bits are
denoted by si and are shifted by one to the right with each clock tick. The rightmost
state bit is also the current output bit. The leftmost state bit is computed in the
feedback path, which is the XOR sum of some of the flip-flop values in the previous
clock period. Since the XOR is a linear operation, such circuits are called linear
feedback shift registers.
