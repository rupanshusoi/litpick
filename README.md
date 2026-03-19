# litpick

Litpick is a paper recommendation agent. Litpick has a singular goal: help you become a better researcher. To obtain personalized and relevant recommendations, you must provide it tons of context. Below you will find instructions to give it access to your research notes and Zotero library. I recommend that you opt-in to at least one of the two. I have been using this workflow for the past several weeks. Whenever I am in the mood to read papers, I run Litpick.

# Features
- A hand-written `taste.md` to prime Litpick  with a philosophy for paper selection.
- A hand-written `state.md` to help it learn what you like.
- A mostly-hand-written `prompt.md` to teach the mechanics of literature search, how many papers to recommend each day, how to strike a good balance between old and new papers, etc.
- Opt-in integration with your research notes and Zotero library.

All Markdown files are easily editable to align with your workflow.

# Recommended Workflow

Litpick is meant to be run once a day (or once every few days), but you can run multiple times a day as well. When run, Litpick will add its recommendations to `recommendations.md`. Feel free to delete the papers you are not interested in. Litpick will take note of what you delete and what you keep. If Litpick cooks an especially good recommendation (something you would not have found yourself), give it inline feedback.

# Prerequisites

- Claude Code

# Quick start

Please read the customization section first.

## Running for the first time
- `./run.sh`. This runs Claude in interactive mode and with certain permissions. In particular, it can freely modify this directory, and search and fetch any web pages. Interactive mode lets you see what Claude is doing, and helps with forming a mental model of how to nudge it in the right direction. I recommend running interactively the first few times.
- Check `recommendations.md` at the end.

## Running regularly
You may prefer to run in headless mode. See `run.sh` for how to do this.

# Customization

Below I give two ways of providing context to Litpick. If you want to do neither, you may simply edit `taste.md` with your research interests. Running it without doing so will result in generic and unhelpful recommendations.

## Research notes (highly recommended)

At the top of `prompt.md`, add the path to your notes directory. Modify `run.sh` to give Claude read permissions on this directory.

## Add Zotero integration (highly recommended)

If you maintain a Zotero library, Litpick can customize recommendations based on what is present in the library and what you have recently added.

- Install [zotero-mcp](https://github.com/54yyyu/zotero-mcp) and make sure the `zotero-mcp` command is on your PATH (or note its full path)
- Copy `.mcp.json.example` to `.mcp.json` and update the `command` field if needed
- In `run.sh`, uncomment the Zotero `TOOLS+=( ... )` block

## Model

I recommend using the latest Opus (currently, Opus 4.6), but you may change this in `run.sh`.

## Venues

`prompt.md` is customized for PL venues. You may want to add or remove venues if you are not a PL researcher.

