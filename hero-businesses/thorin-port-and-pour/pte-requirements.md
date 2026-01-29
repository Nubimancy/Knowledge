# Thorin's Port & Pour - PTE Requirements

**Focus:** Custom functionality requirements that extend Nimbus Core + Nimbus Supply

---

## PTE Applications Overview

Thorin's business requires **3 PTE applications** that extend the AppSource foundation:

1. **Dwarven Ale Quality Tracking PTE** (Object Range: 62,000-62,799)
2. **Tavern Network Relationship Management PTE** (Object Range: 63,000-63,799)
3. **Community Event Orchestration PTE** (Object Range: 64,000-64,799)

**Note:** Thorin also depends on the **Enhanced Inventory PTE** (Object Range: 51,000-51,799) shared with Bran, which provides climate-specific preservation tracking, scrying-based inventory updates, and magical scroll order processing.

---

## PTE 1: Dwarven Ale Quality Tracking

**Object Range:** 62,000-62,799
**Dependencies:** Nimbus Core Foundation, Nimbus Supply, Enhanced Inventory PTE (shared with Bran)

### Business Requirements

**Problem Statement:**
Standard BC/Nimbus Supply inventory management doesn't support:
- Magical preservation monitoring with enchantment effectiveness tracking over time
- Enchanted barrel lifecycle management with re-enchantment scheduling
- Batch-level quality tracking from brewery through multiple transfer points to tavern delivery
- Preservation compatibility tracking per ale type (different ales respond differently to preservation magic)
- Temperature and climate zone exposure logging throughout distribution

**Solution:**
Specialized quality and preservation management layered on top of Enhanced Inventory's preservation foundation, focused on ale-specific quality requirements and barrel asset management

---

### Functional Requirements

#### Preservation Effectiveness Monitoring
**Extends:** Enhanced Inventory PTE climate-specific preservation tracking

**Features:**
- Per-barrel preservation effectiveness measurement with trending
- Ale-type-specific degradation curves (hoppy ales degrade faster in warm climates than stouts)
- Threshold alerting when preservation approaches minimum acceptable level
- Predictive degradation modeling based on planned route and climate exposure
- Integration with Enhanced Inventory's climate zone data for environmental context
- Historical effectiveness data for improving preservation enchantment specifications (feedback to Delyra)

**BC Integration:**
- Custom preservation measurement tables extending Enhanced Inventory
- Threshold alerting system
- Integration with barrel lifecycle management

---

#### Enchanted Barrel Lifecycle Management
**Extends:** Nimbus Supply asset and inventory management

**Features:**
- Barrel as tracked asset: enchantment date, enchantment type, expected lifespan, re-enchantment history
- Re-enchantment scheduling based on usage patterns and degradation data
- Barrel location tracking: hub storage, in transit, at tavern, at Delyra's for re-enchantment
- Barrel swap coordination: empty barrel collection logistics during delivery
- Barrel retirement criteria: when re-enchantment is no longer cost-effective
- Fleet-level barrel inventory analysis: total barrels, location distribution, upcoming re-enchantment needs

**BC Integration:**
- Custom barrel asset tables
- Integration with vendor management for Delyra's re-enchantment services
- Fleet analytics for barrel investment planning

---

#### Batch Quality Tracking
**Extends:** Nimbus Supply item tracking and lot management

**Features:**
- Batch-level quality records from brewery certification through each transfer point
- Quality measurement at key checkpoints: brewery seal, hub receipt, pre-delivery, tavern delivery
- Quality dimension tracking: taste profile, purity score, potency rating, preservation status
- Brewery quality trending: track quality consistency per brewery partner over time
- Batch rejection and incident management with root cause tracking
- Full traceability: any quality issue traced back through chain to brewery batch

**BC Integration:**
- Custom quality measurement and batch tracking tables
- Integration with purchase orders for brewery batch linking
- Incident management with traceability chain

---

#### Ale Type & Preservation Compatibility
**Extends:** Item classification and management

**Features:**
- Ale type catalog: brewing style, ingredient profile, optimal serving conditions
- Preservation compatibility matrix: which preservation enchantment types work best with which ale types
- Seasonal availability tracking per ale type and brewery
- Limited-edition and seasonal brew management with allocation rules
- Optimal delivery window calculation: how long after sealing an ale maintains peak quality

**BC Integration:**
- Custom ale type and compatibility tables
- Integration with preservation monitoring for type-specific thresholds
- Seasonal inventory planning

---

### Technical Requirements

**New Tables:**
- Barrel Asset (enchanted barrel tracking with lifecycle data)
- Barrel Enchantment Record (enchantment history per barrel)
- Preservation Measurement (effectiveness readings per barrel over time)
- Batch Quality Record (quality measurements at each checkpoint)
- Quality Checkpoint (defined measurement points in distribution chain)
- Ale Type Profile (ale classification with preservation compatibility)
- Preservation Compatibility Matrix (ale type vs. enchantment type effectiveness)
- Quality Incident (quality failures with root cause and resolution)

**Table Extensions:**
- Item (Nimbus Supply): Add ale type reference, preservation compatibility, optimal delivery window
- Item Ledger Entry: Add batch quality reference, preservation status at time of transaction
- Location: Add quality checkpoint role (brewery, hub, transit, tavern)
- Vendor (Nimbus Supply): Add brewery quality trend score, certification status

**New Pages:**
- Barrel Fleet Dashboard (all barrels with location, preservation status, re-enchantment schedule)
- Barrel Lifecycle Management (individual barrel history and scheduling)
- Batch Quality Tracker (trace batch quality from brewery through to tavern)
- Preservation Monitoring Console (real-time preservation status across all barrels)
- Ale Type Setup (ale classification and preservation compatibility)
- Quality Incident Management (investigate and resolve quality issues)
- Brewery Quality Scorecard (quality trending per brewery partner)

**New Codeunits:**
- Preservation Degradation Predictor (forecast degradation based on route and climate)
- Barrel Re-enchantment Scheduler (optimize re-enchantment timing and Delyra coordination)
- Batch Traceability Engine (trace quality issues back through distribution chain)
- Quality Threshold Monitor (check preservation and quality against thresholds, trigger alerts)

---

## PTE 2: Tavern Network Relationship Management

**Object Range:** 63,000-63,799
**Dependencies:** Nimbus Core Foundation, Nimbus Supply, Dwarven Ale Quality Tracking PTE

### Business Requirements

**Problem Statement:**
Standard CRM and sales management doesn't support:
- Tavern clientele analysis driving ale selection curation
- Multi-tier tavern partnership management with different service levels
- Ale curation recommendations based on local culture, clientele, and season
- Regional Caskwarden performance tracking across diverse hub operations
- Alebound Courier guild management with territory assignments and performance metrics

**Solution:**
Tavern-focused relationship management with clientele-driven curation, guild coordination, and regional performance analytics

---

### Functional Requirements

#### Tavern Clientele Analysis & Ale Curation
**Extends:** CRM and sales analytics

**Features:**
- Tavern profile: location, clientele demographic, cultural context, storage capacity, tap count
- Sales history analysis: what ales sell at each tavern, seasonal patterns, trend changes
- Clientele-based ale recommendations: suggest ales that match tavern's customer base
- Cultural alignment: ensure ale selection respects local cultural preferences and traditions
- Competitive context: awareness of what other ale sources serve nearby taverns
- Menu optimization: suggest optimal ale variety and rotation schedule per tavern

**BC Integration:**
- Custom tavern profile and clientele analysis tables
- Integration with sales history for recommendation engine
- Integration with Nimbus Core cultural rules for cultural alignment

---

#### Partnership Tier Management
**Extends:** Customer management and pricing

**Features:**
- Tier definitions: Basic (standard delivery), Curated (ale selection service), Premium (exclusive access + events)
- Tier-specific pricing, delivery priority, and service levels
- Tier advancement/demotion criteria based on volume, payment history, and relationship quality
- Tier-specific benefits management: exclusive ale access, event invitations, promotional support
- Contract management for each tier level

**BC Integration:**
- Custom partnership tier tables
- Integration with pricing and discount management
- Customer group assignment based on tier

---

#### Caskwarden Hub Performance Management
**Extends:** Employee/contractor performance tracking

**Features:**
- Caskwarden performance metrics: delivery quality, inventory accuracy, tavern satisfaction, financial results
- Hub-level KPI tracking: throughput, quality incidents, profitability, growth
- Cross-hub benchmarking and best practice identification
- Caskwarden territory and responsibility definition
- Performance review workflow with goal setting and tracking

**BC Integration:**
- Custom Caskwarden performance tables
- Integration with hub financial data
- Goal tracking and review management

---

#### Alebound Courier Management
**Extends:** Guild coordination from Nimbus Core

**Features:**
- Courier territory assignment and optimization
- Delivery performance tracking: on-time rate, quality verification compliance, customer feedback
- Compensation management: base pay, performance bonuses, hazard pay for difficult territories
- Training and certification tracking
- Route efficiency analysis per courier
- Cross-training coordination with Bran's Caravan Captains for shared route opportunities

**BC Integration:**
- Custom courier management tables
- Integration with delivery tracking data
- Compensation calculation engine

---

### Technical Requirements

**New Tables:**
- Tavern Profile (tavern master data with clientele, capacity, cultural context)
- Tavern Ale Preference (historical and recommended ale selections per tavern)
- Partnership Tier (tier definitions with benefits, pricing, criteria)
- Tavern Partnership (tavern-to-tier assignment with contract terms)
- Caskwarden Profile (hub manager data with performance history)
- Caskwarden Performance Record (periodic performance measurements)
- Alebound Courier Profile (courier data with territory, certifications)
- Courier Performance Record (delivery performance tracking)
- Ale Curation Recommendation (system-generated suggestions for tavern ale selection)

**Table Extensions:**
- Customer (Nimbus Supply): Add tavern profile reference, partnership tier
- Sales Order: Add tavern delivery context, courier assignment
- Location (Nimbus Supply): Add hub Caskwarden assignment, hub performance data

**New Pages:**
- Tavern Network Dashboard (all taverns with tier, satisfaction, delivery status)
- Tavern Profile Card (detailed tavern view with clientele analysis and ale curation)
- Partnership Tier Setup (define tiers, benefits, and criteria)
- Caskwarden Performance Dashboard (hub-level performance across all Caskwardens)
- Alebound Courier Management (territory, performance, compensation)
- Ale Curation Workspace (review and adjust ale recommendations per tavern)

**New Codeunits:**
- Clientele Analysis Engine (analyze tavern sales data and cultural context for ale recommendations)
- Tier Evaluation Engine (assess tavern eligibility for tier changes)
- Caskwarden Performance Calculator (aggregate hub metrics for performance scoring)
- Courier Route Optimizer (suggest territory adjustments for delivery efficiency)

---

## PTE 3: Community Event Orchestration

**Object Range:** 64,000-64,799
**Dependencies:** Nimbus Core Foundation, Nimbus Supply, Enhanced Inventory PTE (shared with Bran)

### Business Requirements

**Problem Statement:**
Standard logistics and shipping management doesn't support:
- Multi-modal route optimization combining sea, land, and portal transport methods simultaneously
- Coordinated convoy planning with Bran's Caravans for shared efficiency
- Portal-based emergency and premium delivery coordination
- Event supply logistics with specific timing and volume requirements
- Cross-guild collaboration between Alebound Couriers and Bran's Caravan Captains

**Solution:**
Advanced logistics coordination with multi-modal optimization, cross-hero collaboration, and event supply management

---

### Functional Requirements

#### Multi-Modal Route Optimization
**Extends:** Nimbus Supply shipping + Enhanced Inventory PTE route awareness

**Features:**
- Combined sea, land, and portal route planning for optimal delivery
- Mode selection logic: cost, speed, preservation requirements, and destination access constraints
- Weather and seasonal route adaptation with mode switching (sea routes closed in winter → switch to land)
- Route cost comparison across modes (portal is fastest but most expensive)
- Backup route planning: pre-computed alternatives when primary mode fails

**BC Integration:**
- Custom multi-modal route planning tables
- Integration with Enhanced Inventory's route and climate data
- Cost comparison analytics

---

#### Cross-Hero Logistics Collaboration
**Extends:** Transfer order management and shipping coordination

**Features:**
- Shared convoy planning with Bran's Caravans (Port & Pour barrels on Caravan wagons)
- Shared warehouse utilization tracking and cost allocation
- Joint route intelligence: Bran's threat data + Thorin's delivery schedules
- Coordinated scheduling: align Port & Pour deliveries with Caravan routes for efficiency
- Cross-guild coordination: Alebound Couriers and Caravan Captains working shared final-mile routes
- Cost sharing and billing: fair allocation of shared logistics costs

**BC Integration:**
- Custom shared logistics and cost allocation tables
- Integration with Bran's route planning systems
- Inter-company billing for shared services

---

#### Event Supply Management
**Extends:** Sales order management with event-specific requirements

**Features:**
- Event supply contract management: volume, timing, ale selection, delivery requirements
- Event-specific logistics planning: delivery staging, setup, on-site management
- Rini's Pinnacle League integration: tournament hospitality supply as primary event client
- Festival and celebration supply coordination aligned with city cultural calendars
- Post-event accounting: actual vs. contracted, returns, breakage
- Event performance analysis: revenue, profitability, satisfaction per event

**BC Integration:**
- Custom event supply tables
- Integration with sales orders for event-specific processing
- Event profitability analytics

---

### Technical Requirements

**New Tables:**
- Multi-Modal Route Plan (combined route with mode per segment)
- Transport Mode (available transport modes with cost, speed, capacity, limitations)
- Shared Convoy Schedule (coordinated delivery planning with Bran's Caravans)
- Shared Logistics Cost Allocation (cost sharing records between heroes)
- Event Supply Contract (event-specific supply agreements)
- Event Supply Delivery (actual deliveries against event contracts)
- Cross-Guild Assignment (Alebound Courier + Caravan Captain shared route assignments)

**Table Extensions:**
- Transfer Order (Nimbus Supply): Add multi-modal route reference, shared convoy reference
- Shipping Agent (Nimbus Supply): Add transport mode classification, preservation capability
- Sales Order: Add event supply contract reference
- Location (Nimbus Supply): Add transport mode access (port access, portal access, road access)

**New Pages:**
- Multi-Modal Route Planner (design routes combining sea, land, and portal segments)
- Shared Convoy Coordinator (plan and track joint logistics with Bran's Caravans)
- Event Supply Management (event contracts, delivery planning, execution tracking)
- Cross-Hero Logistics Dashboard (shared routes, warehouse utilization, cost allocation)
- Transport Mode Setup (configure available transport modes with capabilities and costs)

**New Codeunits:**
- Multi-Modal Route Optimizer (find optimal mode combination for given delivery requirements)
- Shared Logistics Cost Allocator (calculate fair cost distribution between heroes)
- Event Supply Planner (generate delivery schedule from event contract requirements)
- Convoy Coordination Engine (align Port & Pour deliveries with Caravan routes)

---

## Cross-PTE Integration

### Ale Quality Tracking + Tavern Network
- Quality data from batch tracking informs tavern-specific quality reporting
- Tavern feedback feeds back into brewery quality scoring
- Ale type compatibility data drives tavern curation recommendations
- Quality incidents at tavern level trigger investigation through batch traceability

### Ale Quality Tracking + Community Event Orchestration
- Preservation monitoring data informs multi-modal route selection (choose modes that minimize preservation stress)
- Barrel lifecycle data impacts logistics planning (barrels due for re-enchantment shouldn't be sent on long routes)
- Quality tracking at event delivery points
- Seasonal ale availability constraints affect event supply planning

### Tavern Network + Community Event Orchestration
- Tavern network used to promote events (especially Rini's tournaments)
- Event supply delivered through tavern network logistics
- Tavern clientele data helps plan event ale selection
- Caskwarden hubs serve as event supply staging points

### Enhanced Inventory PTE (Shared with Bran)
- Climate zone data from Enhanced Inventory drives preservation degradation predictions
- Scrying-based inventory updates provide real-time barrel location across transit
- Preservation tracking foundation shared between ale preservation and cargo preservation
- Scroll order processing for tavern orders via magical scroll

---

## PTE Development Priority

**Phase 1: Foundation**
1. Dwarven Ale Quality Tracking (quality and preservation are core business promise—can't operate without it)
2. Tavern Network Relationship Management (tavern partnerships are the primary revenue relationship)

**Phase 2: Optimization**
3. Community Event Orchestration (logistics optimization and event supply management)

**Note:** Enhanced Inventory PTE (shared with Bran) is a Phase 1 dependency that should be developed in coordination with Bran's PTE development.

---

## AppSource Foundation Requirements

**Nimbus Core Must Provide:**
- City registry with cultural ale preferences and local regulations
- Guild coordination for Caskwarden and Alebound Courier guild management
- Inter-realm communication protocols for cross-hub coordination and brewery communication
- Cultural commerce rules for culturally appropriate ale selection and marketing

**Nimbus Supply Must Provide:**
- Multi-location inventory management across 5 hubs
- Route planning and shipping coordination
- Warehouse management for hub operations
- Purchase order processing for brewery sourcing
- Transfer order management for inter-hub movements
- Vendor management for brewery partnerships

---

*This document defines the custom PTE functionality required to support Thorin's unique ale distribution, magical preservation, and tavern network operations beyond standard BC/AppSource capabilities.*
