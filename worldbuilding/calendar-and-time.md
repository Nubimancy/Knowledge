---
title: "Calendar & Time Systems"
tags: ["worldbuilding", "calendar", "time", "moons", "seasons", "holidays"]
summary: "The Aetherian Calendar system, lunar cycles, seasons, and major holidays across the realms"
updated: 2025-10-21
---

# Calendar & Time Systems

## The Aetherian Calendar (AC)

### Basic Structure
**Standard Earth-Compatible for BC:**
- **Hours in a day:** 24
- **Days in a week:** 7
- **Weeks in a month:** ~4 (varies by month)
- **Months in a year:** 12
- **Days in a year:** 365

**Pragmatic Decision:** Earth-standard calendar maintained for Business Central compatibility. Custom day/month names exist in lore but UI uses standard BC date handling.

---

## Year Numbering

**Calendar System:** Aetherian Calendar (AC)
- Scholarly standard set by Aetheros Magocracy
- Universal across kingdoms for trade/diplomacy

**Epoch:** Founding of Nimbuspire (~1250 years ago, approximately year 1000 CE equivalent)

**Current Year:** AC 2247 (chosen for JSON/API compatibility, post-Unix epoch)

**Recent History:**
- AC 2244-2245: The Twilight Plague crisis
- AC 2246: Heroes' businesses founded (1 year post-plague)
- AC 2247: Current demo timeline (present day)

---

## The Two Moons System

### Moon Names & Cycles

**Silvara (Larger Moon):**
- 28-day cycle (like Earth's moon)
- Silver-white appearance
- Primary moon for timekeeping

**Coprus (Smaller Moon):**
- 20-day cycle (faster orbit)
- Copper-colored appearance
- Used for magical timing

### The Conjunction

**Both Moons Dark Together:** Every ~140 days
- 5 Silvara cycles
- 7 Coprus cycles
- Major cultural/religious significance
- Dangerous period (darkest nights, increased creature activity)

---

## Cultural Significance of Moons

**Festivals & Ceremonies:**
- The Conjunction: Spiritual observances, businesses often closed
- Full moon celebrations
- Planting/harvest timing by lunar phases

**Magical Effects:**
- Enchanting potency varies by moon phase
- Creature behavior patterns tied to moons
- Traditional spell timing

**Practical Effects:**
- Tides (maritime navigation and fishing)
- Magic strength fluctuations
- Night visibility for travel/guards

---

## Nimbus Core Extension: Lunar Cycle Tracker

**Custom Calculated Fields:**
- "Current Moon Phase" for both moons
- Phase types: New, Waxing Crescent, First Quarter, Waxing Gibbous, Full, Waning Gibbous, Last Quarter, Waning Crescent

**Business Impact Warnings:**
- "New Moon Period - Reduced Night Visibility"
- "The Conjunction - High Danger Travel Period"
- "Double Full Moon - Peak Magic Potency"

**Special Event Detection:**
- Double Full Moon (both full simultaneously)
- The Conjunction (both new)
- Various quarter combinations

**Reporting Dimension:**
- Filter/group business data by lunar cycle
- Analyze seasonal patterns with lunar correlation

**Integration Points:**
- Resource planning (Bran's caravan scheduling)
- Creature collection timing (Weltina's Warden assignments)
- Enchanting schedules (Delyra's workshop planning)
- Tavern business patterns (Thorin's demand forecasting)

---

## Seasons

### Four Standard Seasons

**Spring (~91 days):**
- Planting season
- Increased agricultural shipping
- Trade activity ramps up after winter

**Summer (~91 days):**
- Peak travel season
- Best weather for caravans
- Busiest period for logistics

**Autumn (~91 days):**
- Harvest season
- Busiest shipping period overall
- Agricultural goods movement

**Winter (~91 days):**
- Reduced travel (dangerous weather)
- Hazardous routes more expensive
- Increased inn/tavern business (people stay indoors)

---

## Major Holidays & Festivals

### Universal/Cross-Kingdom Holidays

**Liberation Day (12th day of 9th month):**
- Goldentarn celebrates plague victory
- Heroes honored publicly
- Major celebration, businesses closed
- Annual anniversary of eclipse battle victory

**The Conjunction (Every ~140 days):**
- Spiritual/religious observance when both moons new
- Most businesses closed or reduced hours
- Dangerous period (minimal travel)
- Varies by date (astronomical event)

**Harvest Festival (Varies by region, typically 8th-9th month):**
- Agricultural celebration
- Trade fairs and markets
- Regional variations by climate/crop timing

**Midwinter Feast (12th month):**
- Winter solstice celebration
- Family gatherings
- Reduced business operations

### Kingdom-Specific Festivals
*To be detailed per kingdom as needed for regional flavor*

---

## Timekeeping Precision

### Common Folk
- Track days roughly (market days, rest days, moon phases)
- "Three nights after full moon"
- Seasonal awareness more important than exact dates

### Merchants & Professionals
- Track days precisely for contracts
- Scheduling format: "15th day of the 3rd month, AC 2247"
- Simplified: "15/3/2247" in documents

### Distributed Team Coordination
- Scheduled meetup dates for caravan squads
- Moon phase references for timing
- Seasonal landmarks ("After spring thaw", "Before winter snows")
- Nubimancy system provides exact synchronization

---

## Business Operations Impact

**Major Holidays:**
- Businesses closed or severely reduced hours
- Advance planning required
- Premium rates for rush deliveries before/after holidays

**The Conjunction:**
- Minimal caravan travel (too dangerous)
- Reduced operations across all businesses
- Predictable (every ~140 days) but exact date varies

**Harvest Season:**
- Peak shipping volume
- All logistics businesses at maximum capacity
- Seasonal labor hired
- Premium rates due to demand

**Winter Operations:**
- Reduced travel, dangerous routes
- Higher costs for winter deliveries
- Tavern/inn business increases
- Some routes become impassable

---

## BC Implementation

**Date Field Setup:**
- Standard BC calendar system (no custom calendar required)
- Date handling uses familiar formats
- Fiscal year: Can use Jan-Dec or custom (e.g., post-harvest start in 10th month)

**Lunar Extension:**
- Custom PTE: Lunar Cycle Tracker
- Adds depth without breaking core BC functionality
- Demonstrates BC extensibility

**Holiday Calendar:**
- Standard BC holiday setup
- Major holidays configured
- Kingdom-specific variants as needed

**Historical Data:**
- Plague crisis: AC 2244-2245
- Business founding: AC 2246
- Current operations: AC 2247
- Demo data spans ~1-2 years of transactions

---

*This document establishes the temporal framework for all business operations, scheduling, and cultural events in the Nubimancy world.*
