# Repository: Hardware Architectures in Cryptography (HAC)

## Overview

This repository contains the implementation of hardware architectures used in cryptography for a Master's in Information Security project. The focus of this project is on linear feedback shift registers (LFSR) and flip-flop components, crucial elements in cryptographic systems for generating pseudo-random sequences. The repository includes VHDL designs for these components and testbenches to verify their functionality.

## File Summary

The repository consists of several VHDL files that define the core components of the hardware architectures, including flip-flops and an LFSR. The files are organized as follows:

- `flip-flop.vhd`: Defines a D-type flip-flop component.
- `tflip-flop.vhd`: Provides a testbench for the D-type flip-flop.
- `tlfsr.vhd`: Contains an LFSR design and a corresponding testbench.

## Repository Structure

```
flip-flop.vhd
README.md
tflip-flop.vhd
tlfsr.vhd
```

## File Descriptions

### 1. `flip-flop.vhd`
This file defines the D-type flip-flop component in VHDL. It includes the entity declaration and the architecture that implements the flip-flop's behavior, including timing delays for resetting and clocking.

### 2. `README.md`
This file provides an overview of the repository and explains the purpose of the various components. The repository focuses on the design of hardware for cryptographic applications, specifically using flip-flops and LFSRs.

### 3. `tflip-flop.vhd`
This file contains the testbench for the D-type flip-flop. It instantiates the `Dflipflop` component and provides clock and reset stimulus to verify the flip-flop's behavior. The testbench includes two processes: one for generating the clock signal and one for applying reset stimulus.

### 4. `tlfsr.vhd`
This file defines a 3-bit LFSR in VHDL. It uses three `Dflipflop` components to create the shift register and a feedback path that computes the next state based on an XOR operation. A testbench is included to verify the LFSR's functionality with clock and reset signals.

## Usage Guidelines

This repository is intended for educational purposes and provides hardware designs for cryptographic systems. You can use these VHDL files to explore the architecture of flip-flops and LFSRs in the context of hardware design. To simulate and test these designs, you can use a VHDL simulator such as ModelSim or GHDL.

### Notes:
- This repository includes only the VHDL source code files. Binary files and other generated files are excluded.
- Files ignored by default `.gitignore` patterns are not included in the repository.
- The repository assumes basic knowledge of VHDL and hardware description languages.

## How to Use

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/hac.git
   ```

2. Navigate to the repository directory:
   ```bash
   cd hac
   ```

3. Simulate the VHDL files using a VHDL simulator. For example, using ModelSim:
   ```bash
   vcom flip-flop.vhd
   vcom tflip-flop.vhd
   vcom tlfsr.vhd
   vsim work.test_Dflipflop
   ```

4. For testbenches, run simulations to verify the functionality of the flip-flops and LFSR by checking the outputs generated during simulation.

## Contributing

Contributions are welcome! If you find any issues or would like to add enhancements, please submit a pull request. Before making changes, ensure that you follow proper hardware design practices and include appropriate testbenches.

## License

This project is open-source and released under the MIT License. See the LICENSE file for more details.
