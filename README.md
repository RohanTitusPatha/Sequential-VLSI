# Sequential VLSI — Verilog

A growing collection of **Verilog HDL sequential circuit implementations and testbenches**, created while learning and practicing RTL design and VLSI fundamentals.

> 🚧 **Work in Progress:** This repository will be updated with more sequential Verilog designs and testbenches.

## Current Implementations

| Circuit | Design | Testbench | Description |
|---|---|---|---|
| Parameterized Counter | `counter.v` | `counter_tb.v` | Loadable counter with programmable count/repetition values |
| Universal Shift Register | `unv_shift_reg.v` | `unv_shift_reg_tb.v` | Parameterized hold, shift-right, shift-left and parallel-load register |

## Parameterized Counter

The counter uses parameter `N` to control the data width.

Inputs include:
- `q` — count value loaded into the counter
- `m` — repetition/count-control value
- `en` — loads `q` and `m`
- `rst_n` — active-low reset

## Universal Shift Register

The universal shift register is parameterized using `N` and supports four modes:

| Mode | Operation |
|---|---|
| `00` | Hold |
| `01` | Shift right |
| `10` | Shift left |
| `11` | Parallel load |

## Technologies

- Verilog HDL
- RTL Design
- Sequential Logic
- Parameterized Hardware
- Testbench Development
- Functional Simulation

## Author

**Rohan Titus**
