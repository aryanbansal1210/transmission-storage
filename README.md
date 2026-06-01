# Power System Analysis - Transmission Power Flow with HVDC (MATPOWER)

**MSc Coursework (MECH70036, Energy Transmission & Storage) - Imperial College London (2025-26)**

A steady-state **power-flow study of an 11-bus, 3-phase transmission system** (4 generators, 4 transformers, 2 aggregated loads, 8 lines), built in **MATPOWER / MATLAB Live Script**. The study tests whether the network holds its voltage and reactive-power limits across six operating cases, then compares conventional AC reinforcement against **HVDC** options and reactive-power compensation.

> **My role:** group project; I did the coding (the MATPOWER case file and the power-flow analysis here). The full author list is in the report PDF.

---

## The engineering question

When demand grows on a transmission network, some buses drift outside their allowed voltage band (+/-5%) and generators hit their reactive-power limits. This study takes a Kundur-style 11-bus test system, pushes it with extra load, and asks: **what is the most effective and economical way to keep the network within limits** - more AC lines, an HVDC link, or targeted reactive compensation?

## The six cases

| # | Case | What it tests |
|---|---|---|
| 1 | **Base case** | Is the as-designed network within +/-5% bus voltage and generator Q-limits? |
| 2 | **+375 MW load at bus 7** (0.85 pf lagging) | Does a heavy-load scenario cause violations? |
| 3 | **Parallel AC lines** (7-8 and 8-9) | Does conventional AC reinforcement fix it? |
| 4 | **LCC-HVDC link** (7 to 9, 350 MW) | Line-commutated HVDC, with converter reactive demand modelled at both ends |
| 5 | **VSC-HVDC link** (7 to 9, 350 MW) | Voltage-source HVDC, with independent AC-voltage control and reactive support |
| 6 | **Optimal shunt compensation** | Which single bus needs the *minimum* reactive compensation (MVAr) to clear the violations? |

Each case is solved with MATPOWER's `runpf` under **enforced generator reactive-power limits**, and checked automatically for convergence, bus-voltage violations, Q-limit breaches and system losses. Brief commentary on each result is in the report.

## Why it is interesting

The case set is a compact tour of the real tools for managing a stressed grid: it directly contrasts **AC reinforcement vs LCC-HVDC vs VSC-HVDC**, and finds the least-cost reactive-compensation placement, which is exactly the kind of trade-off transmission planners face.

---

## Repository contents

| File | What it is |
|---|---|
| `case11bus.m` | MATPOWER case file - the 11-bus network (buses, generators, transformers, lines) on a 100 MVA base |
| `Group_04.mlx` | MATLAB Live Script - the power-flow analysis and results for all six cases |
| `Transmission_Storage_Report.pdf` | PDF of the Live Script (results plus commentary) |
| `Coursework_Brief.pdf` | The original coursework specification |

## Tech

`MATLAB` · `MATPOWER` (`runpf`, `mpoption` with `pf.enforce_q_lims`) · MATLAB Live Script.

## Running it

Requires **MATLAB** with **MATPOWER** on the path. Put `case11bus.m` on the path and run `Group_04.mlx`. If you do not have MATLAB, the committed PDF shows the full results for all six cases.

---

*Aryan Bansal - MSc Sustainable Energy Futures, Imperial College London · [LinkedIn](https://www.linkedin.com/in/aryanbansal1210)*
