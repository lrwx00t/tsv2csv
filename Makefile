.PHONY: all clean

SWIFTC = swiftc
SRC = main.swift
OUTPUT = tsv2csv

all:
	$(SWIFTC) $(SRC) -o $(OUTPUT)

clean:
	rm -f $(OUTPUT)
