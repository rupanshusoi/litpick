# litpick

Litpick is a paper recommendation agent. Litpick has a singular goal: help you become a better researcher. To obtain personalized and relevant recommendations, you must provide it tons of context. Below you will find instructions to give it access to your research notes and Zotero library. I recommend that you opt-in to at least one of the two. I have been using this workflow for the past several weeks. Whenever I am in the mood to read papers, I run Litpick.

# Features
- A hand-written `taste.md` to prime Litpick  with a philosophy for paper selection.
- A hand-written `state.md` to help it learn what you like.
- A mostly-hand-written `prompt.md` to teach the mechanics of literature search, how many papers to recommend each day, how to strike a good balance between old and new papers, etc.
- Opt-in integration with your research notes and Zotero library.

All Markdown files are easily editable to align with your workflow.

## Prerequisites

- Claude Code

## Quick start

Please read the customization section first.

### Running for the first time
The first run may encounter permission issues, so I recommend opening a new Claude Code session in this directory and telling it to follow `prompt.md`. It will prompt you for access to read files or search the web. Once it has access to all the tools it needs, you may run it via the bash script.

### Running regularly
- `./run.sh` (You may also set this up as a cron job.)
- Check `recommendations.md` for your recommendations. Leave feedback inline.

## Recommended Workflow

Litpick is meant to be run once a day (or once every few days), but you run multiple times a day as well.

Once recommendations are added to `recommendations.md`, feel free to delete the papers you are not interested in. Litpick will take note of what you delete and what you keep. If Litpick cooks an especially good recommendation (something you would not have found yourself), give it inline feedback.

## Customization

Below I give two ways of providing context to Litpick. If you want to do neither, you may simply edit `taste.md` with your research interests. Running it without doing so will result in generic and unhelpful recommendations.

### Research notes (highly recommended)

At the top of `prompt.md`, add the path to your notes directory.

### Add Zotero integration (highly recommended)

If you maintain a Zotero library, Litpick can customize recommendations based on what is present in the library and what you have recently added.

- Install [zotero-mcp](https://github.com/anthropics/zotero-mcp) and make sure the `zotero-mcp` command is on your PATH (or note its full path)
- Copy `.mcp.json.example` to `.mcp.json` and update the `command` field if needed
- In `run.sh`, uncomment the Zotero `TOOLS+=( ... )` block

### Model

I recommend using the latest Opus (currently, Opus 4.6), but you may change this in `run.sh`.

### Venues

`prompt.md` is customized for PL venues. You may want to add or remove venues if you are not a PL researcher.

### Additional domains

Claude is setup to have access to arXiV and Google Scholar. If you wish to give it access to more domains, you may modify `.claude/settings.local.json`.

