This branch only change CompArith\lab03_Hierarchical_CLG\vlsi_flow\128-adder\sim and syn-saed32

CHANGES:

Adding new testbench .v file tb10000.v : This file will generate 10000 pair of data (A、B) randomly,and check out sum of each pair of data from 
                                          our own design and EDA's default adder.

Changing Makefile : Just change our top design from test_CLA.v to tb10000.v                                          
