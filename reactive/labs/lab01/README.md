# Simulating a Supervisory Control and Data Acquisition (SCADA)

Given the following scenario:

There is a industrial plant and its controls comprising:

* machine: initially off
* cooler: initially off
* switch that turns on/off the machine
* a thermometer that measures the machine temperature -- has three temperature states: low, medium, and high

The images of these instruments and their setup are available at [assets](../assets/).

When machine is off the temperature is low. When machine is turned on, each ten seconds the thermometer goes from one temperature stage to a higher temperature stage (stopping in high).