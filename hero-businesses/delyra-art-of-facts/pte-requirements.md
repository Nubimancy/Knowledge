# Delyra's Art of Facts - PTE Requirements

**Focus:** Custom functionality requirements that extend Nimbus Core + Nimbus Manufacturing

---

## PTE Applications Overview

Delyra's business requires **3 PTE applications** that extend the AppSource foundation:

1. **Multi-planar Work Centers PTE** (Object Range: 59,000-59,799)
2. **Enchantment Refresh Services PTE** (Object Range: 60,000-60,799)
3. **Portal Shop Management PTE** (Object Range: 61,000-61,799)

---

## PTE 1: Multi-planar Work Centers

**Object Range:** 59,000-59,799
**Dependencies:** Nimbus Core Foundation, Nimbus Manufacturing

### Business Requirements

**Problem Statement:**
Standard BC/Nimbus Manufacturing work center management doesn't account for:
- Time-accelerated production in a pocket dimension (~1 day real time = ~1 week production time)
- Synchronizing temporal production schedules with real-world delivery commitments
- Cross-dimensional resource allocation (materials and staff moving between realities)
- Dimensional stability of items produced in accelerated time
- Temporal anchor management and dimensional safety protocols

**Solution:**
Custom work center management with temporal scheduling, cross-dimensional resource tracking, and reality-grounded quality assurance

---

### Functional Requirements

#### Time Stream Workshop Management
**Extends:** Nimbus Manufacturing work center scheduling

**Features:**
- Dual-timeline scheduling: map pocket dimension production time to real-world calendar
- Time acceleration ratio configuration per work center (not all areas of pocket dimension accelerate equally)
- Production capacity calculation accounting for temporal acceleration
- Work center status tracking: operational, maintenance, temporal recalibration, dimensional anchor check
- Staff rotation scheduling (workers can only spend limited time in accelerated dimension before needing rest in normal reality)

**BC Integration:**
- Extends work center tables with temporal metadata
- Custom scheduling logic for dual-timeline capacity planning
- Integration with production order scheduling

---

#### Cross-Dimensional Resource Allocation
**Extends:** Nimbus Manufacturing resource and material management

**Features:**
- Track material location across realities (normal storage vs. pocket dimension workshop)
- Dimensional transit logging: when materials cross dimensional boundaries
- Material stability tracking: how materials behave in accelerated time (some degrade faster, some stabilize)
- Staff dimensional assignment tracking: who is in which reality at any given time
- Equipment allocation across dimensional work centers

**BC Integration:**
- Extends item tracking with dimensional location
- Custom dimensional transit log tables
- Integration with BOM for material dimensional requirements

---

#### Reality-Grounded Quality Assurance
**Extends:** Nimbus Manufacturing quality control

**Features:**
- Dimensional stability testing: verify items created in accelerated time function in normal reality
- Cross-dimensional quality checkpoints during production process
- Temporal aging simulation: test how items will behave over time in normal reality
- Quality defect tracking with dimensional context (defect caused by acceleration? material instability?)
- Certification stamp generation with dimensional testing results

**BC Integration:**
- Custom quality testing tables with dimensional parameters
- Integration with production order for checkpoint tracking
- Certification generation linked to quality results

---

### Technical Requirements

**New Tables:**
- Dimensional Work Center (pocket dimension work center profiles with time ratios)
- Temporal Schedule (dual-timeline production schedule mapping)
- Dimensional Transit Log (material/staff movement between realities)
- Material Stability Record (how materials behave across dimensional boundaries)
- Dimensional Quality Test (cross-reality quality checkpoints and results)
- Temporal Anchor Status (dimensional safety monitoring records)

**Table Extensions:**
- Work Center (Nimbus Manufacturing): Add time acceleration ratio, dimensional status, safety check date
- Production Order: Add dimensional work center assignment, real-world delivery date vs. pocket dimension completion
- Item: Add dimensional stability rating, cross-reality testing requirement
- BOM Line: Add dimensional transit requirement for component materials

**New Pages:**
- Dimensional Work Center Management (configure and monitor pocket dimension workshops)
- Temporal Production Scheduler (plan production with dual-timeline visualization)
- Dimensional Transit Tracker (monitor material and staff movement between realities)
- Cross-Dimensional Quality Dashboard (quality testing status across all production)
- Temporal Anchor Monitor (dimensional safety status)

**New Codeunits:**
- Temporal Schedule Calculator (convert between pocket dimension time and real-world time)
- Dimensional Transit Manager (process and log cross-dimensional movements)
- Dimensional Quality Validator (execute cross-reality quality checks)
- Temporal Anchor Safety Monitor (check dimensional stability and trigger alerts)

---

## PTE 2: Enchantment Refresh Services

**Object Range:** 60,000-60,799
**Dependencies:** Nimbus Core Foundation, Nimbus Manufacturing, Multi-planar Work Centers PTE

### Business Requirements

**Problem Statement:**
Standard service management doesn't support:
- Complex multi-step magical process workflows with precise timing requirements
- Rare material tracking with dimensional stability and temporal decay monitoring
- Custom enchantment request processing with iterative client collaboration
- Enchantment effectiveness measurement and degradation tracking
- Service contract management for recurring refresh schedules

**Solution:**
Specialized service management for enchantment refresh and renewal with material tracking, degradation monitoring, and service contract automation

---

### Functional Requirements

#### Enchantment Refresh Workflow Management
**Extends:** Nimbus Manufacturing service and process management

**Features:**
- Multi-step refresh process template definitions (assessment → diagnosis → material prep → refresh → testing → certification)
- Step sequencing with timing constraints (some steps must happen within specific time windows)
- Refresh method selection based on enchantment type and degradation level
- Process status tracking with client notification at key milestones
- Rush processing workflow with expedited steps and premium pricing
- Re-enchantment workflow for items where refresh is insufficient (full re-do)

**BC Integration:**
- Custom refresh process and step tables
- Integration with production scheduling for workshop time allocation
- Client notification integration via Nimbus Core communication

---

#### Enchantment Degradation Tracking
**Extends:** Item and service management

**Features:**
- Enchantment type catalog with expected degradation curves
- Effectiveness measurement at time of refresh (how much has degraded since last service)
- Degradation rate prediction for scheduling future refreshes
- Alert generation when enchantments approach critical degradation thresholds
- Historical degradation data for improving enchantment longevity

**BC Integration:**
- Custom enchantment type and degradation measurement tables
- Integration with service contracts for scheduled refresh timing
- Alert system for approaching degradation thresholds

---

#### Rare Material Management
**Extends:** Nimbus Manufacturing inventory with dimensional context from Work Centers PTE

**Features:**
- Material potency tracking with expiration/decay dates
- Dimensional stability classification (stable, sensitive, volatile in dimensional transit)
- Source provenance tracking (supplier, region, harvest date, sustainability certification)
- Substitution management: alternative materials when primary is unavailable
- Material reservation for scheduled refresh commitments
- Integration with Weltina's Haven for ethically sourced components

**BC Integration:**
- Custom material potency and provenance tables
- Integration with purchase order management for sourcing
- Reservation system linked to service contracts

---

#### Service Contract Management
**Extends:** Sales and service management

**Features:**
- Refresh service contract creation at time of original sale or separately
- Contract terms: refresh frequency, pricing, priority level, material inclusion
- Automated scheduling of refresh appointments based on contract terms
- Contract renewal management with proactive outreach
- Contract profitability analysis (material costs vs. contract revenue)
- Bundled contracts for clients with multiple enchanted items

**BC Integration:**
- Custom service contract tables
- Integration with scheduling and material reservation
- Revenue recognition for contract payments

---

### Technical Requirements

**New Tables:**
- Refresh Process Template (multi-step workflow definitions)
- Refresh Process Step (individual steps with timing and sequencing)
- Refresh Order (specific client refresh request with process instance)
- Enchantment Type (catalog of enchantment types with degradation profiles)
- Degradation Measurement (effectiveness readings over time)
- Material Potency Record (potency tracking with decay dates)
- Material Provenance (source, harvest, certification chain)
- Refresh Service Contract (contract terms, schedules, pricing)

**Table Extensions:**
- Item (Nimbus Manufacturing): Add enchantment type reference, last refresh date, degradation status
- Sales Order: Add service contract reference, warranty registration
- Material (BOM): Add potency date, dimensional stability, provenance reference

**New Pages:**
- Refresh Order Workspace (manage active refresh orders through multi-step process)
- Enchantment Degradation Monitor (track degradation across all items in circulation)
- Material Potency Dashboard (monitor material freshness and availability)
- Service Contract Management (create, manage, and renew refresh contracts)
- Refresh Scheduling Calendar (upcoming scheduled refreshes with material readiness)

**New Codeunits:**
- Refresh Process Engine (advance refresh orders through templated steps)
- Degradation Predictor (forecast degradation and optimal refresh timing)
- Material Potency Monitor (check potency dates and trigger reorder/alert)
- Service Contract Scheduler (generate refresh appointments from contract terms)

---

## PTE 3: Portal Shop Management

**Object Range:** 61,000-61,799
**Dependencies:** Nimbus Core Foundation, Nimbus Manufacturing

### Business Requirements

**Problem Statement:**
Standard multi-location retail management doesn't support:
- Portal-connected shops where inventory can be physically transferred in minutes
- Customers browsing inventory across multiple dimensions/locations simultaneously
- Cross-dimensional inventory synchronization in real-time
- Portal gateway maintenance scheduling and stability monitoring
- Delivery and pickup coordination through portal network

**Solution:**
Multi-dimensional retail management with real-time cross-shop inventory, portal-based fulfillment, and dimensional gateway operations

---

### Functional Requirements

#### Cross-Shop Inventory Synchronization
**Extends:** Nimbus Manufacturing multi-location inventory

**Features:**
- Real-time inventory visibility across all 5 shop locations from any location
- Cross-location inventory search for customer requests (check all shops instantly)
- Automated rebalancing suggestions based on demand patterns per location
- Portal transfer orders for moving inventory between shops
- Inventory reservation across locations (customer at Bellharbor reserves item currently in Stonegate)

**BC Integration:**
- Extends multi-location inventory with real-time sync
- Custom portal transfer order tables
- Cross-location reservation system

---

#### Portal-Based Customer Service
**Extends:** Sales order and customer management

**Features:**
- Customer profile recognized across all shop locations
- Cross-location order placement: order at any shop, deliver/pickup at any shop
- Portal pickup scheduling: customer specifies when and where to collect items
- Portal delivery coordination for commissions and refresh returns
- Multi-location browsing experience: staff can show customer items from other locations via portal

**BC Integration:**
- Extends sales order with portal fulfillment options
- Customer profile sharing across locations
- Portal pickup/delivery scheduling

---

#### Dimensional Gateway Operations
**Extends:** Facility management (no direct BC equivalent)

**Features:**
- Portal gateway status monitoring (operational, maintenance needed, offline)
- Portal mage scheduling for gateway maintenance and customer transfers
- Gateway capacity tracking (portals have throughput limits)
- Maintenance scheduling to minimize business disruption
- Emergency protocols for gateway failure (which shops lose connectivity, backup plans)
- Cost tracking for portal operations (portal mage fees, magical energy costs)

**BC Integration:**
- Custom gateway operations and maintenance tables
- Integration with vendor management for portal mage services
- Cost allocation to shop operations

---

#### Location-Specific Retail Optimization
**Extends:** Sales analytics and inventory planning

**Features:**
- Per-location demand analysis (what sells where)
- Cultural adaptation tracking (which products need different positioning per city)
- Location-specific pricing guidance (accounting for local economy and competition)
- Seasonal demand patterns per location
- Cross-location sales attribution (customer saw item at one shop, bought at another)

**BC Integration:**
- Custom sales analytics tables per location
- Integration with Nimbus Core cultural commerce rules
- Demand forecasting per location

---

### Technical Requirements

**New Tables:**
- Portal Gateway (gateway profiles with status, capacity, maintenance schedule)
- Portal Transfer Order (inventory movement between shops via portal)
- Portal Pickup Schedule (customer pickup appointments at specified locations)
- Gateway Maintenance Log (maintenance history and upcoming schedules)
- Location Demand Profile (per-location sales patterns and seasonal data)
- Cross-Location Reservation (inventory reserved at one location for fulfillment at another)

**Table Extensions:**
- Location (Nimbus Manufacturing): Add portal gateway reference, cultural adaptation profile
- Sales Order: Add portal fulfillment method, originating location, fulfillment location
- Item: Add location-specific display/positioning notes
- Customer: Add preferred location, cross-location purchase history

**New Pages:**
- Portal Network Dashboard (all gateway statuses, active transfers, capacity)
- Cross-Shop Inventory Browser (search and view inventory across all locations)
- Portal Transfer Management (create and track inter-shop transfers)
- Portal Pickup Scheduling (manage customer pickup appointments)
- Gateway Maintenance Planner (schedule and track portal maintenance)
- Location Demand Analytics (per-location sales analysis and trends)

**New Codeunits:**
- Portal Transfer Processor (execute inventory transfers between locations)
- Gateway Status Monitor (check gateway health and trigger maintenance alerts)
- Cross-Location Inventory Search (aggregate inventory across all connected shops)
- Location Demand Analyzer (calculate location-specific demand patterns and rebalancing recommendations)

---

## Cross-PTE Integration

### Work Centers + Enchantment Refresh
- Refresh work scheduled in pocket dimension using temporal scheduling
- Material dimensional stability data informs refresh process requirements
- Quality testing from work centers validates refresh effectiveness
- Cross-dimensional calibration needed when refreshing items made in different dimensional contexts

### Work Centers + Portal Shop Management
- Finished goods transfer from pocket dimension workshop to portal-connected shops
- Production scheduling considers shop-level demand data from Portal Shop Management
- Material sourcing from shops (materials received at any shop can be transferred to workshop)
- Quality certification in workshop links to retail certification at point of sale

### Enchantment Refresh + Portal Shop Management
- Refresh service drop-off/pickup at any shop location
- Refresh scheduling coordinated with portal availability for item transport
- Service contract management across all shop locations
- Cross-location refresh demand tracking for capacity planning

---

## PTE Development Priority

**Phase 1: Foundation**
1. Multi-planar Work Centers (can't produce items without temporal workshop management)
2. Portal Shop Management (can't sell items without multi-location retail)

**Phase 2: Services**
3. Enchantment Refresh Services (growing revenue stream as items in circulation increase)

---

## AppSource Foundation Requirements

**Nimbus Core Must Provide:**
- City registry with shop location data and cultural rules
- Guild coordination for apprenticeship management and enchanter certification
- Inter-realm communication protocols for client notifications and cross-location coordination
- Cultural commerce rules for location-specific retail adaptation

**Nimbus Manufacturing Must Provide:**
- Production planning and scheduling framework
- Bill of materials management
- Work center management foundation
- Quality control workflow foundation
- Custom order processing and tracking
- Multi-location inventory management
- Retail sales order processing

---

*This document defines the custom PTE functionality required to support Delyra's unique multi-dimensional manufacturing, enchantment services, and portal-connected retail operations beyond standard BC/AppSource capabilities.*
