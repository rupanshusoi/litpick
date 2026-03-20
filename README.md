# litpick: A Stateful Paper Recommendation Agent

Litpick is a stateful paper recommendation agent with a singular goal: to help you become a better researcher. Litpick works best when you provide it tons of context about your research. Below I give instructions for how best to do so. Litpick accepts feedback about its recommendations and uses it to update state, meaning that it gets better overtime at predicting which papers you connect with. I have been using Litpick for the past several weeks, and it has several times cooked with a very relevant recommendation that I had little chance of finding otherwise.

# Features
- A hand-written `taste.md` to prime Litpick  with a philosophy for paper selection.
- A hand-written `state.md` to help it learn what you like.
- A mostly-hand-written `prompt.md` to teach the mechanics of literature search, how many papers to recommend each day, how to strike a good balance between old and new papers, etc.
- Opt-in integration with your research notes and Zotero library.

All Markdown files are easily editable to align with your workflow.

# Recommended Workflow

I run Litpick once every few days, but you can run it a higher frequency. When run, Litpick will add its recommendations to `recommendations.md`. Feel free to delete the papers you are not interested in. Litpick will take note of what you delete and what you keep. Give it feedback inline. E.g., "Feedback: I especially liked the CGO 2022 paper."

# Prerequisites

- Claude Code

# Quick start

Please read the customization section in full first.

## Running for the first time
- `./run.sh`. This runs Claude in interactive mode and with certain permissions. In particular, it can freely modify this directory, and search and fetch any web pages. Interactive mode lets you see what Claude is doing, and helps with forming a mental model of how to nudge it in the right direction. I recommend running interactively the first few times.
- Check `recommendations.md` at the end.

## Running regularly
You may prefer to run in headless mode. See `run.sh` for how to do this.

# Customization

Below I give two ways of providing context to Litpick. If you want to do neither, you may simply append some information about your research interests to `taste.md`. Running Litpick without providing any personal context will result in generic and unhelpful recommendations.

## Research notes (highly recommended)

At the top of `prompt.md`, add the path to your notes directory. Modify `run.sh` to give Claude read permissions on this directory.

## Add Zotero integration (recommended)

If you maintain a Zotero library, Litpick can customize recommendations based on what is present in the library and what you have recently added.

- Install [zotero-mcp](https://github.com/54yyyu/zotero-mcp) and make sure the `zotero-mcp` command is on your PATH (or note its full path)
- Copy `.mcp.json.example` to `.mcp.json` and update the `command` field if needed
- In `run.sh`, uncomment the Zotero `TOOLS+=( ... )` block

## Venues

`prompt.md` is customized for PL venues. Please update for your research area.

## Model

I recommend using the latest Opus (currently, Opus 4.6), but you may change this in `run.sh`.


