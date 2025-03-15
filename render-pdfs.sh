#!/bin/bash

quarto render README.md --to pdf
quarto render user-manual.md --to pdf
quarto render design-report.md --to pdf
