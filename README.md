# litpick: A Stateful Paper Recommendation Agent

Litpick is a stateful paper recommendation agent with a singular goal: to help you become a better researcher. Litpick works best when you provide it tons of context about your research. Below I give instructions for how best to do so. Litpick accepts feedback about its recommendations and uses it to update state, meaning that it gets better overtime at predicting which papers you connect with. I have been using Litpick for the past several weeks, and it has several times cooked with a very relevant recommendation that I had little chance of finding otherwise (see the last section for an anecdote).

# Features
- A hand-written `taste.md` to prime Litpick  with a philosophy for paper selection.
- A hand-written `state.md` to help it learn what you like.
- A mostly-hand-written `prompt.md` to teach the mechanics of literature search, how many papers to recommend each day, how to strike a good balance between old and new papers, etc.
- Opt-in integration with your research notes and Zotero library.

The core of Litpick is just Markdown files, all of which are easily editable to align with your workflow.

# Prerequisites

- Claude Code

# Workflow

- Give Litpick personal context about your research interests. See the Customization section below for how to do this.
- Run Litpick when you want to find new papers to read. I generally do this 1-3 times a week.
- Litpick will add its recommendations to `recommendations.md` and update `state.md`.
- Keep the papers you like, delete the ones you don't like. Litpick will take note of this.
- After reading the papers, leave feedback inline in `recommendations.md`. E.g., "Feedback: I really liked the ISCA 2022 paper." 
- Optional: read `state.md` to see how Litpick is thinking about your research interests, which papers it is saving for the future, which citation trails it is following, etc.

## Running Litpick

### Running for the first time
- `./run.sh`. This runs Claude in interactive mode with the following permissions: read and write this directory, and search and fetch any web page. Interactive mode lets you see what Claude is doing, and helps with forming a mental model of how to nudge it in the right direction. I recommend running interactively the first few times.

### Running regularly
You may prefer to run in headless mode. See `run.sh` for how to do this.

# Customization

## Barebones
Append some information about your personal research interests to `taste.md`. Any recent papers that you liked? A style of paper that you connect with, things like that. This is the minimum you must do to get something out of Litpick. 

## Research notes (highly recommended)
At the top of `prompt.md`, add the path to your notes directory. Modify `run.sh` to give Claude read permissions on this directory.

## Zotero integration (recommended)

If you maintain a Zotero library, Litpick can customize recommendations based on what is present in the library and what you have recently added.

- Install [zotero-mcp](https://github.com/54yyyu/zotero-mcp) and make sure the `zotero-mcp` command is on your PATH (or note its full path)
- Copy `.mcp.json.example` to `.mcp.json` and update the `command` field if needed
- In `run.sh`, uncomment the Zotero `TOOLS+=( ... )` block

## Conferences / Journals / arXiV

`prompt.md` is customized for PL venues. Please update for your research area at the top of that file.

## Model

I recommend using the latest Claude Opus (currently, 4.6), but you may change this in `run.sh`.

# Success Story

Sometime ago I was thinking about computations other than GEMM for which Tensor Cores (as found on NVIDIA GPUs) may be used. I mentioned this in my research notes. The next day, Litpick cooked with an extremely interesting [paper from ISCA 2022](https://dl.acm.org/doi/10.1145/3470496.3527411) that considers a generalization of this problem from a computer architecture perspective. I do not read ISCA papers usually so it is highly unlikely I would have found this paper otherwise.


