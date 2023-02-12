GHDL = ghdl
FLAGS = "--std=08"
INPUT_NAME = adder
ENTITY_NAME = eight_bit_full_adder
TESTBENCH_INPUT_NAME = adder_tb
TESTBENCH_ENTITY_NAME = add8_tb

all:
	@$(GHDL) -a -fsynopsys $(FLAGS) $(INPUT_NAME).vhdl
	@$(GHDL) -a -fsynopsys $(FLAGS) add8.vhdl
	@$(GHDL) -a -fsynopsys $(FLAGS) $(TESTBENCH_INPUT_NAME).vhdl
	@$(GHDL) -e -fsynopsys $(FLAGS) $(TESTBENCH_ENTITY_NAME)
	@$(GHDL) -r -fsynopsys $(FLAGS) $(TESTBENCH_ENTITY_NAME) --stop-time=100us --wave=wave.ghw

wave:
	gtkwave wave.ghw
