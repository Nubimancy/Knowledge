# Contributing to the Nubimancy Knowledge Repository

Thank you for your interest in contributing to the Nubimancy Knowledge Repository! This document provides guidelines to ensure our knowledge base remains consistent, high-quality, and useful across all our tools.

## Contribution Process

1. **Fork and Clone**: Fork this repository and clone it locally
2. **Branch**: Create a feature branch for your changes
3. **Update**: Make your additions or modifications following the guidelines below
4. **Test**: Validate any code or technical information
5. **Submit**: Create a pull request with a clear description of your changes

## Content Development Priority

The knowledge repository serves as the foundation for demo data generation. Follow this priority order to build systematically:

### Phase 1: Worldbuilding Foundation (START HERE)

Complete these files to establish the shared world context that all hero businesses depend on:

- [ ] [worldbuilding/cities.md](worldbuilding/cities.md) - Expand with economic profiles, trade specializations, 20+ realm locations
- [ ] [worldbuilding/guilds.md](worldbuilding/guilds.md) - Guild systems, certifications, cross-hero coordination
- [ ] [worldbuilding/cultures.md](worldbuilding/cultures.md) - Cultural commerce rules per city, business etiquette, trade customs
- [ ] [worldbuilding/geography.md](worldbuilding/geography.md) - Trade routes, travel times, geographic challenges, climate zones

**Success Criteria:** Complete understanding of the world where heroes operate their businesses.

---

### Phase 2: Complete ONE Hero Business (RECOMMENDED: Bran)

Choose Bran's Caravans for the first deep-dive (simplest business model - service-based logistics). Complete ALL files before moving to the next hero:

**Bran's Caravans of Fortune** - [hero-businesses/bran-caravans/](hero-businesses/bran-caravans/)

- [ ] business-overview.md - Vision, mission, services, value proposition
- [ ] business-organization.md - Staff, org structure, guilds, roles
- [ ] business-processes.md - Workflows, operations, pain points, solutions
- [ ] customers.md - Customer segments, relationships, BC customer data
- [ ] vendors.md - Vendor partnerships, procurement, BC vendor data
- [ ] items.md - Service catalog, pricing, BC item data
- [ ] locations.md - Warehouses, meetup points, facilities, BC location data
- [ ] chart-of-accounts.md - G/L structure specific to logistics business
- [ ] posting-groups.md - Posting group setup for Bran's business
- [ ] pte-requirements.md - Custom functionality beyond AppSource (already detailed)

**Success Criteria:** Complete business context enabling demo data generation for Bran's 3 PTEs.

**Why Bran First?**
- Service-based business (simpler than inventory/manufacturing)
- Clear geographic and route-planning concepts
- Foundation for Thorin (similar logistics elements)
- Well-defined PTE requirements already documented

---

### Phase 3: Remaining Hero Businesses

After validating the structure with Bran, replicate for:

**Rini's Pinnacle League** - [hero-businesses/rini-pinnacle-league/](hero-businesses/rini-pinnacle-league/)
- [ ] [Complete all 10 standard files]
- Focus: Multi-arena tournament management, environmental combat, fighter progression

**Weltina's Haven Wildlife Preserve** - [hero-businesses/weltina-haven/](hero-businesses/weltina-haven/)
- [ ] [Complete all 10 standard files]
- Focus: Living inventory (creatures), educational partnerships, ethical operations

**Delyra's Art of Facts** - [hero-businesses/delyra-art-of-facts/](hero-businesses/delyra-art-of-facts/)
- [ ] [Complete all 10 standard files]
- Focus: Multi-dimensional retail, temporal manufacturing, portal coordination

**Thorin's Port & Pour** - [hero-businesses/thorin-port-and-pour/](hero-businesses/thorin-port-and-pour/)
- [ ] [Complete all 10 standard files]
- Focus: Magical preservation, multi-modal distribution, brewery partnerships

**Success Criteria:** Complete business context for all 5 heroes enabling demo data generation for all 38 apps.

---

### Phase 4: Pattern Documentation

After completing multiple heroes, document discovered BC patterns:

**BC Patterns** - [bc-patterns/](bc-patterns/)

Potential pattern topics (create as patterns emerge):
- [ ] posting-group-patterns.md - Common structures across heroes
- [ ] multi-location-strategies.md - Location management by business type
- [ ] magical-commerce-gl.md - G/L account patterns for fantasy operations
- [ ] service-vs-inventory.md - Business model differences in BC setup
- [ ] cross-hero-integration.md - BC setup for collaborative businesses
- [ ] guild-management-patterns.md - Representing guilds in BC
- [ ] preservation-and-quality.md - Magical quality tracking patterns

**Success Criteria:** Reusable patterns that accelerate future hero development and educational content.

---

## Content Guidelines

### File Organization

Place new content in the appropriate folder:

- `/worldbuilding/` - Shared world context (cities, guilds, cultures, geography, heroes, characters)
- `/hero-businesses/` - Complete business documentation per hero (operations → BC data mapping)
- `/bc-patterns/` - Discovered patterns after analyzing hero businesses
- `/business-central/` - BC technical capabilities, roles, implementation practices
- `/industry-practices/` - Partner models, org structures, best practices
- `/teaching-framework/` - Educational goals, learning paths, tools
- `/shared-assets/` - Glossary, tags, metadata

### Metadata Requirements

All markdown files should include frontmatter metadata:

```markdown
---
title: "Descriptive Title"
tags: ["relevant", "search", "terms"]
summary: "A 1-2 sentence description of the document's purpose"
updated: YYYY-MM-DD
---
```

### File Naming

- Use kebab-case-for-filenames.md
- Be descriptive but concise
- Avoid special characters and spaces

### Markdown Best Practices

- Use heading levels appropriately (H1 for title only)
- Include a table of contents for longer documents
- Add alt text to all images
- Use code blocks with language identifiers
- Link to other repository documents using relative paths

### Technical Content

- Verify technical information before submitting
- Include version numbers where relevant
- Provide working examples for code snippets
- Consider backward compatibility

## Review Process

All contributions will be reviewed for:

1. Content accuracy
2. Adherence to formatting guidelines
3. Writing quality and clarity
4. Appropriate placement within the repository

## Questions?

If you have questions about contributing or need assistance, please open an issue in the repository with the "question" label.

Thank you for helping build our knowledge base!
