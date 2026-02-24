# Data Planning for Nubimancy Demo Project

## Purpose

This folder contains CSV structure templates for the master data required to build a comprehensive Business Central demo environment for the Nubimancy project. These files define the schema for data that will support the six hero businesses and their interconnected operations across the fantasy world.

Each CSV contains only a header row. Column names follow AL field Caption conventions with underscores replacing spaces (e.g., `Country_Region_Code` for the `Country/Region Code` field). Primary key Code fields are prefixed with the entity name (e.g., `City_Code` for `City.Code`). FlowFields and computed fields are omitted.

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

---

## CSV File Structure

### Core BC Master Data (Files 01-14)
Based on standard Business Central setup tables, shared across all six hero companies:

1. **01-kingdoms-countries.csv** - Geographic/political foundation (Country/Region)
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

### NimbusCoreFoundation — Shared World Infrastructure (Files 15-27)
Master data from the shared foundational extension used by all hero companies. These tables define the fantasy world's physical, cultural, and magical infrastructure.

15. **15-cities.csv** → `City` (Table 80001) — City master with coordinates, climate zones, trade specializations
16. **16-guilds.csv** → `Guild` (Table 80010) — Professional guild system for cross-business workforce
17. **17-cultural-traditions.csv** → `CulturalTradition` (Table 80022) — Cultural compliance engine for trade customs
18. **18-route-difficulty-levels.csv** → `RouteDifficulty` (Table 81001) — Route complexity and cost modeling
19. **19-route-headers.csv** → `RouteHeader` (Table 81010) — Supply route master records
20. **20-route-segments.csv** → `RouteSegment` / `RouteSegmentDetail` (Tables 81011, 50001) — Route optimization with detailed segment tracking including elevation, magical barriers, and customs data
21. **21-warehouse-zones-by-location.csv** → `WarehouseZone` (Table 81030) — Multi-zone warehouse management
22. **22-conservation-contexts.csv** → `ConservationContext` (Table 82031) — Ecological compliance contexts for Weltina's operations
23. **23-communication-protocols.csv** → `CommunicationProtocol` (Table 80052) — Inter-realm communication methods and costs
24. **24-culture-affinities.csv** → `CultureAffinity` (Table 80020) — Cultural alignment scores and business etiquette by city/realm
25. **25-guild-certifications.csv** → `GuildCertification` (Table 80012) — Certification types offered by guilds with training hour requirements
26. **26-lunar-cycles.csv** → `LunarCycle` (Table 80040) — Calendar reference data for Silvara and Coprus moon cycles
27. **27-lunar-events.csv** → `LunarEvent` (Table 80042) — Notable lunar events (eclipses, alignments) with business impact phases

### Nimbus Business Extensions (Files 28-30)
Master data for NimbusExhibition, NimbusManufacturing, and NimbusSupply — the Nimbus company's own BC extensions.

28. **28-facility-profiles.csv** → `FacilityProfile` (Table 82020) — Exhibition/event venue profiles with capacity and rates
29. **29-quality-checkpoints-nimbus.csv** → `QualityCheckpoint` (Table 83030) — Manufacturing quality checkpoint definitions
30. **30-retail-location-profiles.csv** → `RetailLocationProfile` (Table 83060) — Retail location demand patterns and inventory parameters

### Bran — Arcane Logistics & Route Planning (Files 31-40)
Master data for Bran's three extensions: ArcaneScrollProcessing, CaravanFestivalCoordination, and MysticalRoutePlanning.

31. **31-climate-zones.csv** → `ClimateZone` (Table 51000) — Climate zone definitions with temperature ranges, humidity, and magical interference levels for scroll preservation
32. **32-scroll-senders.csv** → `ScrollSender` (Table 51005) — Authenticated external parties who place orders via magical scroll
33. **33-scrying-service-providers.csv** → `ScryingServiceProvider` (Table 51003) — Magical inventory verification service providers with accuracy ratings
34. **34-preservation-requirements.csv** → `PreservationRequirement` (Table 51001) — Item-by-climate-zone preservation compatibility and degradation rates
35. **35-portal-services.csv** → `PortalService` (Table 50002) — Portal transportation services with weight limits, costs, and dimensional capabilities
36. **36-contested-route-locations.csv** → `ContestedRouteLocation` (Table 50025) — Locations disputed between two kingdoms affecting route passage
37. **37-dual-kingdom-permits.csv** → `DualKingdomPermit` (Table 50020) — Permits required to traverse contested territory between two realms
38. **38-caravan-squads.csv** → `CaravanSquad` (Table 50018) — Named caravan squads with captain assignments and base locations
39. **39-rush-pricing-tiers.csv** → `RushPricingTier` (Table 50022) — Rush delivery surcharge tiers with portal priority and safety check rules
40. **40-cultural-compliance-rules.csv** → `CulturalComplianceRule` (Table 52010) — Cultural and customs rules by realm/city for item categories

### Thorin — Dwarven Ale Distribution Network (Files 41-49)
Master data for Thorin's three extensions: CommunityEventOrchestration, DwarvenAleQualityTracking, and TavernNetworkRelationshipManagement.

41. **41-transport-modes.csv** → `TransportMode` (Table 64000) — Transport methods with cost-per-mile, speed, barrel capacity, and preservation capability
42. **42-ale-type-profiles.csv** → `AleTypeProfile` (Table 62013) — Ale varieties with brewing styles, shelf life, enchantment requirements, and lunar cycle dependencies
43. **43-preservation-compatibility-matrix.csv** → `PreservationCompatibilityMatrix` (Table 62014) — Compatibility ratings between ale types and enchantment preservation methods
44. **44-quality-checkpoints-thorin.csv** → `QualityCheckpoint` (Table 62015) — Quality checkpoint stages in Thorin's ale production and distribution pipeline
45. **45-brewery-sourcing-contracts.csv** → `BrewerySourcingContract` (Table 62019) — Master contracts with brewery vendors defining quality standards and volume commitments
46. **46-partnership-tiers.csv** → `PartnershipTier` (Table 63002) — Tavern partnership levels with barrel thresholds, benefits, and discount structures
47. **47-tavern-delivery-schedules.csv** → `TavernDeliverySchedule` (Table 63006) — Standing delivery schedules per tavern with frequency and ale type coverage
48. **48-limited-edition-allocations.csv** → `LimitedEditionAllocation` (Table 63008) — Limited run ale allocation pools with release dates and unit counts
49. **49-serving-best-practices.csv** → `ServingBestPractice` (Table 63012) — Per-ale-type serving standards including temperature, pour technique, and food pairings

### Delyra — Enchantment Services & Dimensional Commerce (Files 50-56)
Master data for Delyra's three extensions: EnchantmentRefreshServices, MultiplanarWorkCenters, and PortalShopManagement.

50. **50-enchantment-types.csv** → `EnchantmentType` (Table 60000) — Enchantment categories with lifespan, decay rates, refresh methods, and lunar alignment requirements
51. **51-refresh-process-templates.csv** → `RefreshProcessTemplate` (Table 60010) — Process templates for enchantment refresh workflows with rush capability settings
52. **52-volume-pricing-tiers.csv** → `VolumePricingTier` (Table 60015) — Bulk enchantment service pricing tiers by quantity range
53. **53-dimensional-work-centers.csv** → `DimensionalWorkCenter` (Table 59000) — Pocket dimension workshop locations with time acceleration ratios and safety parameters
54. **54-rare-material-vendors.csv** → `RareMaterialVendor` (Table 59009) — Vetted suppliers of rare magical materials with ethical sourcing certifications
55. **55-portal-gateways.csv** → `PortalGateway` (Table 61000) — Portal infrastructure nodes with capacity limits, maintenance schedules, and transfer costs
56. **56-shop-profiles.csv** → `ShopProfile` (Table 61006) — Portal shop configurations with cultural focus, manager assignments, and portal gateway links

### Rini — Combat Sports & Multi-Realm Broadcasting (Files 57-62)
Master data for Rini's three extensions: DimensionalTournamentBrackets, FighterProgressionAnalytics, and MultiRealmSportsBroadcasting.

57. **57-arena-profiles.csv** → `ArenaProfile` (Table 53000) — Combat arena master records with environmental risk ratings, capacity, and cultural combat rules
58. **58-tournament-seasons.csv** → `Season` (Table 53020) — Tournament season calendar with dates, status, and default bracket format
59. **59-tournament-templates.csv** → `TournamentTemplate` (Table 53010) — Tournament format templates with bracket type, participant limits, and arena requirements
60. **60-portal-mage-services.csv** → `PortalMageService` (Table 55020) — Portal transport mages available for spectator and fighter transit with capacity and rates
61. **61-loyalty-programs.csv** → `LoyaltyProgram` (Table 55012) — Fan loyalty programs by city/arena with tier thresholds and VIP access benefits
62. **62-hall-of-fame-entries.csv** → `HallofFameEntry` (Table 55032) — Historical hall of fame inductees with career statistics and display ordering

### Weltina — Magical Creature Conservation & Patronage (Files 63-73)
Master data for Weltina's three extensions: AdvancedCreatureCareProtocols, MultiHabitatManagement, and PatronAuctionManagement.

63. **63-species-profiles.csv** → `SpeciesProfile` (Table 56000) — Magical creature species master with habitat requirements, dietary needs, conservation status, and lunar sensitivities
64. **64-lifecycle-stage-definitions.csv** → `LifecycleStageDefinition` (Table 56001) — Per-species lifecycle stage definitions with care requirements and feeding schedules by age range
65. **65-species-compatibility-matrix.csv** → `SpeciesCompatibilityMatrix` (Table 56002) — Cross-species cohabitation compatibility ratings with diet and temperament factors
66. **66-habitat-profiles.csv** → `HabitatProfile` (Table 58000) — Enclosure/habitat master with climate controls, terrain type, and capacity measurements
67. **67-educational-program-templates.csv** → `EducationalProgramTemplate` (Table 58003) — Conservation education program templates with age group targeting and creature interaction requirements
68. **68-warden-territories.csv** → `WardenTerritory` (Table 58006) — Field territory zones assigned to wardens with terrain type, risk level, and species expertise requirements
69. **69-species-yield-profiles.csv** → `SpeciesYieldProfile` (Table 58013) — Sustainable yield component definitions per species with ethical harvesting guidelines and vet approval requirements
70. **70-emergency-response-protocols.csv** → `EmergencyResponseProtocol` (Table 58021) — Emergency response SLA definitions with escalation chains by incident type
71. **71-patronage-tiers.csv** → `PatronageTier` (Table 57000) — Conservation patronage membership tiers with funding thresholds and access benefits
72. **72-harvesting-quotas.csv** → `HarvestingQuota` (Table 57010) — Species component harvest quotas by period with conservation priority overrides
73. **73-migration-corridors.csv** → `MigrationCorridor` (Table 58032) — Seasonal migration corridors between territories affecting route planning

---

## Key Design Principles

### World Master Files + Business Tagging
- **Single source of truth** for all world data (businesses, items, locations)
- **Business assignment files** tag which hero companies use which world resources
- **Realistic interconnection** - businesses serve multiple hero companies where logical

### Column Naming Convention
- Primary key `Code` fields are prefixed with the entity name (e.g., `City_Code`, `Guild_Code`)
- Foreign key references use `{ReferencedTable}_Code` pattern (e.g., `City_Code` as FK)
- All other fields use Caption text with spaces replaced by underscores
- BC standard field names follow their Caption (e.g., `Country_Region_Code` for `Country/Region Code`)
- FlowFields and computed fields are omitted (populated at runtime by BC)

### Cultural Authenticity Through Systematic Generation
- Every generated name, business, item follows established worldbuilding patterns
- Cultural restrictions, trade relationships, political standing all derived from worldbuilding rules
- **Authentic feel** without hand-crafting every detail

### BC-Ready Structure
- All CSV headers designed for direct BC import via configuration packages
- Posting groups, VAT codes, GL accounts structured for BC compliance
- Extension fields demonstrate advanced BC capabilities

---

## Extension-to-CSV Mapping Reference

| Extension | AL Tables Used | CSV Files |
|-----------|---------------|-----------|
| NimbusCoreFoundation | City, Guild, CulturalTradition, CommunicationProtocol, CultureAffinity, GuildCertification, LunarCycle, LunarEvent | 15-17, 23-27 |
| NimbusSupply | RouteDifficulty, RouteHeader, RouteSegment, WarehouseZone | 18-21 |
| NimbusExhibition | FacilityProfile, ConservationContext | 22, 28 |
| NimbusManufacturing | QualityCheckpoint, RetailLocationProfile | 29-30 |
| BranArcaneScrollProcessing | ClimateZone, ScrollSender, ScryingServiceProvider, PreservationRequirement | 31-34 |
| BranMysticalRoutePlanning | PortalService, RouteSegmentDetail, ContestedRouteLocation, DualKingdomPermit, CaravanSquad, RushPricingTier | 20, 35-39 |
| BranCaravanFestivalCoordination | CulturalComplianceRule | 40 |
| ThorinCommunityEventOrchestration | TransportMode | 41 |
| ThorinDwarvenAleQualityTracking | AleTypeProfile, PreservationCompatibilityMatrix, QualityCheckpoint, BrewerySourcingContract | 42-45 |
| ThorinTavernNetworkRelationshipManagement | PartnershipTier, TavernDeliverySchedule, LimitedEditionAllocation, ServingBestPractice | 46-49 |
| DelyraEnchantmentRefreshServices | EnchantmentType, RefreshProcessTemplate, VolumePricingTier | 50-52 |
| DelyraMultiplanarWorkCenters | DimensionalWorkCenter, RareMaterialVendor | 53-54 |
| DelyraPortalShopManagement | PortalGateway, ShopProfile | 55-56 |
| RiniDimensionalTournamentBrackets | ArenaProfile, Season, TournamentTemplate | 57-59 |
| RiniMultiRealmSportsBroadcasting | PortalMageService, LoyaltyProgram, HallofFameEntry | 60-62 |
| WeltinaAdvancedCreatureCareProtocols | SpeciesProfile, LifecycleStageDefinition, SpeciesCompatibilityMatrix | 63-65 |
| WeltinaMultiHabitatManagement | HabitatProfile, EducationalProgramTemplate, WardenTerritory, SpeciesYieldProfile, EmergencyResponseProtocol, MigrationCorridor | 66-68, 69-70, 73 |
| WeltinaPatronAuctionManagement | PatronageTier, HarvestingQuota | 71-72 |

---

## Agent Collaboration Points

### When Building Generation Scripts:
1. **Consult worldbuilding files** for cultural inspiration and naming patterns
2. **Follow established economics** (currency systems, trade routes, political relationships)
3. **Respect world constraints** (magic scarcity, travel times, cultural restrictions)
4. **Maintain hero business focus** - generated data should support the six companies' operations
5. **Honour cross-extension dependencies** — e.g., ClimateZone data (31) feeds PreservationRequirement (34) which feeds AleTypeProfile (42) which feeds quality tracking

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
