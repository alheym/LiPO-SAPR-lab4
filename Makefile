CC     = gcc
CFLAGS = -g -std=c99

LN     = gcc
LNFLAGS=

RM     = rm -rf

VMEXE=ylavm
TESTEXE=tests

OBJ=\
yla_stack.o\
yla_compliance.o\
yla_word.o\
yla_vm.o

MAINOBJ=yla_vm_main.o

TESTOBJ=\
yla_tests.o\
yla_test_test.o\
yla_stack_test.o\
yla_test_gencode.o\
yla_vm_test1.o


.SUFFIXES: .o .c
.PHONY: clean test

$(VMEXE): $(OBJ) $(MAINOBJ)
	$(LN) -o $@ $(OBJ) $(MAINOBJ)

clean:
	$(RM) $(TESTOBJ) $(OBJ) $(MAINOBJ) $(TESTEXE) $(VMEXE)

test: $(TESTEXE)
	./$(TESTEXE)

$(TESTEXE): $(OBJ) $(TESTOBJ)
	$(LN) -o $@ $(OBJ) $(TESTOBJ)
