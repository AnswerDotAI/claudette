#!/bin/bash

echo "Refreshing LLM documentation files..."

echo "Generating API list documentation..."
pysym2md claudette --output_file llm/apilist.txt > llm/apilist.txt

echo "Generating context files..."
llms_txt2ctx llm/llms.txt > llm/llms-ctx.txt
llms_txt2ctx llm/llms.txt --optional True > llm/llms-ctx-full.txt

echo "✅ Documentation refresh complete!"
