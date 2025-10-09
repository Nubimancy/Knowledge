# Bran's Caravans of Fortune - PTE Requirements

**Focus:** Custom functionality requirements that extend Nimbus Core + Nimbus Supply

---

## PTE Applications Overview

Bran's business requires **3 PTE applications** that extend the AppSource foundation:

1. **Multi-planar Shipping PTE** (Object Range: 50,000-50,799)
2. **Enhanced Inventory PTE** (Object Range: 51,000-51,799) - *Shared with Thorin*
3. **Trade Intelligence Hub PTE** (Object Range: 52,000-52,799)

---

## PTE 1: Multi-planar Shipping

**Object Range:** 50,000-50,799
**Dependencies:** Nimbus Core Foundation, Nimbus Supply

### Business Requirements

**Problem Statement:**
Standard BC/Nimbus Supply routing doesn't account for:
- Geographic challenges (floating cities, underground realms, desert crossings)
- Portal-based shipping options
- Multi-dimensional delivery tracking across magical realms

**Solution:**
Custom route calculation, portal integration, and cross-realm tracking

---

### Functional Requirements

#### Inter-Realm Route Calculation
**Extends:** Nimbus Supply route planning

**Features:**
- Geographic difficulty algorithms (elevation, climate, magical barriers)
- Multi-leg route optimization (land → portal → land combinations)
- Cultural commerce rule validation per route segment
- Dynamic route adjustment based on real-time conditions

**BC Integration:**
- Extends Transfer Order routing
- Custom route planning page/logic
- Integration with Nimbus Core city registry for geographic data

---

#### Portal-Based Shipping Integration
**Extends:** Nimbus Supply shipping workflows

**Features:**
- Portal availability checking
- Portal capacity management
- Cost calculation for portal vs. traditional routes
- Portal scheduling and reservation

**BC Integration:**
- Portal as "special" shipping agent/service
- Custom portal management tables
- Integration with portal service providers (vendor management)

---

#### Multi-Dimensional Delivery Tracking
**Extends:** Nimbus Supply shipment tracking

**Features:**
- Real-time location updates via scrying integration
- Cross-realm tracking visibility for customers
- Event logging (departed city, portal transition, customs clearance, etc.)
- Estimated arrival recalculation based on route progress

**BC Integration:**
- Extends shipment tracking
- Custom tracking event tables
- Customer portal for tracking visibility

---

### Technical Requirements

**New Tables:**
- Route Segment (break routes into legs with geographic data)
- Portal Service (available portals, capacity, pricing)
- Portal Reservation (scheduled portal usage)
- Tracking Event (detailed shipment progress)
- Geographic Challenge (difficulty ratings per route segment)

**Table Extensions:**
- Transfer Order: Add route calculation fields
- Location: Add realm/geographic metadata
- Shipping Agent: Add portal service indicator

**New Pages:**
- Route Planning Workspace
- Portal Management
- Shipment Tracking Portal (customer-facing)
- Geographic Challenge Setup

**New Codeunits:**
- Route Calculation Engine
- Portal Service Integration
- Tracking Event Management

---

## PTE 2: Enhanced Inventory (Shared with Thorin)

**Object Range:** 51,000-51,799
**Dependencies:** Nimbus Core Foundation, Nimbus Supply
**Shared By:** Bran (caravans), Thorin (ale distribution)

### Business Requirements

**Problem Statement:**
Standard inventory management doesn't support:
- Magical scroll order parsing and integration
- Real-time scrying-based inventory updates
- Climate-specific preservation tracking across realms
- Magical preservation effectiveness monitoring

**Solution:**
Enhanced inventory tracking with magical integration and preservation management

---

### Functional Requirements

#### Magical Scroll Order Processing
**Extends:** Sales order entry

**Features:**
- Automated scroll parsing and order creation
- Scroll authentication and validation
- Integration with Inter-Realm Communication Hub (Nimbus Core)
- Scroll response automation

**BC Integration:**
- Extends sales order creation
- Custom scroll processing tables
- Integration with communication protocols

---

#### Scrying-Based Inventory Updates
**Extends:** Inventory tracking and visibility

**Features:**
- Real-time inventory position updates via scrying
- Cross-location visibility without physical counts
- Automated discrepancy detection and alerts
- Integration with scrying service providers

**BC Integration:**
- Extends item ledger entries
- Custom scrying update logs
- Real-time inventory adjustment processing

---

#### Climate-Specific Preservation Tracking
**Extends:** Inventory quality management

**Features:**
- Climate zone definition per location
- Preservation requirement definition per item/service
- Preservation spell effectiveness monitoring
- Automated preservation renewal alerts
- Cost tracking for preservation materials

**BC Integration:**
- Extends item tracking
- Custom preservation tables
- Location climate metadata
- Cost allocation for preservation

---

### Technical Requirements

**New Tables:**
- Scroll Order (parsed scroll orders awaiting processing)
- Scrying Update Log (history of scrying-based updates)
- Preservation Requirement (item/climate preservation needs)
- Preservation Effectiveness (tracking spell decay)
- Climate Zone (climate definitions)

**Table Extensions:**
- Item: Add preservation requirement fields
- Location: Add climate zone
- Sales Order: Add scroll source indicator
- Item Ledger Entry: Add scrying update metadata

**New Pages:**
- Scroll Order Processing
- Scrying Update Management
- Preservation Monitoring Dashboard
- Climate Zone Setup

**New Codeunits:**
- Scroll Parser
- Scrying Integration
- Preservation Management
- Climate Compatibility Engine

---

## PTE 3: Trade Intelligence Hub

**Object Range:** 52,000-52,799
**Dependencies:** Nimbus Core Foundation, Nimbus Supply, Multi-planar Shipping PTE

### Business Requirements

**Problem Statement:**
Bran needs intelligence to optimize:
- Per-city market analysis and pricing
- Cultural commerce rule enforcement
- Dynamic route profitability calculations
- Trade opportunity identification

**Solution:**
Analytics and intelligence platform for strategic decision-making

---

### Functional Requirements

#### Per-City Market Analysis
**Extends:** Pricing and demand forecasting

**Features:**
- City-specific demand tracking by item/service
- Competitive pricing analysis
- Seasonal demand patterns
- Market saturation indicators

**BC Integration:**
- Analytics on sales history
- Integration with Nimbus Core city data
- Custom market analysis tables

---

#### Cultural Commerce Rule Enforcement
**Extends:** Order processing validation

**Features:**
- Automated rule checking during order entry
- Cultural compliance reporting
- Prohibited route identification
- Custom clearance requirement alerts

**BC Integration:**
- Order validation events
- Integration with Nimbus Core cultural rules
- Compliance tracking

---

#### Dynamic Route Profitability
**Extends:** Route planning with financial analysis

**Features:**
- Real-time profitability calculation per route
- Cost vs. revenue analysis
- Route recommendation engine
- Historical profitability tracking

**BC Integration:**
- Integration with Multi-planar Shipping PTE
- Cost and revenue data aggregation
- Route optimization suggestions

---

#### Trade Opportunity Identification
**Extends:** Sales forecasting

**Features:**
- Cross-realm arbitrage opportunity detection
- Unmet demand identification
- Partnership opportunity recommendations
- Seasonal opportunity alerts

**BC Integration:**
- Market analysis algorithms
- Sales pattern recognition
- Opportunity workflow management

---

### Technical Requirements

**New Tables:**
- City Market Analysis (demand/pricing by city/item)
- Cultural Compliance Rule (cached from Nimbus Core)
- Route Profitability (calculated profitability per route)
- Trade Opportunity (identified opportunities)
- Competitive Intelligence (market competitor data)

**Table Extensions:**
- Sales Order: Add profitability analysis fields
- Transfer Order: Add route profitability
- City (Nimbus Core): Add market metadata

**New Pages:**
- Market Analysis Dashboard
- Route Profitability Workspace
- Trade Opportunity Management
- Cultural Compliance Monitor

**New Codeunits:**
- Market Analysis Engine
- Cultural Rule Validator
- Profitability Calculator
- Opportunity Detection Engine

---

## Cross-PTE Integration

### Multi-planar Shipping + Enhanced Inventory
- Route planning considers preservation requirements
- Scrying updates inform route progress tracking

### Multi-planar Shipping + Trade Intelligence Hub
- Route profitability drives route planning decisions
- Cultural compliance validates route selection

### Enhanced Inventory + Trade Intelligence Hub
- Inventory levels inform trade opportunity detection
- Market analysis drives preservation investment decisions

---

## PTE Development Priority

**Phase 1: Foundation**
1. Multi-planar Shipping (most critical for business operations)
2. Enhanced Inventory (enables magical commerce integration)

**Phase 2: Intelligence**
3. Trade Intelligence Hub (optimization on top of working operations)

---

## AppSource Foundation Requirements

**Nimbus Core Must Provide:**
- City registry with geographic metadata
- Cultural commerce rule engine
- Guild coordination APIs
- Inter-realm communication protocols

**Nimbus Supply Must Provide:**
- Standard route planning
- Transfer order management
- Multi-location inventory
- Shipment tracking foundation

---

*This document defines the custom PTE functionality required to support Bran's unique business operations beyond standard BC/AppSource capabilities.*
