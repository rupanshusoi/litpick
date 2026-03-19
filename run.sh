#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

# This gives Claude permissions to read and write files in this directory, as
# well as search for and fetch any web pages.
TOOLS=(
    'Read(**)' 'Write(**)' 'Edit(**)'
    'Glob' 'Grep'
    'WebSearch' 'WebFetch'
)

# Uncomment and edit path to give read access to your research notes directory.
# TOOLS+=('Read(/path/to/your/notes/**)')

# Uncomment to enable Zotero integration (see README for how to enable Zotero MCP):
# TOOLS+=(
#     'mcp__zotero__zotero_get_recent'
#     'mcp__zotero__zotero_search_items'
#     'mcp__zotero__zotero_get_item_metadata'
#     'mcp__zotero__zotero_get_item_fulltext'
#     'mcp__zotero__zotero_get_collections'
#     'mcp__zotero__zotero_get_collection_items'
#     'mcp__zotero__zotero_advanced_search'
#     'mcp__zotero__zotero_semantic_search'
# )

# You may add -p to run in headless mode.
claude "$(cat prompt.md)" \
    --model claude-opus-4-6 \
    --allowedTools "${TOOLS[@]}"
