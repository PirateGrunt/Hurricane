###################
# Example makefile
##################

# Key variables to define
RDIR = .
MERGE_OUT = MergeData.Rout

# Create list of R source files
RSOURCE = $(wildcard $(RDIR)/*.R)

# Files to indicate when the RSOURCE file was run
OUT_FILES = $(RSOURCE:.R=.Rout)

# Default target
all: $(OUT_FILES) 

# Run the RSOURCE files
$(RDIR)/%.Rout: $(RDIR)/%.R
    R CMD BATCH $<

# Remove Out Files
clean: 
    rm -fv $(OUT_FILES)

# Remove MergeData.Rout
cleanMerge:
    rm -fv $(MERGE_OUT)
        \end{verbatim}
    \end{kframe}
\end{knitrout}