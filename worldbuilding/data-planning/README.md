# Data Planning for Nubimancy Demo Project

## Purpose

This folder contains CSV structure templates for the master data required to build a comprehensive Business Central demo environment for the Nubimancy project. These files define the schema for data that will support the six hero businesses and their interconnected operations across the fantasy world.

## Agentic Content Generation Strategy

### The Challenge
Creating a realistic "mountain of data" for a multi-company BC demo environment could traditionally require:
- **Months of manual work** to hand-craft thousands of businesses, items, customers, vendors
- **Massive token costs** to AI-generate each individual record
- **Inconsistent quality** from repetitive manual data entry

### The Solution: Smart Template Multiplication

Instead of hand-crafting every record, we use **systematic template-based generation** leveraging the rich worldbuilding foundation already created:

#### 1. **Cultural Naming Pattern Extraction**
- Mine existing worldbuilding files (`kingdoms-and-politics.md`, `cities.md`, `economics-and-currency.md`, etc.) for thematic naming conventions
- Extract cultural themes per kingdom (dwarven = stone/forge/hall, elvish = leaf/grove/bloom, maritime = tide/harbor/strand)
- Build naming dictionaries for systematic generation

#### 2. **Template Multiplication Approach**
```
Base Templates (10-50 business types) 
× Cultural Variations (20 cities/kingdoms)
× Size Variations (small/medium/large)
× Quality Grades (poor/common/fine/masterwork)
= Thousands of Authentic Records
```

**Example:**
- **Inn Template** → Goldentarn Golden Rest Inn, Brasshollow Irongate Alehouse, Verdelune Moonleaf Lodge
- **Ale Template** → Thorin's Dwarven Stout, Elvish Moonberry Wine, Coastal Tide Ale

#### 3. **Selective Detail Levels**
- **High Detail (Hand-crafted):** Hero companies and their direct relationships (~1,000 records)
- **Medium Detail (Template + AI):** City background businesses using cultural patterns (~5,000 records) 
- **Low Detail (Systematic):** Fill-in businesses for scale demonstration

### Implementation Strategy

#### Phase 1: Extract Cultural Foundation
- **Agent Task:** Parse worldbuilding files for naming patterns, cultural themes, trade specializations
- **Output:** Cultural naming dictionaries, business type templates, item variation rules

#### Phase 2: Template Creation  
- **Agent Task:** Create systematic templates with placeholder tokens for cultural substitution
- **Output:** Business templates, item templates, relationship templates

#### Phase 3: Multiplication Scripts
- **Agent Task:** Build generation scripts that apply cultural patterns to templates
- **Output:** Thousands of culturally-authentic records following BC master data patterns

#### Phase 4: Validation & Refinement
- **Agent Task:** Verify generated data maintains worldbuilding consistency and BC functionality
- **Output:** Quality-assured master data ready for BC import

## CSV File Structure

### Core BC Master Data (Files 01-14)
Based on Jeremy's original Action Planning document requirements:

1. **01-kingdoms-countries.csv** - Geographic/political foundation
2. **02-chart-of-accounts.csv** - COA with entity usage grid  
3. **03-number-series.csv** - Series plans per company
4. **04-dimensions.csv** - Dimension codes & values per entity
5. **05-business-register.csv** - Master source of truth for all customers/vendors/banks
6. **06-customers-by-company.csv** - Customer assignments per hero company
7. **07-vendors-by-company.csv** - Vendor assignments per hero company  
8. **08-items.csv** - Inventory items with trade restrictions
9. **09-services.csv** - Service items with cultural requirements
10. **10-posting-groups.csv** - Gen Bus/Prod, VAT posting groups per company
11. **11-locations-by-company.csv** - Warehouse/location setups
12. **12-inventory-posting-setups.csv** - GL account assignments per location
13. **13-resources-by-company.csv** - Human/equipment resources 
14. **14-fixed-assets-by-company.csv** - Asset management per company

### Aethernet Assembly BC Extensions (Files 15-22)
Advanced BC extensions created by the wizard-advisors:

15. **15-cities.csv** - Enhanced city management with coordinates, trade specializations
16. **16-guilds.csv** - Professional guild system for cross-business workforce
17. **17-cultural-traditions.csv** - Cultural compliance engine for trade customs
18. **18-route-difficulty-levels.csv** - Route complexity and cost modeling
19. **19-route-headers.csv** - Advanced route planning system  
20. **20-route-segments.csv** - Route optimization with segment tracking
21. **21-warehouse-zones-by-location.csv** - Multi-zone warehouse management
22. **22-conservation-contexts.csv** - Ecological compliance for Weltina's operations

## Key Design Principles

### World Master Files + Business Tagging
- **Single source of truth** for all world data (businesses, items, locations)
- **Business assignment files** tag which hero companies use which world resources
- **Realistic interconnection** - businesses serve multiple hero companies where logical

### Cultural Authenticity Through Systematic Generation
- Every generated name, business, item follows established worldbuilding patterns
- Cultural restrictions, trade relationships, political standing all derived from worldbuilding rules
- **Authentic feel** without hand-crafting every detail

### BC-Ready Structure
- All CSV headers designed for direct BC import via configuration packages
- Posting groups, VAT codes, GL accounts structured for BC compliance
- Extension fields demonstrate advanced BC capabilities

## Agent Collaboration Points

### When Building Generation Scripts:
1. **Consult worldbuilding files** for cultural inspiration and naming patterns
2. **Follow established economics** (currency systems, trade routes, political relationships)
3. **Respect world constraints** (magic scarcity, travel times, cultural restrictions)
4. **Maintain hero business focus** - generated data should support the six companies' operations

### Expected Agent Deliverables:
- **Cultural extraction dictionaries** from worldbuilding files
- **Template generation scripts** that multiply base patterns
- **Data validation rules** ensuring worldbuilding consistency  
- **Import-ready CSV files** populated with authentic demo data

## Success Metrics

✅ **Volume:** Thousands of businesses, items, relationships without hand-crafting  
✅ **Authenticity:** Generated content feels consistent with established worldbuilding  
✅ **Functionality:** Data supports complex BC scenarios across all hero businesses  
✅ **Efficiency:** Generation completed in days/weeks, not months  
✅ **Quality:** Realistic business relationships and interconnected operations

---

*This systematic approach transforms the rich Nubimancy worldbuilding into comprehensive BC demo data through intelligent automation rather than manual labor.*