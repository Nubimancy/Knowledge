# Bran's Caravans of Fortune - Locations

**Focus:** Physical locations, warehouses, meetup points, and BC location data requirements

---

## Location Strategy

**Business Model:** Multi-realm logistics requires strategic location placement

**Location Types:**
1. **Warehouses/Distribution Centers:** Permanent facilities for storage and coordination
2. **Meetup Points:** Designated delivery/pickup locations in each served city
3. **Partner Facilities:** Shared locations (e.g., with Thorin's Port & Pour)

---

## Primary Locations

### Headquarters / Main Distribution Center
**City:** [To be determined]
**Realm:** [To be determined]

**Purpose:**
- Central operations hub
- Primary inventory storage
- Captain coordination center
- Administrative offices

**BC Location Card Setup:**
```
Location Code: [TBD]
Name: [TBD]
Address: [TBD]
City: [TBD]
Use As In-Transit: [Yes/No]
Require Put-away: [Yes/No]
Require Pick: [Yes/No]
Require Receive: [Yes/No]
Require Shipment: [Yes/No]
Custom Fields:
  - Realm: [TBD]
  - Geographic Type: [Floating/Underground/Surface/etc.]
  - Portal Access: [Yes/No]
  - Climate Zone: [TBD]
```

---

## Regional Distribution Centers

### [City Name] Distribution Center
[Repeat pattern for each major distribution hub]

**Strategic Rationale:**
[Why this location? What regions does it serve?]

---

## Meetup Points (per City)

### Nimbuspire Meetup
**Location Type:** Meetup Point (Not full warehouse)

**Purpose:**
- Customer pickup/delivery point
- Captain check-in location
- Local coordination hub

**BC Location Card Setup:**
```
Location Code: NIMBUS-MP
Name: Nimbuspire Meetup Point
Use As In-Transit: No
[Simplified setup - no warehouse management]
Custom Fields:
  - Realm: [TBD]
  - Meetup Schedule: [TBD]
  - Local Contact: [TBD]
```

---

### Goldentarn Meetup
[Repeat for all 20+ served cities]

---

## Shared Facilities

### Thorin Partnership Locations
**Cities:** [To be determined - where do Bran and Thorin share warehouse space?]

**Arrangement:**
[To be determined - how is shared space managed in BC?]

**BC Setup:**
- Separate location codes?
- Shared location with bin management?
- [To be determined]

---

## In-Transit Locations

**Purpose:** Track shipments between locations

**BC Setup:**
```
Location Code: IN-TRANSIT
Name: Goods in Transit
Use As In-Transit: Yes
[Setup for transfer order tracking]
```

---

## Location-Specific Capabilities

### Portal-Accessible Locations
[List locations with portal access and implications]

### Climate-Controlled Facilities
[List locations with magical preservation capabilities]

### High-Security Locations
[For valuable/sensitive cargo]

---

## Geographic Challenges by Location

### Floating Cities (Nimbuspire, etc.)
**Challenge:** Access requires flight or magical lifts
**Solution:** [How does Bran handle this?]

### Underground Cities (Helm's Call, Underhelm)
**Challenge:** Limited surface access, tunnel logistics
**Solution:** [How does Bran handle this?]

### Desert Realms (Siroccane)
**Challenge:** Extreme climate, preservation needs
**Solution:** [How does Bran handle this?]

### Coastal Cities (Bellharbor, Seastrand)
**Challenge:** Sea access, maritime coordination
**Solution:** [How does Bran handle this?]

---

## Transfer Routes

**Primary Routes:**
[To be determined - which locations transfer to which?]

**Route Characteristics:**
- Distance
- Travel time
- Geographic difficulty
- Preferred transportation method (land, sea, portal)

---

## BC Location Data Requirements Summary

**Required Locations:**
- [Count] distribution centers/warehouses
- [Count] meetup points
- 1 in-transit location
- [Count] shared facilities

**Warehouse Management Levels:**
- Full warehouse mgmt: [List locations]
- Basic location tracking: [List locations]

**Custom Location Fields (PTE):**
- Realm Code (relates to Nimbus Core city registry)
- Geographic Type
- Portal Access Indicator
- Climate Zone
- Meetup Schedule
- Geographic Difficulty Rating
- [Other magical commerce fields]

---

## Integration with PTEs

**Multi-planar Shipping PTE:**
- Route planning between locations
- Geographic challenge calculations
- Portal routing logic

**Enhanced Inventory PTE:**
- Climate-specific preservation by location
- Real-time scrying updates across locations

**Nimbus Core Foundation:**
- Location relationships to city registry
- Cultural commerce rules per location

---

*This document defines Bran's physical locations and the BC master data needed to represent them.*
