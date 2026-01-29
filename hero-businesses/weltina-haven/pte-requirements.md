# Weltina's Haven Wildlife Preserve - PTE Requirements

**Focus:** Custom functionality requirements that extend Nimbus Core + Nimbus Exhibition

---

## PTE Applications Overview

Weltina's business requires **3 PTE applications** that extend the AppSource foundation:

1. **Advanced Creature Care Protocols PTE** (Object Range: 56,000-56,799)
2. **Patron Auction Management PTE** (Object Range: 57,000-57,799)
3. **Multi-Habitat Management PTE** (Object Range: 58,000-58,799)

---

## PTE 1: Advanced Creature Care Protocols

**Object Range:** 56,000-56,799
**Dependencies:** Nimbus Core Foundation, Nimbus Exhibition

### Business Requirements

**Problem Statement:**
Standard BC/Nimbus Exhibition inventory and resource management doesn't support:
- Living inventory that has health, behavior, lifecycle, and reproductive states
- Species-specific care requirements that change with age and condition
- Behavioral monitoring as a proxy for health and welfare assessment
- Breeding program management with genetic diversity tracking
- Species interaction compatibility for safe enclosure planning
- Veterinary care scheduling integrated with individual creature medical history

**Solution:**
A living inventory management system that treats creatures as dynamic entities with health, behavior, lifecycle, and relationship data rather than static inventory items

---

### Functional Requirements

#### Living Inventory Tracking
**Extends:** Nimbus Exhibition participant/resource tracking

**Features:**
- Individual creature profiles with species, origin, provenance, and acquisition method
- Lifecycle stage tracking: egg/juvenile/adolescent/adult/elderly with stage-specific care requirements
- Health status monitoring: current condition, chronic conditions, injury history, vaccination/treatment history
- Behavioral status: stress indicators, social behavior, enrichment response, temperament classification
- Reproductive status: breeding eligibility, mating history, gestation tracking, offspring records
- Feeding records: dietary requirements per species and individual, consumption tracking, special dietary needs

**BC Integration:**
- Custom creature profile tables replacing standard inventory items
- Health and behavioral log tables
- Integration with Nimbus Exhibition scheduling for care staff assignments

---

#### Species Management
**Extends:** Item category and classification

**Features:**
- Species profile database: habitat requirements, dietary needs, social behavior, known health risks
- Climate and environmental requirements per species (temperature range, humidity, light cycle, terrain type)
- Species interaction compatibility matrix (which species can share enclosures safely)
- Endangered status tracking and conservation priority classification
- Breeding compatibility and genetic diversity monitoring
- Growth stage definitions and expected timelines per species

**BC Integration:**
- Custom species profile tables (analogous to item categories but for living creatures)
- Compatibility matrix tables
- Integration with habitat management for enclosure assignment

---

#### Veterinary Care Management
**Extends:** Service scheduling and project management

**Features:**
- Scheduled examination calendar per creature (frequency based on species and health status)
- Treatment recording: diagnosis, treatment plan, medications, follow-up requirements
- Medical clearance workflows for breeding, visitor interaction, and transport eligibility
- Cumulative health risk assessment (pattern detection across injury/illness history)
- Medication inventory tracking and prescription management
- Specialist referral management (some species require specialized magical healers)

**BC Integration:**
- Custom medical record and treatment tables
- Approval workflows for medical clearances
- Integration with care scheduling and staff assignment

---

### Technical Requirements

**New Tables:**
- Creature Profile (individual creature master data)
- Species Profile (species-level reference data)
- Creature Health Log (health observations and measurements)
- Creature Behavioral Log (behavioral observations and assessments)
- Veterinary Record (examinations, diagnoses, treatments)
- Breeding Record (mating events, gestation, offspring)
- Species Compatibility Matrix (interaction safety ratings)
- Feeding Record (dietary tracking per creature)

**Table Extensions:**
- Resource (Nimbus Exhibition): Add creature profile reference for scheduling
- City (Nimbus Core): Add creature sourcing region data

**New Pages:**
- Creature Profile Card (comprehensive individual creature view)
- Creature List (all creatures with status filters)
- Species Profile Setup (species-level reference data management)
- Health Monitoring Dashboard (population-level health overview)
- Veterinary Workspace (examination and treatment management)
- Breeding Program Management (mating plans, gestation tracking, offspring)
- Species Compatibility Setup (interaction safety matrix)

**New Codeunits:**
- Creature Lifecycle Engine (manage stage transitions and age-based care changes)
- Health Risk Assessor (detect patterns in health history)
- Breeding Compatibility Calculator (genetic diversity and mating pair recommendations)
- Species Compatibility Validator (check enclosure assignments for safety)

---

## PTE 2: Patron Auction Management

**Object Range:** 57,000-57,799
**Dependencies:** Nimbus Core Foundation, Nimbus Exhibition, Advanced Creature Care Protocols PTE

### Business Requirements

**Problem Statement:**
Standard sales and event management doesn't support:
- Ethical harvesting auction workflows with sustainability certification
- Multi-tier patron funding with impact reporting and recognition tiers
- Component provenance tracking from individual creature through to end buyer
- Sustainability quota enforcement that prevents over-harvesting
- Auction mechanics for rare magical components with competitive bidding

**Solution:**
Integrated patron funding and auction management platform with ethical constraints, provenance tracking, and sustainability enforcement

---

### Functional Requirements

#### Patron Funding Management
**Extends:** Nimbus Exhibition CRM and financial management

**Features:**
- Multi-tier patronage levels with defined benefits and recognition
- Pledge and installment payment tracking
- Named conservation program sponsorship (patron sponsors specific species or habitat)
- Impact reporting generation: what the patron's funding achieved (species saved, creatures cared for, educational programs funded)
- Patron event management (exclusive tours, research briefings, annual gatherings)
- Renewal management and patron lifecycle tracking
- Cross-realm patron coordination (patrons from Goldentarn, Nimbuspire, noble families across kingdoms)

**BC Integration:**
- Custom patron and pledge tables
- Integration with financial posting for pledge recognition
- CRM extension for patron engagement tracking

---

#### Auction Management
**Extends:** Sales order management

**Features:**
- Auction lot creation from harvested component inventory
- Provenance documentation attachment (species, creature, collection date, method, sustainability certification)
- Bidder registration and qualification (verify legitimate buyers, not charlatans)
- Auction execution: opening bids, increments, time limits, reserve prices
- Settlement processing: payment, component transfer, provenance documentation to buyer
- Standing order management for institutional buyers (regular supply contracts outside auction)
- Partnership integration with Delyra's Art of Facts for authentication stamps on premium lots

**BC Integration:**
- Custom auction and lot tables
- Integration with sales order processing for settlement
- Provenance document management

---

#### Sustainability Enforcement
**Extends:** Inventory management and quota tracking

**Features:**
- Per-species, per-period harvesting quota definition
- Real-time quota tracking during harvesting operations
- Hard limits preventing harvesting beyond sustainable levels
- Quota adjustment workflows based on population health data (from Creature Care PTE)
- Sustainability certification generation for each harvested batch
- Compliance reporting for patrons, regulators, and institutional stakeholders
- Historical quota vs. actual tracking for trend analysis

**BC Integration:**
- Custom quota and compliance tables
- Integration with creature health data for quota adjustment
- Automated limit enforcement during harvesting entry

---

### Technical Requirements

**New Tables:**
- Patron Profile (patron master data with tier, history, preferences)
- Patronage Pledge (funding commitments with payment terms)
- Conservation Sponsorship (named programs linked to patrons)
- Impact Report (generated reports linking funding to outcomes)
- Auction Event (auction sessions with dates, rules, lots)
- Auction Lot (individual lots with provenance and reserve pricing)
- Auction Bid (bid history per lot)
- Harvesting Quota (per-species, per-period sustainability limits)
- Harvesting Log (actual harvesting records against quotas)
- Component Provenance (chain of custody from creature to buyer)

**Table Extensions:**
- Sales Order: Add auction reference, provenance documentation
- Creature Profile (Creature Care PTE): Add harvesting history, sustainability status

**New Pages:**
- Patron Management Dashboard (patron overview, engagement, renewal status)
- Patronage Program Setup (tier definitions, benefits, recognition rules)
- Auction Planning Workspace (create events, define lots, set reserves)
- Auction Execution Console (real-time bidding management)
- Sustainability Quota Management (define and monitor harvesting limits)
- Component Provenance Viewer (trace component from creature to buyer)
- Impact Report Generator (create patron-facing conservation impact reports)

**New Codeunits:**
- Patron Impact Calculator (aggregate conservation outcomes per patron's funding)
- Auction Settlement Processor (handle payment, transfer, and documentation)
- Sustainability Quota Enforcer (validate harvesting against limits)
- Provenance Chain Builder (assemble full provenance documentation)

---

## PTE 3: Multi-Habitat Management

**Object Range:** 58,000-58,799
**Dependencies:** Nimbus Core Foundation, Nimbus Exhibition, Advanced Creature Care Protocols PTE

### Business Requirements

**Problem Statement:**
Standard facility management doesn't support:
- Climate-controlled habitat management with species-specific environmental requirements
- Educational program scheduling integrated with creature availability and habitat access
- Warden guild territory assignment and field operation coordination
- Research expedition management with academic partnership tracking
- Cross-regional creature sourcing optimization based on population data and sustainability

**Solution:**
Integrated habitat, education, Warden, and research coordination platform

---

### Functional Requirements

#### Habitat Environmental Management
**Extends:** Nimbus Exhibition facility management

**Features:**
- Habitat profile definitions: climate zone, temperature range, humidity, lighting, terrain type, size
- Environmental monitoring integration: track actual vs. required conditions per habitat
- Creature-to-habitat assignment with species compatibility validation (from Creature Care PTE)
- Capacity management: maximum creatures per habitat based on species space requirements
- Maintenance scheduling: cleaning, terrain renewal, environmental equipment servicing
- Seasonal adjustment management (some habitats need different conditions by season)

**BC Integration:**
- Custom habitat profile and monitoring tables
- Integration with Creature Care PTE for assignment validation
- Facility maintenance scheduling

---

#### Educational Program Integration
**Extends:** Nimbus Exhibition event and program management

**Features:**
- Program scheduling coordinated with creature availability (breeding, health, stress status)
- Habitat access scheduling for visitor groups with capacity limits per habitat
- Age-appropriate content tagging and program template management
- Multi-institutional partnership tracking: contract terms, curriculum alignment, delivery schedules
- Visitor safety protocol management per habitat type
- Educational impact measurement: pre/post assessments, behavioral change tracking
- Research collaboration coordination: project tracking, publication management, data sharing agreements

**BC Integration:**
- Custom educational program and partnership tables
- Integration with creature status data for availability
- Event scheduling with habitat capacity constraints

---

#### Warden Guild Coordination
**Extends:** Nimbus Core guild management + Nimbus Exhibition service project management

**Features:**
- Territory assignment: geographic regions assigned to Warden teams with species expertise matching
- Mission management: assignment, briefing, field reporting, debrief, performance assessment
- Contract management: collection contracts with sustainability quotas, compensation terms, compliance requirements
- Performance tracking: mission success rates, safety record, ethical compliance scores
- Equipment management: field equipment assignment, maintenance, replacement
- Cross-regional coordination: optimizing Warden deployment based on seasonal creature availability

**BC Integration:**
- Custom Warden territory and mission tables
- Integration with guild management from Nimbus Core
- Service project management for missions

---

### Technical Requirements

**New Tables:**
- Habitat Profile (environmental requirements and configuration)
- Habitat Condition Log (environmental monitoring records)
- Habitat Creature Assignment (creature-to-habitat mapping with dates)
- Educational Program Template (curriculum content with age/institution targeting)
- Educational Partnership (institutional agreements with terms and schedules)
- Educational Session (scheduled program delivery instances)
- Warden Territory (geographic assignments with species expertise)
- Warden Mission (field operation records)
- Warden Performance Record (mission outcomes and compliance scores)
- Research Project (academic collaboration tracking)

**Table Extensions:**
- Creature Profile (Creature Care PTE): Add current habitat assignment, educational interaction eligibility
- City (Nimbus Core): Add educational institution details, Warden territory region data
- Guild Member (Nimbus Core): Add Warden-specific fields (territory, species expertise, safety certifications)

**New Pages:**
- Habitat Management Dashboard (all habitats with condition status and occupancy)
- Habitat Configuration Setup (define environmental requirements per habitat)
- Educational Program Planner (design and schedule programs with creature availability)
- Partnership Management (institutional partnership tracking)
- Warden Operations Center (territory overview, active missions, deployment status)
- Warden Mission Management (mission planning, execution tracking, debrief)
- Research Project Tracker (collaboration status, milestones, publications)

**New Codeunits:**
- Habitat Assignment Validator (check species compatibility and capacity before assignment)
- Educational Availability Engine (determine which creatures are available for programs based on health/stress/breeding status)
- Warden Deployment Optimizer (suggest Warden assignments based on expertise, location, and mission requirements)
- Mission Compliance Checker (validate mission outcomes against sustainability quotas and ethical standards)

---

## Cross-PTE Integration

### Creature Care + Patron Auction
- Creature health data informs harvesting sustainability quotas
- Harvesting history feeds back into creature health monitoring
- Patron-sponsored creatures have visibility restrictions on harvesting (patron may object)
- Conservation outcomes from creature care populate patron impact reports

### Creature Care + Multi-Habitat
- Species profiles drive habitat environmental requirements
- Creature health status affects educational interaction eligibility
- Breeding status influences habitat assignment (breeding pairs may need isolation)
- Lifecycle stage changes may require habitat transfers

### Patron Auction + Multi-Habitat
- Educational program participation data enriches patron impact reports
- Patron events coordinated with habitat access scheduling
- Research findings from Multi-Habitat partnerships inform auction component descriptions
- Warden mission data provides provenance context for auctioned components

---

## PTE Development Priority

**Phase 1: Foundation**
1. Advanced Creature Care Protocols (can't operate preserve without creature management)
2. Multi-Habitat Management (habitats and Warden operations are core daily operations)

**Phase 2: Revenue & Engagement**
3. Patron Auction Management (funding model and component sales)

---

## AppSource Foundation Requirements

**Nimbus Core Must Provide:**
- City registry with educational institution data and Warden territory regions
- Guild coordination for Warden guild management and certification
- Inter-realm communication protocols for field Warden coordination
- Cultural commerce rules for adapting educational programs to different city customs

**Nimbus Exhibition Must Provide:**
- Event and program management framework
- Registration and participant tracking for visitors and educational enrollees
- Facility and resource scheduling for habitats and care staff
- Service project management for Warden missions and research expeditions
- CRM foundation for patron, institutional, and buyer relationships

---

*This document defines the custom PTE functionality required to support Weltina's unique conservation, education, and ethical harvesting operations beyond standard BC/AppSource capabilities.*
