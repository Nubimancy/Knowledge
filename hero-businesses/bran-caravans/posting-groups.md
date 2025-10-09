# Bran's Caravans of Fortune - Posting Groups

**Focus:** BC posting group setup to enable proper G/L integration

---

## Posting Group Overview

BC posting groups connect master data (customers, vendors, items) to the G/L accounts. Bran's business requires posting groups that reflect:
- Service-based business model
- Multi-realm operations
- Different customer/vendor types
- Service type variations

---

## Customer Posting Groups

### DOMESTIC (placeholder name)
**Purpose:** Standard customers within primary operating realm
**Receivables Account:** 10200 - Accounts Receivable

---

### CROSS-REALM (placeholder name)
**Purpose:** Customers in different realms requiring special handling
**Receivables Account:** 10200 - Accounts Receivable
**Special Considerations:** [Cultural commerce rules? Extended payment terms?]

---

### [Other customer posting groups TBD based on customers.md]

---

## Vendor Posting Groups

### SUPPLIER
**Purpose:** Standard equipment and supply vendors
**Payables Account:** 20100 - Accounts Payable

---

### CAPTAIN
**Purpose:** Caravan Captain Guild members
**Payables Account:** 20200 - Captain Compensation Payable
**Special Considerations:** [How are captains treated - vendors or employees?]

---

### SERVICE
**Purpose:** Portal services, communication services, other service providers
**Payables Account:** 20100 - Accounts Payable

---

### [Other vendor posting groups TBD based on vendors.md]

---

## General Business Posting Groups

These represent the nature of the business relationship (customer/vendor type).

### B-DOMESTIC
**Description:** Domestic/standard business customers
**Purpose:** Used on customer cards for standard realm customers

---

### B-CROSSREALM
**Description:** Cross-realm business customers
**Purpose:** Used on customer cards for multi-realm customers

---

### V-SUPPLIER
**Description:** Standard suppliers
**Purpose:** Used on vendor cards for equipment/supply vendors

---

### V-CAPTAIN
**Description:** Captain compensation
**Purpose:** Used on vendor cards for Caravan Captain Guild

---

### V-SERVICE
**Description:** Service providers
**Purpose:** Used on vendor cards for portal/communication services

---

### [Other gen. business posting groups TBD]

---

## General Product Posting Groups

These represent the nature of the goods/services being sold/purchased.

### P-STDSHIP
**Description:** Standard shipping services
**Purpose:** Used on service items for standard cross-realm shipping

---

### P-EXPSHIP
**Description:** Expedited shipping services
**Purpose:** Used on service items for expedited/urgent shipping

---

### P-PORTAL
**Description:** Portal shipping services
**Purpose:** Used on service items for portal-based transportation

---

### P-PRESERVE
**Description:** Preservation services
**Purpose:** Used on service items for magical preservation services

---

### P-EQUIPMENT
**Description:** Equipment purchases
**Purpose:** Used on purchased items for caravan equipment

---

### [Other gen. product posting groups TBD]

---

## Inventory Posting Groups

**Applicability:** [TBD - does Bran maintain inventory requiring inventory posting groups?]

### [To be determined based on items.md inventory model]

---

## VAT Product Posting Groups

**Note:** Adjust for magical realm tax structure (not traditional VAT)

### VAT-STANDARD
**Description:** Standard realm commerce tax
**Purpose:** [To be determined based on worldbuilding]

---

### VAT-EXEMPT
**Description:** Tax-exempt services/goods
**Purpose:** [To be determined - are certain cross-realm services exempt?]

---

### [Other VAT posting groups TBD based on world commerce rules]

---

## General Posting Setup Matrix

This table connects Gen. Business Posting Groups with Gen. Product Posting Groups to determine which G/L accounts are used.

| Gen. Bus. Post. Group | Gen. Prod. Post. Group | Sales Account | COGS Account | Purch. Account |
|----------------------|------------------------|---------------|--------------|----------------|
| B-DOMESTIC | P-STDSHIP | 40100 | 50100 | - |
| B-DOMESTIC | P-EXPSHIP | 40110 | 50100 | - |
| B-DOMESTIC | P-PORTAL | 40120 | 50110 | - |
| B-DOMESTIC | P-PRESERVE | 40130 | 50120 | - |
| B-CROSSREALM | P-STDSHIP | 40100 | 50100 | - |
| B-CROSSREALM | P-EXPSHIP | 40110 | 50100 | - |
| B-CROSSREALM | P-PORTAL | 40120 | 50110 | - |
| B-CROSSREALM | P-PRESERVE | 40130 | 50120 | - |
| V-SUPPLIER | P-EQUIPMENT | - | - | 60200 |
| V-CAPTAIN | P-STDSHIP | - | 50100 | 50100 |
| V-SERVICE | P-PORTAL | - | - | 50110 |
| [Continue matrix...] | | | | |

**Note:** This is initial planning. Actual setup may require additional combinations based on business needs.

---

## Posting Group Naming Conventions

**Customer/Vendor Posting Groups:** Descriptive names (DOMESTIC, CAPTAIN, etc.)
**Gen. Business Posting Groups:** B- prefix for customers, V- prefix for vendors
**Gen. Product Posting Groups:** P- prefix + service/product description
**Inventory Posting Groups:** I- prefix (if needed)
**VAT Posting Groups:** VAT- prefix

---

## Integration with PTEs

**Considerations:**
- Do PTEs require additional posting groups?
- Multi-planar Shipping: Portal-specific cost tracking?
- Enhanced Inventory: Climate preservation cost allocation?
- Trade Intelligence Hub: Analytics as separate service line?

[To be determined as PTEs are developed]

---

## Related Documents

- [chart-of-accounts.md](chart-of-accounts.md) - G/L accounts used in posting setup
- [customers.md](customers.md) - Customer segments requiring posting groups
- [vendors.md](vendors.md) - Vendor types requiring posting groups
- [items.md](items.md) - Services/items requiring product posting groups

---

*This document defines the posting group structure that enables Bran's business transactions to properly integrate with the G/L.*
