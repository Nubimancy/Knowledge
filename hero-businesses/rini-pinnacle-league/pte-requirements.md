# Rini's Pinnacle League - PTE Requirements

**Focus:** Custom functionality requirements that extend Nimbus Core + Nimbus Exhibition

---

## PTE Applications Overview

Rini's business requires **3 PTE applications** that extend the AppSource foundation:

1. **Dimensional Tournament Brackets PTE** (Object Range: 53,000-53,799)
2. **Fighter Progression Analytics PTE** (Object Range: 54,000-54,799)
3. **Multi-Realm Sports Broadcasting PTE** (Object Range: 55,000-55,799)

---

## PTE 1: Dimensional Tournament Brackets

**Object Range:** 53,000-53,799
**Dependencies:** Nimbus Core Foundation, Nimbus Exhibition

### Business Requirements

**Problem Statement:**
Standard BC/Nimbus Exhibition event management doesn't account for:
- Arena-specific rules that change how tournaments are structured
- Environmental hazard factors that affect match outcomes and scheduling
- Cross-arena qualification systems where fighters earn points across multiple venues
- Dynamic bracket adjustments when environmental conditions change mid-tournament

**Solution:**
Custom tournament bracket engine with arena-aware rule sets, environmental factor integration, and cross-arena qualification tracking

---

### Functional Requirements

#### Arena-Specific Tournament Bracket Generation
**Extends:** Nimbus Exhibition event management

**Features:**
- Tournament template definitions per arena type (sea, underground, volcanic, desert, mountain)
- Arena-specific rule sets that modify standard bracket progression
- Environmental hazard integration into match scheduling (e.g., volcanic vent activity windows)
- Weight class and combat style categorization per arena compatibility
- Cultural rule compliance per host city (restricted combat techniques, required rituals, timing constraints)

**BC Integration:**
- Extends event management with arena-aware bracket logic
- Custom tournament template tables
- Integration with Nimbus Core city registry for cultural rules

---

#### Cross-Arena Qualification System
**Extends:** Nimbus Exhibition registration and participant tracking

**Features:**
- Point accumulation system across all 5 arenas
- Arena-specific point weighting (harder environments may award more points)
- Qualification thresholds for The Peak championship
- Season-based qualification periods with rollover rules
- Wildcard and special invitation management for The Peak

**BC Integration:**
- Extends participant tracking with qualification point ledger
- Custom qualification rule tables
- Season management and period tracking

---

#### Dynamic Match Management
**Extends:** Nimbus Exhibition event execution

**Features:**
- Real-time environmental condition monitoring integration
- Match delay/reschedule logic based on safety thresholds
- Judge scoring with environmental factor weighting
- Match result recording with full context (arena, conditions, techniques used)
- Automatic bracket advancement and loser bracket routing

**BC Integration:**
- Custom match execution tables
- Environmental condition logging
- Integration with scoring and judging system

---

### Technical Requirements

**New Tables:**
- Tournament Template (arena-specific tournament structures)
- Arena Rule Set (rules and modifiers per arena)
- Tournament Bracket (generated bracket with match slots)
- Match Record (detailed match outcomes with environmental context)
- Qualification Point Ledger (cross-arena point tracking per fighter per season)
- Environmental Condition Log (arena conditions at time of match)

**Table Extensions:**
- Event (Nimbus Exhibition): Add arena type, environmental status, tournament template reference
- Registration Entry (Nimbus Exhibition): Add qualification points, arena preferences, combat style
- City (Nimbus Core): Add arena facility reference, cultural combat rules

**New Pages:**
- Tournament Planning Workspace (design brackets with arena-specific rules)
- Match Execution Console (real-time match management with environmental monitoring)
- Qualification Standings Dashboard (cross-arena fighter qualification progress)
- Arena Rule Set Setup (configure rules per arena type)
- The Peak Invitation Management (championship qualification review)

**New Codeunits:**
- Bracket Generation Engine (create brackets from templates with arena rules)
- Qualification Calculator (aggregate cross-arena points with weighting)
- Match Result Processor (record outcomes, update brackets, trigger ranking updates)
- Environmental Safety Validator (check conditions against safety thresholds)

---

## PTE 2: Fighter Progression Analytics

**Object Range:** 54,000-54,799
**Dependencies:** Nimbus Core Foundation, Nimbus Exhibition, Dimensional Tournament Brackets PTE

### Business Requirements

**Problem Statement:**
Standard participant tracking doesn't support:
- Career-long performance analysis across multiple arena environments
- Skill translation between combat styles and arena types
- Injury tracking integrated with career management
- Mentorship matching based on fighting style compatibility and career stage
- Career transition planning from active fighter to guard, trainer, or other roles

**Solution:**
Comprehensive fighter career management platform with cross-arena analytics, mentorship coordination, and career lifecycle support

---

### Functional Requirements

#### Cross-Arena Performance Analytics
**Extends:** Nimbus Exhibition participant tracking + Tournament Brackets PTE match data

**Features:**
- Fighter performance scoring normalized across different arena environments
- Arena-specific strength/weakness profiling (e.g., excels in sea combat, struggles in desert)
- Win/loss trend analysis with environmental context
- Technique effectiveness tracking per arena type
- Comparative analytics against peer fighters at same rank tier

**BC Integration:**
- Analytics on match history from Tournament Brackets PTE
- Custom performance metric tables
- Integration with ranking system

---

#### Skill Translation Matrix
**Extends:** Fighter registration and assessment

**Features:**
- Standardized combat skill taxonomy across all cultural fighting traditions
- Translation rules: how skills from one tradition map to another arena's requirements
- Gap analysis: what skills a fighter needs to develop for new arena environments
- Training recommendations based on skill gaps
- Cultural fighting style classification and preservation

**BC Integration:**
- Custom skill taxonomy tables
- Training recommendation engine
- Integration with registration assessment data

---

#### Fighter Health & Injury Management
**Extends:** Nimbus Exhibition participant records

**Features:**
- Injury recording with arena/match context
- Recovery timeline tracking and return-to-competition clearance
- Cumulative injury risk assessment (detecting patterns)
- Medical clearance workflow with healer/physician sign-off
- Arena-specific injury risk profiles (heat injuries at Blackwoods, drowning risk at Sunken Ring, etc.)

**BC Integration:**
- Custom injury and medical record tables
- Clearance approval workflows
- Integration with match scheduling (injured fighters auto-excluded)

---

#### Mentorship Network Coordination
**Extends:** CRM and relationship management

**Features:**
- Mentor-mentee matching based on combat style, arena specialization, personality, and career goals
- Mentorship progress tracking and milestone management
- Mentor compensation tracking (mentors receive fees or sponsorship credit)
- Cross-arena mentorship for fighters developing multi-environment skills
- Mentorship effectiveness measurement (mentee advancement rate)

**BC Integration:**
- Custom mentorship relationship tables
- Milestone and progress tracking
- Compensation integration with financial operations

---

#### Career Transition Management
**Extends:** Nimbus Exhibition CRM

**Features:**
- Career stage tracking: prospect, active fighter, veteran, transitioning, retired
- Placement opportunity matching (guard roles, training positions, arena staff)
- Skills assessment for non-fighting career paths
- Partnership integration with Bran's Caravans for guard placement
- Retirement planning and legacy recognition

**BC Integration:**
- Custom career stage and transition tables
- Integration with placement service revenue tracking
- Partnership data exchange with Bran's systems

---

### Technical Requirements

**New Tables:**
- Fighter Profile (comprehensive career record beyond basic registration)
- Performance Metric (normalized performance data per arena per season)
- Skill Assessment (taxonomy-based skill inventory per fighter)
- Skill Translation Rule (how skills map across combat traditions)
- Injury Record (injury history with match/arena context)
- Medical Clearance (clearance status and healer sign-off)
- Mentorship Assignment (mentor-mentee pairings with terms)
- Career Transition Plan (transition stage, target role, skills gap)

**Table Extensions:**
- Registration Entry (Nimbus Exhibition): Add skill profile reference, career stage, mentorship status
- Match Record (Tournament Brackets PTE): Add performance metric capture fields

**New Pages:**
- Fighter Career Dashboard (comprehensive career view for individual fighter)
- Performance Analytics Workspace (cross-arena performance comparison and trends)
- Skill Development Planner (gap analysis and training recommendations)
- Injury & Medical Management (health tracking and clearance workflows)
- Mentorship Management (matching, tracking, and effectiveness)
- Career Transition Planner (transition stage management and placement matching)
- Guard Placement Board (available fighters matched with security opportunities)

**New Codeunits:**
- Performance Normalization Engine (normalize scores across arena types)
- Skill Translation Engine (map skills across combat traditions)
- Mentorship Matching Algorithm (suggest optimal pairings)
- Career Transition Evaluator (assess readiness for career stage changes)
- Placement Matching Engine (match transitioning fighters with guard/trainer opportunities)

---

## PTE 3: Multi-Realm Sports Broadcasting

**Object Range:** 55,000-55,799
**Dependencies:** Nimbus Core Foundation, Nimbus Exhibition, Dimensional Tournament Brackets PTE

### Business Requirements

**Problem Statement:**
Standard event management doesn't support:
- Cross-arena audience engagement spanning multiple kingdoms simultaneously
- Real-time ranking updates visible across all arena locations
- Cultural adaptation of tournament promotion for different city audiences
- Portal-based event access coordination for The Peak
- Season-long narrative management (rivalries, storylines, championship races)

**Solution:**
Cross-arena communication and audience engagement platform with cultural adaptation and portal coordination

---

### Functional Requirements

#### Cross-Arena Communication & Results Distribution
**Extends:** Nimbus Core communication protocols

**Features:**
- Real-time match results distribution to all arena cities via magical scroll network
- Ranking update broadcasting after each tournament
- Season standings synchronization across all locations
- Emergency communication for event cancellations or schedule changes
- Fighter news and announcement distribution

**BC Integration:**
- Integration with Nimbus Core Inter-Realm Communication Hub
- Custom broadcast message tables
- Automated result distribution workflows

---

#### Cultural Event Promotion
**Extends:** Nimbus Exhibition marketing and CRM

**Features:**
- City-specific promotional content generation (respecting local customs and communication styles)
- Tavern network promotion coordination (partnership with Thorin's Port & Pour)
- Season ticket and loyalty program management per city
- Cultural calendar awareness (avoid promoting during mourning periods, align with festivals)
- Sponsorship visibility management across different cultural contexts

**BC Integration:**
- Custom promotional campaign tables
- Integration with Nimbus Core cultural rules
- CRM segmentation by city/culture

---

#### Portal Access Coordination for The Peak
**Extends:** Event logistics management

**Features:**
- Portal mage scheduling and capacity reservation for The Peak events
- Attendee portal access ticketing (fighters, judges, VIPs, spectators by tier)
- Portal usage cost tracking and allocation
- Backup portal scheduling for weather/emergency contingencies
- Portal capacity optimization (maximize attendees within mage limitations)

**BC Integration:**
- Custom portal reservation tables
- Integration with vendor management for portal mage services
- Cost allocation to event budgets

---

#### Season Narrative Management
**Extends:** CRM and engagement tracking

**Features:**
- Fighter rivalry tracking and storyline management
- Championship race visualization and promotion
- Historical record keeping for legendary matches and moments
- Fan engagement metrics per arena and per rivalry
- Legacy and hall of fame management

**BC Integration:**
- Custom narrative and storyline tables
- Fan engagement analytics
- Integration with promotional campaigns

---

### Technical Requirements

**New Tables:**
- Broadcast Message (cross-arena communications with delivery tracking)
- Promotional Campaign (city-specific marketing with cultural rules)
- Portal Reservation (The Peak access scheduling)
- Portal Mage Service (available portal providers with capacity/pricing)
- Season Narrative (storylines, rivalries, championship races)
- Fan Engagement Metric (audience tracking per arena/event/rivalry)

**Table Extensions:**
- Event (Nimbus Exhibition): Add broadcast distribution list, promotional campaign reference
- City (Nimbus Core): Add arena promotion preferences, cultural event calendar
- Tournament Bracket (Tournament Brackets PTE): Add narrative/storyline tags

**New Pages:**
- Broadcast Management Console (compose and distribute cross-arena communications)
- Promotional Campaign Workspace (design city-specific promotions)
- Peak Portal Coordination (manage portal access for championship events)
- Season Overview Dashboard (rankings, storylines, upcoming events across all arenas)
- Fan Engagement Analytics (audience metrics and trend analysis)

**New Codeunits:**
- Broadcast Distribution Engine (route messages to appropriate cities via communication protocols)
- Cultural Promotion Validator (check promotional content against city cultural rules)
- Portal Capacity Optimizer (maximize Peak attendance within portal constraints)
- Narrative Tracker (detect and surface emerging rivalries and storylines from match data)

---

## Cross-PTE Integration

### Tournament Brackets + Fighter Progression
- Match results from brackets feed performance analytics
- Qualification points drive career progression milestones
- Injury data from matches integrates with health management
- Bracket seeding uses performance analytics for fair matchups

### Tournament Brackets + Sports Broadcasting
- Real-time bracket updates feed broadcast distribution
- Qualification standings drive season narrative content
- Environmental condition changes trigger broadcast notifications
- The Peak qualification announcements are major broadcast events

### Fighter Progression + Sports Broadcasting
- Fighter career milestones generate broadcast-worthy news
- Rivalry detection from analytics feeds narrative management
- Career transitions (retirements, comebacks) are promotional opportunities
- Mentorship success stories support league promotion

---

## PTE Development Priority

**Phase 1: Foundation**
1. Dimensional Tournament Brackets (core business operations - can't run tournaments without it)
2. Fighter Progression Analytics (fighter management is essential for career development promise)

**Phase 2: Engagement**
3. Multi-Realm Sports Broadcasting (optimization of audience reach and engagement)

---

## AppSource Foundation Requirements

**Nimbus Core Must Provide:**
- City registry with cultural rules and event calendar data
- Guild coordination for fighter guild management
- Inter-realm communication protocols for cross-arena messaging
- Cultural commerce rules for event promotion compliance

**Nimbus Exhibition Must Provide:**
- Event and tournament management framework
- Registration and participant tracking
- Facility and resource scheduling
- Service project management for arena operations
- CRM foundation for fighter and patron relationships

---

*This document defines the custom PTE functionality required to support Rini's unique multi-arena combat sports operations beyond standard BC/AppSource capabilities.*
