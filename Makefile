PHONY: all
all:
	Rscript 01_load_data.R
	Rscript 02_methods.R
	Rscript 03_model.R
	Rscript 04_results.R