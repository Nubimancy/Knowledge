---
title: "Open Questions for Development"
tags: ["worldbuilding", "development", "questions", "planning"]
summary: "Remaining worldbuilding questions that need answers to support the demo business platform"
updated: 2025-10-21
---

# Open Questions for Development

**Purpose:** Track remaining worldbuilding questions for Nubimancy demo development.

---

## ✅ ANSWERED - See Dedicated Documents

The following major question categories have been answered and moved to dedicated files:

1. **Scale & Numbers** → See [geography.md](./geography.md) - Population, travel times, world scale
2. **Currency & Economics** → See [economics-and-currency.md](./economics-and-currency.md) - All pricing, wages, exchange rates
3. **Calendar & Time System** → See [calendar-and-time.md](./calendar-and-time.md) - AC calendar, moons, holidays
4. **Measurement Systems** → See [measurements-and-units.md](./measurements-and-units.md) - Weight, volume, distance units
5. **Nubimancy System** → See [nubimancy-system.md](./nubimancy-system.md) - Crystal tablets, Ledger Realm, automatons

---

## 🔶 HIGH PRIORITY - Still Needed

### 1. Trade Goods Reality ⭐⭐⭐

**Why Critical:** Can't create BC item master data or realistic sales orders without this

**What's Needed:**
- [ ] Specific export goods for each major city (not just categories)
- [ ] Typical shipment examples with actual items
- [ ] Seasonal goods and harvest timings
- [ ] Prohibited/restricted goods by kingdom
- [ ] Item pricing (integrate with economics.md pricing)

**Example Format Needed:**
```
Goldentarn → Ashford shipment:
- 50 bushels of grain @ 2 gold/bushel = 100 gold
- 10 barrels of wine @ 15 gold/barrel = 150 gold
Total cargo value: 250 gold
Shipping cost: 35 gold (Yellow route, 2 cwt, 400 miles)
```

**Impact:** Unlocks sales orders, inventory planning, route optimization

---

### 2. Guild Structures & Labor ⭐⭐

**Why Important:** Affects BC HR/payroll setup significantly

**Caravan Captain Guild:**
- [ ] Governance structure
- [ ] Membership requirements & dues
- [ ] Benefits (insurance, retirement, training)

**Employment Classification:**
- [ ] Captains: Employees or contractors?
- [ ] Guards: Employed by whom?
- [ ] Tax implications

**Certification:**
- [ ] Training duration/process
- [ ] Levels and recertification

**Impact:** BC HR setup, payroll processing

---

### 3. Magic Availability & Costs ⭐

**Why Important:** Service tier differentiation

**Needed:**
- [ ] Magical scroll costs
- [ ] Scrying service pricing
- [ ] Portal costs per person/weight
- [ ] Preservation enchantment costs
- [ ] Ward pricing and duration
- [ ] Who can use magic (population %)

**Impact:** Premium service pricing, operating costs

---

## 🔷 MEDIUM PRIORITY

### 4. Technology Level Consistency
- [ ] Writing materials and record-keeping
- [ ] Non-magical communication methods
- [ ] Timekeeping tools
- [ ] Non-magical preservation methods

### 5. Daily Life & Culture
- [ ] Work hours and patterns
- [ ] Tavern culture and meal customs
- [ ] Social class structures

### 6. Post-Plague Specifics
- [ ] Health protocols details
- [ ] Psychological impacts
- [ ] New regulations

### 7. Competition & Market
- [ ] Competitor names and details
- [ ] Market share estimates
- [ ] Portal service providers

### 8. Government & Regulation
- [ ] Licensing requirements
- [ ] Trade regulations
- [ ] Contract law
- [ ] Taxation

### 9. Literacy & Education
- [ ] Literacy rates by kingdom
- [ ] Education systems

---

## 🎯 Recommended Next Steps

**Immediate Focus:**
1. **Trade Goods** + **Bran's Routes** - Create actual demo data
2. **Magic Costs** - Finalize service pricing

**Then:** Guild Structures, Competition details

---

*Updated: 2025-10-21 - Reorganized, moved answered content to dedicated files*
