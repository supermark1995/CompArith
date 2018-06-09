################################################################################
#
# Makefile @[vlsi_flow/acc/sim]
#
################################################################################

default: run


################################################################################
#
# environment setup
#
################################################################################

DESIGN_ROOT = $(abspath $(PWD)/..)

RTL_DIR = $(DESIGN_ROOT)/rtl



################################################################################
#
# Verilog compiler setup
#
################################################################################

VERILOG = vcs

DESIGN_INC_DIR +=

SIM_FLAGS = -q
INC_FLAGS += $(addprefix +incdir+, $(DESIGN_INC_DIR))   #why addprefix and what is +incdir+??
DEBUG_FLAGS = -I

VERILOG_FLAGS += -full64 +v2k $(INC_FLAGS) +libext+.v+ $(DEBUG_FLAGS) #how about +v2k?

vpath %.v $(RTL_DIR)

sim.exe: test_CSA.v adder_128bit_CSA.v CSA_128bit.v CSA_64bit.v CSA_32bit.v CSA_16bit.v CSA_8bit.v CSA_4bit.v CSA_2bit.v Full_Adder.v 
	$(VERILOG) $(VERILOG_FLAGS) -o $@ $^

#test.v adder_128bit.v CLA_64bit.v CLG_4bit.v CLA_16bit.v CLA_4bit.v Full_Adder.v  -- Hier CLA needs

################################################################################
#
# execute the simulation
#
################################################################################

SIM_OUTPUT_FILES += sim.out sim.vpd

$(SIM_OUTPUT_FILES): sim.exe
	./$^ -q > $@	#$@ means SIM_OUTPUT_FILES ,but there have sim.out and .vpd. Why choosing the first one? and -q means? what about '>' ?



################################################################################
#
# user interface
#
################################################################################

run: sim.out

clean:
	rm -f *.exe
	rm -rf csrc *.daidir DVEfiles
	rm -f ucli.key
	rm -f *.vpd
	rm -f sim.out
extra:
	@echo $(SIM_OUTPUT_FILES)



