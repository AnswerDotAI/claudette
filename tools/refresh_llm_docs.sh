#!/bin/bash

echo "Refreshing LLM documentation files..."

echo "Generating API list documentation..."
pysym2md claudette --output_file nbs/apilist.txt

echo "Generating context files..."
llms_txt2ctx nbs/llms.txt > nbs/llms-ctx.txt
llms_txt2ctx nbs/llms.txt --optional True > nbs/llms-ctx-full.txt

echo "✅ Documentation refresh complete!"
