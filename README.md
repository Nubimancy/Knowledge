# Nubimancy Knowledge Repository

## Purpose

This repository serves as the centralized knowledge base for the Nubimancy project - a creative and educational initiative titled "Nubimancy & The Heroes' Craft," which uses a whimsical fantasy setting to teach real-world digital cloud technologies.

The content here grounds and informs various tools used in our project:

- GitHub Copilot
- Copilot Notebooks
- Copilot Studio
- Azure AI Foundry

## Repository Structure

```
/knowledge/
├── business-central/       # Business Central capabilities, roles, and implementation practices
├── worldbuilding/          # Fantasy world elements: heroes, cities, organizations
├── industry-practices/     # Partner models, organizational structures, best practices
├── teaching-framework/     # Educational goals, learning paths, tool alignments
├── shared-assets/          # Glossary, tags, metadata for semantic search
```

## File Types & Purposes

| File Type | Purpose |
|-----------|---------|
| `.md`     | Primary content: explanations, walkthroughs, lore, logic |
| `.ipynb`  | Interactive examples, prompt engineering, Azure AI workflows |
| `.json`   | Structured data for tags, relationships, or semantic metadata |
| `.yaml`   | Configurations, glossary, ingestion metadata |

## Metadata Format

We use frontmatter in markdown files for better semantic search and grounding:

```markdown
---
title: "Title of the Document"
tags: ["tag1", "tag2", "tag3"]
summary: "A brief description of the document contents."
updated: 2025-07-19
---
```

## How This Repository Is Used

1. **Direct Reference**: GitHub Copilot and Notebooks directly reference this content
2. **Azure AI Ingestion**: Content is ingested into Azure Blob/AI Search for grounding
3. **Copilot Studio**: Connected via Azure AI Search for bot knowledge

## Contributing

See our [CONTRIBUTING.md](CONTRIBUTING.md) file for guidelines on how to help expand and improve this knowledge base.

## About Nubimancy

Nubimancy is a playful take on "cloud magic," derived from Latin *nubes* (cloud) + *-mancy* (magical practice). The project creates a fantasy world where legendary adventurers have retired and built businesses in a floating city governed by arcane wizards (The Aethernet Assembly), serving as a metaphor for Microsoft Cloud technologies and business practices.

For more information, visit [nubimancy.com](https://nubimancy.com).
