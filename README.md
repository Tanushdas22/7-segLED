
# 7-Segment Display Decoder and Counter in VHDL

This repository contains VHDL code for a 7-segment display decoder and a two-digit up counter implemented on an FPGA. The decoder takes a 4-bit binary input from switches (`sw`) and outputs the corresponding hexadecimal digit (0–F) on a 7-segment display. The counter counts up to 20 and loops back to 0.

## Project Overview

### Objective:
This project aims to design and implement a 7-segment display decoder that can display hexadecimal values (0–F) based on input binary values, and a two-digit up counter that counts from 0 to 20. The design includes different implementations of the decoder using both logic gates and conditional statements.

### Features:
- The decoder uses 4 switches as inputs to represent a 4-bit binary number.
- The output is displayed on a 7-segment display.
- A two-digit up counter is implemented, counting up to 20 and resetting back to 0.
- The common cathode logic ensures that either the first or second 7-segment display is selected for output.
- Supports hexadecimal digits (0 to F).

## Project Structure

### Files:
1. **seven_segments_decoder_1.vhdl**:
   - Implements the 7-segment decoder using conditional statements (`if-else`) to map the binary input to the 7-segment output.
   
2. **seven_segments_decoder_2.vhdl**:
   - Uses logic expressions to map the 4-bit binary input to the corresponding 7-segment display output.

3. **seven_segments_2digits.vhdl**:
   - Implements a two-digit up counter that counts from 0 to 20, with the corresponding values displayed on two 7-segment displays. The design includes clock dividers to control the counting speed and display updates.

### Input and Output:
- **Inputs (sw)**: 4-bit binary input represented by switches (sw3, sw2, sw1, sw0).
- **Clock (clk)**: Used for generating timing signals for the counter and display refresh.
- **Output (out_7seg)**: 7-bit output controlling the 7 segments of the display to represent a hexadecimal digit.
- **Common Cathode (CC)**: Controls which 7-segment display is active (0 for the first display, 1 for the second).

## Usage

1. **Simulation**:
   - You can use any VHDL simulator (like ModelSim) to simulate the behavior of the decoders and counter.
   - The simulation will demonstrate how the 7-segment display shows the corresponding digit based on the binary input, and how the counter increments up to 20.

2. **FPGA Implementation**:
   - Synthesize and deploy the VHDL code on an FPGA development board.
   - Assign the input switches (sw) to the board’s switches, and the output (out_7seg) to the 7-segment display. Use the clock signal (clk) to control the counting speed.

## Skills Demonstrated

- VHDL Programming
- FPGA Design and Implementation
- Digital Logic Design
- Simulation using tools like Vivado

## Future Improvements

- Expand the decoder to work with multiple 7-segment displays.
- Implement additional input error handling for undefined binary values.
- Add functionality to control multiple 7-segment displays using multiplexing.
