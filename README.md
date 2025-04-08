# Requirements-Based Testing Workflow Example
# Integrate AI Model into Simulink for Battery State of Charge Estimation

## READ THIS FIRST

This repository is no longer maintained. For a newer version of the example, please visit [the example in MathWorks Documentation]([https://www.mathworks.com/help/slcoverage/ug/resolve-missing-coverage-rbt-example.html](https://www.mathworks.com/help/deeplearning/ug/integrate-ai-network-into-simulink-for-battery-state-of-charge-estimation.html))


## Overview
This example workflow shows users how to get started with systematic, requirements-based testing using Simulink Verification and Validation products.

## Agenda

In Part 1, users will learn how to:

- create a test harness
- create a temporal assessment to define pass/fail criteria
- create a test case using the harness and the assessment
- link the test case to the requirement
execute the created test case to determine whether the test passed

In Part 2, users will learn how to:

- execute a test suite using Simulink® Test™
- measure model test coverage
- generate tests to analyze missing test coverage
- resolve missing test coverage
- ensure test coverage is based on the requirements

## Special Instructions
Created with R2022a

## Contact
Pat Canny

## Relevant Industries
Automotive
AeroDef
Technical Services
Medical Devices
IAM
Transport/Rail

## Relevant Products
Requirements Toolbox
Simulink Test
Simulink Coverage
Simulink Design Verifier

# Integrate Deep Neural Network into Simulink® for Battery State of Charge (SOC) Estimation

This example shows how to integrate a trained deep neural network into Simulink® for battery State of Charge (SOC) estimation. SOC is the level of charge of an electric battery relative to its capacity, measured as a percentage.

> **Note**: This example is part of a series of examples that demonstrate a battery SOC estimation workflow. You can run each step independently or work through the steps in order. This example follows the **Test Deep Learning Network for Battery State of Charge Estimation** example. For more information about the full workflow, see [Battery State of Charge Estimation Using Deep Learning](https://www.mathworks.com/help/deeplearning/ug/battery-state-of-charge-estimation-using-deep-learning.html).

---

## Load Trained Network

If you have run the previous steps, then the example uses the network that you trained. Otherwise, the example loads a network trained as in [Train Deep Learning Network for Battery State of Charge Estimation](https://www.mathworks.com/help/deeplearning/ug/train-deep-learning-network-for-battery-state-of-charge-estimation.html) and compressed in [Compress Deep Learning Network for Battery State of Charge Estimation](https://www.mathworks.com/help/deeplearning/ug/compress-deep-learning-network-for-battery-state-of-charge-estimation.html).

```matlab
if ~exist("recurrentNet","var")
    load("pretrainedBSOCNetworkCompressed.mat")
end
*Copyright 2022 The MathWorks, Inc.*
