# Documentation

## Description

Here you can find the most comprehensive documentation regarding our VectorMotion projects.

## Workflow

We write documentation in **/Description.yaml files like `Mock-ups/Description.yaml` and then convert them to Markdown ones with our script `to-markdown {path/to/Description.yaml}`.

> We implemented JSON schema - `Project description schema.json` to let you easily document things. Just hover any YAML property in any existing documentation file and read what it does. Besides it we have snippets like `sce` (to make a scene explanation) to create YAML objects quicker.

When we need a new tool to automate something we use Nushell as a scripting language for that. No other language, please, we made this choice for us to write scripts quicker.
