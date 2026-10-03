---
name: urantia-research
description: Accurate, well-cited research of the Urantia Papers with the urantia-papers MCP tools. Use for questions about the Urantia Papers (The Urantia Book), its teachings, beings, places, and concepts, or its parallels with the Bible.
---

You have the urantia-papers MCP tools. Use these patterns for accurate, well-cited answers.

These are defaults. If the user gives an explicit instruction that differs, such as a different citation style or no quotes, follow the user.

## Tool selection

- **A question in plain language:** `search.semantic` with `query`. It finds passages related in meaning, even without the same words.
- **A specific term or phrase:** `search.fulltext` with `query` and `type` (`and` by default, or `phrase`).
- **A known reference:** `paragraphs.context` with `ref` and `window`, so the answer sees the paragraphs around it. Use `paragraphs.get` for one paragraph only.
- **A whole paper:** `papers.get` with `paper_id` (0 is the Foreword, 1 to 196 are the papers). It returns reference, section, and plain text for every paragraph.
- **Structure:** `toc.get` for the Foreword, the 4 parts, and all 197 papers. `papers.sections` for the sections of one paper.
- **A being, place, or concept:** `entities.list` with `query`, then `entities.get` with `entity_id`, then `entities.paragraphs` with `entity_id`. An entity with `citationCount` 0 is a cross-reference: follow its `seeAlso`.
- **The Bible:** `bible.verse` for a verse, `bible.verse.urantia_parallels` for the nearest Urantia paragraphs, `bible.search.semantic` to search the Bible by meaning. Pass `include_bible_parallels` on a paragraph tool for the other direction. These are semantic neighbors, not a curated list.

## Research workflow

1. **Search:** run `search.semantic` on the user's question.
2. **Expand:** for each key result, call `paragraphs.context` with `window` 2 or 3.
3. **Cross-reference:** use the entity tools for named beings, places, and concepts.
4. **Answer:** combine the passages into a clear answer, with a reference for each quote.

## Citations

Cite every passage by its reference, `paper:section.paragraph`, as the tools return it in `standardReferenceId`. Quote the exact text from the tool result. Never quote from memory.

Examples:

- "Love is the desire to do good to others." (56:10.21)
- "God is love, but love is not God." (2:5.10)

## Facts

- 197 papers: the Foreword (paper 0) and papers 1 to 196, in 4 parts: I The Central and Superuniverses, II The Local Universe, III The History of Urantia, IV The Life and Teachings of Jesus.
- More than 14,500 paragraphs and more than 4,400 named entities.
- `search.semantic` returns a `similarity` score from 0 to 1. Both search tools take `paper_id` and `part_id` filters.
- Say "the Urantia Papers" for the text. "The Urantia Book" is the title of the 1955 published book.
