# BC Master Data Validation Report

**Prepared by:** @copilot (BC Validation Agent)  
**Date:** 2026-03-15  
**Repository:** Nubimancy/Knowledge  
**Scope:** All 73 CSV files in `worldbuilding/data-planning/`

> **Note:** The originating issue referenced 22 CSV files; the actual folder contains **73 files** covering both core BC master data (files 01–14) and all Aethernet Assembly extension tables (files 15–73). All 73 have been assessed.

---

## Validation Methodology

Each file was evaluated against the following criteria, as documented in the folder [README](./README.md):

| Criterion | Standard Applied |
|-----------|-----------------|
| **Field Names** | AL Caption convention with underscores (e.g., `Country_Region_Code` = `Country/Region Code`) |
| **Required Fields** | BC base table minimum fields needed to import via Configuration Package |
| **Data Types / Formats** | BC field types: Option enums, Boolean, Date Formula, Code vs. Text |
| **Cross-Reference Integrity** | FK fields reference the correct BC or extension table |
| **BC Entity Mapping** | Standard table or confirmed custom extension per README |

**Legend for Recommended Action:**

- 🟢 **READY** — Structure complete; populate data and import
- 🟡 **MINOR** — Small additions or clarifications needed before full import
- 🔴 **REVIEW** — Missing BC-required fields that could block import or posting

---

## Section 1 — Core BC Master Data (Files 01–14)

These files map directly to standard Business Central setup tables. They are the highest-priority files for BC import compliance.

| File Name | BC Entity Mapping | Missing Required Fields | Format Concerns | Recommended Action |
|-----------|-------------------|------------------------|-----------------|-------------------|
| **01-kingdoms-countries.csv** | `Country/Region` (Table 9) + worldbuilding extension | `EU_Country_Region_Code` (boolean, needed for EU VAT rules); `Intrastat_Code`; `VAT_Scheme` | `Country_Code` must be 2-character ISO-3166-1 alpha-2 (e.g., `GB`, `DE`); `Address_Format` must match BC enum: `Blank`, `City+County+Post Code`, `City+Post Code`, `Blank+City+County`; `Currency_Code` is not a native BC Country/Region field — treat as extension | 🟡 MINOR — Add `EU_Country_Region_Code`, `Intrastat_Code`, `VAT_Scheme`; confirm 2-char codes |
| **02-chart-of-accounts.csv** | `G/L Account` (Table 15) | `Direct_Posting` (boolean, required to allow journal postings); `Blocked` (boolean); `Gen_Posting_Type` (Blank/Purchase/Sale — controls tax calculation); `Gen_Bus_Posting_Group`; `Gen_Prod_Posting_Group`; `VAT_Bus_Posting_Group`; `VAT_Prod_Posting_Group`; `Reconciliation_Account` (boolean) | `Account_Type` values must match BC enum exactly: `Posting`, `Heading`, `Total`, `Begin-Total`, `End-Total`; `Balance_Sheet_Type` and `Income_Statement_Type` are non-standard — BC uses a single `Income/Balance` field (enum: `Income Statement`, `Balance Sheet`); consolidate these two columns into one `Income_Balance` field | 🔴 REVIEW — Add `Direct_Posting`, `Blocked`, `Gen_Posting_Type`, posting group columns; rename balance/income type field |
| **03-number-series.csv** | `No. Series` (Table 308) + `No. Series Line` (Table 309) | `Default_Nos` (boolean — whether this is the default series for an entity); `Manual_Nos` (boolean — whether manually entered numbers are allowed) | `Increment` maps to BC field `Increment-by No.` (integer, not decimal); `Allow_Gaps` is boolean (TRUE/FALSE); `Date_Order` is boolean; `Starting_No` / `Ending_No` must be Code[20] strings matching the pattern of the number being generated (e.g., `CUST-0001`) | 🟡 MINOR — Add `Default_Nos` and `Manual_Nos` columns |
| **04-dimensions.csv** | `Dimension` (Table 348) + `Dimension Value` (Table 349) | `Totaling` (Code[250], required for `Total` / `End-Total` value type rows to define the summing range); `Map_to_IC_Dimension_Code` (for intercompany dimension mapping) | `Value_Type` must match BC enum exactly: `Standard`, `Heading`, `Total`, `Begin-Total`, `End-Total` (not custom values); `Blocked` is boolean | 🟡 MINOR — Add `Totaling` column for Total-type rows; confirm `Value_Type` enum values |
| **05-business-register.csv** | Custom extension (`BusinessRegister` Table) — source-of-truth lookup, not a native BC table | No BC counterpart; used to derive Customers, Vendors, Contacts | `Available_As_Customer`, `Available_As_Vendor`, `Available_As_Bank` are boolean flags — confirm TRUE/FALSE format; `Registration_Date` must be BC Date format (YYYY-MM-DD or locale-dependent) | 🟢 READY — Custom extension table; well-structured as source registry |
| **06-customers-by-company.csv** | `Customer` (Table 18) | `Address`; `Address_2`; `City`; `Post_Code`; `Country_Region_Code` (all required for document printing and tax jurisdiction); `Phone_No`; `Email`; `Contact`; `Blocked` (enum: blank/Ship/Invoice/All); `Payment_Method_Code`; `Invoice_Disc_Code`; `Fin_Charge_Terms_Code`; `Reminder_Terms_Code` | `Credit_Limit` is Decimal — omit thousand-separators; `Discount_Percent` is Decimal (0–100); `Payment_Terms` maps to BC `Payment Terms Code` (Code[10]); `Language_Code` maps to BC `Language Code` (Code[10] IETF tag) | 🔴 REVIEW — Add address block fields and `Blocked`; these are required for functional customer records |
| **07-vendors-by-company.csv** | `Vendor` (Table 23) | `Address`; `Address_2`; `City`; `Post_Code`; `Country_Region_Code`; `Phone_No`; `Email`; `Contact`; `Blocked` (enum: blank/Payment/All); `Payment_Method_Code`; `Invoice_Disc_Code`; `Our_Account_No` | `Lead_Time_Days` maps to BC `Lead Time Calculation` (Date Formula, e.g., `5D` not integer `5`); `Discount_Percent` is Decimal (0–100); `Credit_Limit` is Decimal | 🔴 REVIEW — Add address block fields and `Blocked`; change `Lead_Time_Days` to Date Formula format |
| **08-items.csv** | `Item` (Table 27) | `Blocked` (boolean); `Search_Description` (Code[50], used for BC item search); `Item_Category_Code` (the field contains the category value but BC's field is `Item Category Code` — naming is fine per README convention) | `Item_Type` maps to BC `Type` enum: `Inventory`, `Non-Inventory`, `Service` — confirm values match exactly; `Costing_Method` enum values: `FIFO`, `LIFO`, `Average`, `Specific`, `Standard`; `Lead_Time_Calculation` must be Date Formula (e.g., `2W`, not integer); `Reorder_Point`, `Reorder_Quantity`, `Maximum_Inventory`, `Safety_Stock_Quantity` are all Decimal | 🟡 MINOR — Add `Blocked` and `Search_Description`; verify `Item_Type` enum values and Date Formula format |
| **09-services.csv** | `Item` (Type=Service) or `Resource` (Table 27 / Table 156) | `Inventory_Posting_Group` (required if imported as Item/Service type); `Blocked` (boolean); definitive BC table target unclear — `Service_No` field naming does not follow BC `No.` pattern | This file conflates Items (Service type) and Resources in one schema. BC handles these as two separate tables with different required fields. `Service_Type` needs to indicate target table: `Item` vs. `Resource`; if Resource, needs `Resource_Type` (Person/Machine) | 🔴 REVIEW — Split into Item (Service) and Resource imports, or add `BC_Table_Target` field; add `Inventory_Posting_Group` |
| **10-posting-groups.csv** | Multiple BC tables: `Gen. Business Posting Group` (Table 328), `Gen. Product Posting Group` (Table 251), `Gen. Posting Setup` (Table 252), `Customer Posting Group` (Table 92), `Vendor Posting Group` (Table 93) | For `Gen. Posting Setup`: `Purch_Account` (Purchase Account); `Sales_Returns_Account`; `Purch_Returns_Account`; `Adjustment_Account`. For `Customer Posting Group`: `Receivables_Account`; `Service_Charge_Account`; `Payment_Disc_Debit_Account`; `Payment_Disc_Credit_Account`. For `Vendor Posting Group`: `Payables_Account`; `Payment_Disc_Debit_Account`; `Payment_Disc_Credit_Account` | `Posting_Group_Type` discriminator is a non-standard approach — BC imports each posting group type into a separate table; a single flat file with a type column will require a custom import mapping per row type; `Def_VAT_Bus_Posting_Group` and `Def_VAT_Prod_Posting_Group` belong to `Gen. Bus./Prod. Posting Group` headers, not the Setup rows | 🔴 REVIEW — Consider splitting into separate files per posting group type; add payables/receivables account fields |
| **11-locations-by-company.csv** | `Location` (Table 14) | `Name_2` (second name line, optional but common in BC); `Adjustment_Bin_Code`; `Shipment_Bin_Code`; `Receipt_Bin_Code`; `Cross_Dock_Bin_Code` (required when `Bin_Mandatory=TRUE` and warehouse management enabled) | `Cross_Dock_Due_Date_Calc` must be a BC Date Formula string (e.g., `1D`, `2W`), not a date or integer; `Use_As_In_Transit`, `Require_Put_away`, `Require_Pick`, `Require_Receive`, `Require_Shipment`, `Bin_Mandatory`, `Directed_Put_away_and_Pick`, `Use_Cross_Docking` are all boolean | 🟡 MINOR — Fix `Cross_Dock_Due_Date_Calc` to Date Formula; add bin code fields for WMS locations |
| **12-inventory-posting-setups.csv** | `Inventory Posting Setup` (Table 5813) | No critical fields missing — all standard BC Inventory Posting Setup fields are present | All G/L account fields are Code[20]; `Location_Code` and `Invt_Posting_Group` form the composite primary key for this table (both required, present ✅) | 🟢 READY — Well-structured; populate GL account numbers matching chart-of-accounts file |
| **13-resources-by-company.csv** | `Resource` (Table 156) | `Blocked` (boolean); `Search_Name` (Code[50]) | `Resource_Type` must match BC enum: `Person`, `Machine`; `Price_Profit_Calculation` must match BC enum: `Cost+Profit %`, `Direct Unit Cost`; `Employment_Date` is BC Date format; `Use_Time_Sheet` is boolean | 🟡 MINOR — Add `Blocked` and `Search_Name` |
| **14-fixed-assets-by-company.csv** | `Fixed Asset` (Table 5600) + `FA Depreciation Book` (Table 5612) | `Blocked` (boolean on FA); `Search_Description` (Code[50]) | `Depreciation_Method` must match BC enum: `Straight-Line`, `Declining-Balance`, `DB1`, `DB2`, `DB1/SL`, `DB2/SL`, `User-Defined`, `Manual`; FA Depreciation Book fields (`Depreciation_Method`, `No_of_Depreciation_Years`, etc.) belong to a separate table in BC — a single flat file will require split import; `Acquisition_Cost` and `Book_Value` are Decimal | 🟡 MINOR — Add `Blocked`; note that FA + Depreciation Book must be split for import (two separate config package tables) |

---

## Section 2 — NimbusCoreFoundation Extension Tables (Files 15–27)

These tables are custom AL extension entities defined in the `NimbusCoreFoundation` extension. BC validation focuses on cross-reference integrity with BC standard tables rather than native BC field requirements.

| File Name | BC Entity Mapping | Missing Required Fields | Format Concerns | Recommended Action |
|-----------|-------------------|------------------------|-----------------|-------------------|
| **15-cities.csv** | `City` (Table 80001) — custom extension | No missing fields for this custom table | `Country_Region_Code` (Code[10]) must match values in `01-kingdoms-countries.csv`; `Established_Date` is BC Date format; `Latitude` / `Longitude` are Decimal | 🟢 READY — Well-defined lookup table; ensure Country_Region_Code values align |
| **16-guilds.csv** | `Guild` (Table 80010) — custom extension | No missing fields for this custom table | `City_Code` must match `15-cities.csv`; `Country_Region_Code` must match `01-kingdoms-countries.csv`; `Established_Date` is BC Date format; `Status` should define allowed enum values | 🟢 READY — Compact, clean lookup table |
| **17-cultural-traditions.csv** | `CulturalTradition` (Table 80022) — custom extension | No critical fields missing | `Country_Region_Code` FK to `01-kingdoms-countries.csv`; `Tradition_Code` is primary key (Code) | 🟢 READY — Minimal lookup table, appropriate scope |
| **18-route-difficulty-levels.csv** | `RouteDifficulty` (Table 81001) — custom extension | No critical fields missing | `Cost_Multiplier` and `Speed_Factor` are Decimal; `Safety_Rating` should define scale (e.g., 1–10 integer or 0.0–1.0 decimal) for consistent data entry | 🟢 READY — Document `Safety_Rating` scale in data dictionary |
| **19-route-headers.csv** | `RouteHeader` (Table 81010) — custom extension | No critical fields missing | `Origin_Location_Code` and `Destination_Location_Code` FKs to BC `Location` table (file 11); `Origin_City_Code` / `Destination_City_Code` FKs to `15-cities.csv`; `Distance_km` is Decimal; `Active` is boolean | 🟢 READY — Good FK structure; verify Location_Code references |
| **20-route-segments.csv** | `RouteSegment` (Table 81011) + `RouteSegmentDetail` (Table 50001) — custom extension | No critical fields missing | `Route_Code` FK to `19-route-headers.csv`; `Segment_No` is integer (line number); `Portal_Service_Code` FK to `35-portal-services.csv`; `Has_Magical_Barrier` is boolean; `Customs_Required` is boolean; `Cost_Multiplier` is Decimal | 🟢 READY — Composite key `Route_Code` + `Segment_No` aligns with BC line table pattern |
| **21-warehouse-zones-by-location.csv** | `Zone` (Table 7189, BC WMS) or custom `WarehouseZone` (Table 81030) | If mapping to standard BC `Zone` table: `Bin_Type_Code` (required for WMS zone operations); `Zone_Ranking` (integer, for pick sequence) | `Location_Code` FK to BC `Location` table; `Zone_Type` should align with BC Zone `Bin Type Code` values if using standard WMS; `Capacity` and `Current_Utilization` are Decimal; `Temperature_Controlled` and `Shared_Facility` are boolean | 🟡 MINOR — If using BC standard Zone table, add `Bin_Type_Code` and `Zone_Ranking`; if custom extension, structure is sufficient |
| **22-conservation-contexts.csv** | `ConservationContext` (Table 82031) — custom extension (NimbusExhibition) | No critical fields missing | `Primary_Species_Code` FK to `63-species-profiles.csv`; `Climate_Zone` FK to `31-climate-zones.csv` | 🟢 READY — Clean lookup; confirm FK chains are consistent |
| **23-communication-protocols.csv** | `CommunicationProtocol` (Table 80052) — custom extension | No critical fields missing | `Cost_Per_Message` is Decimal; `Max_Distance_km` is Decimal; `Reliability_Pct` is Decimal (0–100); `Active` is boolean | 🟢 READY — Compact reference table |
| **24-culture-affinities.csv** | `CultureAffinity` (Table 80020) — custom extension | No critical fields missing | `Country_Region_Code` FK to `01-kingdoms-countries.csv`; `City_Code` FK to `15-cities.csv`; `Cultural_Affinity` should define allowed enum values (e.g., Favorable/Neutral/Unfavorable) | 🟢 READY — Document `Cultural_Affinity` enum values |
| **25-guild-certifications.csv** | `GuildCertification` (Table 80012) — custom extension | No critical fields missing | `Guild_Code` FK to `16-guilds.csv`; `Required_Training_Hours` is Decimal; `Validity_Period_Months` is integer; `Skill_Level` should define allowed values | 🟢 READY — Complement to Guilds table |
| **26-lunar-cycles.csv** | `LunarCycle` (Table 80040) — custom extension | No critical fields missing | `Cycle_Start_Date` / `Cycle_End_Date` / `Full_Moon_Date` are BC Date format; `Cycle_Length_Days` is integer; `Moon_Type` (Silvara/Coprus) is the discriminating key field | 🟢 READY — Calendar reference data; ensure date format consistency |
| **27-lunar-events.csv** | `LunarEvent` (Table 80042) — custom extension | No critical fields missing | `Event_Date` is BC Date format (primary key); `Duration_Days` is integer; `Silvara_Phase` / `Coprus_Phase` should define allowed phase values | 🟢 READY — Event calendar table; document phase value enum |

---

## Section 3 — Bran Logistics Extension Tables (Files 28–40)

| File Name | BC Entity Mapping | Missing Required Fields | Format Concerns | Recommended Action |
|-----------|-------------------|------------------------|-----------------|-------------------|
| **28-facility-profiles.csv** | `FacilityProfile` (Table 82020) — NimbusExhibition extension | No critical fields missing | `Location_Code` FK to BC `Location` table (file 11); `City_Code` FK to `15-cities.csv`; `Capacity` and `Daily_Rate` are Decimal; `Active` is boolean; `Maintenance_Schedule` should define format (Date Formula or free text) | 🟢 READY — Clean facility reference table |
| **29-quality-checkpoints-nimbus.csv** | `QualityCheckpoint` (Table 83030) — NimbusManufacturing extension | No critical fields missing | `Pass_Threshold` / `Fail_Threshold` are Decimal; `Sequence_Order` is integer; `Mandatory` is boolean; `Measurement_Unit` should reference BC `Unit of Measure` (Code[10]) | 🟡 MINOR — Consider linking `Measurement_Unit` to BC Unit of Measure table for import consistency |
| **30-retail-location-profiles.csv** | `RetailLocationProfile` (Table 83060) — NimbusManufacturing extension | No critical fields missing | `Location_Code` FK to BC `Location` table (primary key reference); `Reorder_Point` / `Safety_Stock` / `Display_Capacity` are Decimal; `Active` is boolean; `City_Code` FK to `15-cities.csv` | 🟢 READY — Location extension table; well-structured |
| **31-climate-zones.csv** | `ClimateZone` (Table 51000) — BranArcaneScrollProcessing extension | No critical fields missing | `Base_Temperature_Min` / `Base_Temperature_Max` are Decimal (Celsius); `Humidity_Level` should define units/scale; `Magical_Interference` should define scale; `Degradation_Rate_Modifier` is Decimal | 🟢 READY — Reference table for preservation logic |
| **32-scroll-senders.csv** | `ScrollSender` (Table 51005) — BranArcaneScrollProcessing extension | No critical fields missing | `Customer_No` FK to BC `Customer` table (file 06); `Enabled` is boolean | 🟢 READY — Short reference table; FK to Customer well-established |
| **33-scrying-service-providers.csv** | `ScryingServiceProvider` (Table 51003) — BranArcaneScrollProcessing extension | No critical fields missing | `Accuracy_Percentage` is Decimal (0–100); `Scrying_Frequency_Days` is integer; `Enabled` is boolean | 🟢 READY — Compact vendor-adjacent reference table |
| **34-preservation-requirements.csv** | `PreservationRequirement` (Table 51001) — BranArcaneScrollProcessing extension | No critical fields missing | `Item_No` FK to BC `Item` table (file 08); `Climate_Zone_Code` FK to `31-climate-zones.csv`; composite PK `Item_No` + `Climate_Zone_Code`; all threshold/rate fields are Decimal; `Is_Compatible` is boolean | 🟢 READY — Cross-reference table with correct composite key pattern |
| **35-portal-services.csv** | `PortalService` (Table 50002) — BranMysticalRoutePlanning extension | `Shipping_Agent_Code` (if linking to BC `Shipping Agent` for financial posting) | `Origin_Location_Code` / `Destination_Location_Code` FKs to BC `Location`; `Origin_City_Code` / `Destination_City_Code` FKs to `15-cities.csv`; `Base_Cost` / `Cost_Per_kg` are Decimal; `Max_Weight_kg` / `Max_Volume_cbm` / `Daily_Capacity` are Decimal; `Transit_Time_Minutes` is integer; `Dimensional_Capable` is boolean | 🟡 MINOR — Consider adding `Shipping_Agent_Code` FK for BC financial integration |
| **36-contested-route-locations.csv** | `ContestedRouteLocation` (Table 50025) — BranMysticalRoutePlanning extension | No critical fields missing | `Location_Code` FK to BC `Location` table (primary key); `Active_Conflict` is boolean; `Conflict_Start_Date` is BC Date format; `Required_Permit_No` FK to `37-dual-kingdom-permits.csv` | 🟢 READY — Location extension; FK chain is clear |
| **37-dual-kingdom-permits.csv** | `DualKingdomPermit` (Table 50020) — BranMysticalRoutePlanning extension | No critical fields missing | `Route_Code` FK to `19-route-headers.csv`; `Issue_Date` / `Expiry_Date` are BC Date format; `Status` should define allowed enum values (Active/Expired/Suspended) | 🟢 READY — Regulatory document table; document `Status` enum |
| **38-caravan-squads.csv** | `CaravanSquad` (Table 50018) — BranMysticalRoutePlanning extension | No critical fields missing | `Base_Location_Code` FK to BC `Location` table; `Captain_Guild_Code` FK to `16-guilds.csv`; `Active` is boolean; `Formation_Date` is BC Date format | 🟢 READY — Team/group reference table |
| **39-rush-pricing-tiers.csv** | `RushPricingTier` (Table 50022) — BranMysticalRoutePlanning extension | No critical fields missing | `Surcharge_Pct` is Decimal (0–100+); `Max_Delivery_Hours` is Decimal; `Portal_Priority` and `Skip_Optional_Safety_Checks` are boolean | 🟢 READY — Pricing modifier reference table |
| **40-cultural-compliance-rules.csv** | `CulturalComplianceRule` (Table 52010) — BranCaravanFestivalCoordination extension | No critical fields missing | `Country_Region_Code` FK to `01-kingdoms-countries.csv`; `City_Code` FK to `15-cities.csv`; `Item_Category_Code` FK to BC `Item Category`; `Item_No` FK to BC `Item` (file 08); `Prohibited` / `Permit_Required` / `Customs_Clearance_Required` / `Active` are boolean; `Effective_Date` / `Expiry_Date` are BC Date format; `Customs_Fee` is Decimal | 🟢 READY — Rich compliance rule table with good FK coverage |

---

## Section 4 — Thorin Brewery Extension Tables (Files 41–49)

| File Name | BC Entity Mapping | Missing Required Fields | Format Concerns | Recommended Action |
|-----------|-------------------|------------------------|-----------------|-------------------|
| **41-transport-modes.csv** | `TransportMode` (Table 64000) — ThorinCommunityEventOrchestration extension | `Shipping_Agent_Code` (Code[10], if linking to BC `Shipping Agent` for purchase/sales orders) | `Cost_Per_Mile` is Decimal; `Average_Speed_MPH` is Decimal; `Capacity_Barrels` is Decimal; `Weather_Dependent` is boolean; `Security_Level` should define scale | 🟡 MINOR — Consider adding `Shipping_Agent_Code` link to BC Shipping Agent for order processing |
| **42-ale-type-profiles.csv** | `AleTypeProfile` (Table 62013) — ThorinDwarvenAleQualityTracking extension | `Item_No` (Code[20], FK to BC `Item` — links ale profile to an actual inventory item for purchasing/sales) | `Optimal_Serving_Temp_C` is Decimal; `Optimal_Delivery_Window_Days` / `Max_Shelf_Life_Days` are integer; `Season_Start_Month` / `Season_End_Month` are integer (1–12); `Limited_Edition` / `Lunar_Cycle_Dependent` / `Seasonal_Availability` are boolean; `Degradation_Factor` is Decimal | 🟡 MINOR — Add `Item_No` FK to connect ale profiles to BC Item records |
| **43-preservation-compatibility-matrix.csv** | `PreservationCompatibilityMatrix` (Table 62014) — ThorinDwarvenAleQualityTracking extension | No critical fields missing | Composite PK `Ale_Type_Code` + `Enchantment_Type`; `Ale_Type_Code` FK to `42-ale-type-profiles.csv`; `Enchantment_Type` FK to `50-enchantment-types.csv`; `Effectiveness_Pct` / `Degradation_Modifier` are Decimal; `Recommended` is boolean | 🟢 READY — Cross-reference matrix with clear FK structure |
| **44-quality-checkpoints-thorin.csv** | `QualityCheckpoint` (Table 62015) — ThorinDwarvenAleQualityTracking extension | No critical fields missing | `Location_Code` FK to BC `Location` table; `Sequence_No` is integer; `Requires_Taste_Profile` / `Requires_Purity_Score` / `Requires_Potency_Rating` / `Requires_Preservation_Check` are boolean | 🟢 READY — QA checkpoint definition table |
| **45-brewery-sourcing-contracts.csv** | `BrewerySourcingContract` (Table 62019) — ThorinDwarvenAleQualityTracking extension | `Currency_Code` (Code[10], for contract value denomination); `Payment_Terms_Code` (for financial terms) | `Brewery_Vendor_No` FK to BC `Vendor` (file 07); `Contract_Start` / `Contract_End` are BC Date format; `Min_Volume_Commitment` is Decimal; `Exclusivity` is boolean; `Status` should define allowed enum values | 🟡 MINOR — Add `Currency_Code` and `Payment_Terms_Code` for financial integration |
| **46-partnership-tiers.csv** | `PartnershipTier` (Table 63002) — ThorinTavernNetworkRelationshipManagement extension | `Customer_Price_Group_Code` (Code[10], FK to BC `Customer Price Group` — needed to apply discounts automatically in BC) | `Min_Annual_Barrels` / `Max_Annual_Barrels` are Decimal; `Min_Payment_On_Time_Pct` / `Min_Satisfaction_Rating` / `Discount_Percentage` are Decimal; `Grace_Period_Days` is integer; `Exclusive_Ale_Access` / `Event_Invitations` / `Promotional_Support` / `Curated_Selection_Service` are boolean | 🟡 MINOR — Add `Customer_Price_Group_Code` to connect discount tiers to BC pricing engine |
| **47-tavern-delivery-schedules.csv** | `TavernDeliverySchedule` (Table 63006) — ThorinTavernNetworkRelationshipManagement extension | `Customer_No` (explicit FK to BC `Customer` — `Tavern_No` is ambiguous; clarify mapping) | `Tavern_No` should be clarified as `Customer_No` FK or add separate `Customer_No` field; `Horizon_Days` is integer; `Estimated_Barrels_Per_Delivery` is Decimal; `Active` is boolean; `Frequency` should define allowed enum values (Daily/Weekly/Biweekly/Monthly) | 🟡 MINOR — Clarify `Tavern_No` as explicit `Customer_No` FK; document `Frequency` enum |
| **48-limited-edition-allocations.csv** | `LimitedEditionAllocation` (Table 63008) — ThorinTavernNetworkRelationshipManagement extension | `Item_No` (Code[20], FK to BC `Item` — needed to reserve actual inventory units); `Unit_of_Measure_Code` | `Ale_Type_Code` FK to `42-ale-type-profiles.csv`; `Brewery_Vendor_No` FK to BC `Vendor`; `Release_Date` / `Allocation_Deadline` are BC Date format; `Total_Units` is Decimal (or integer); `Status` should define enum values | 🟡 MINOR — Add `Item_No` and `Unit_of_Measure_Code` for BC inventory integration |
| **49-serving-best-practices.csv** | `ServingBestPractice` (Table 63012) — ThorinTavernNetworkRelationshipManagement extension | No critical fields missing | `Ale_Type_Code` FK to `42-ale-type-profiles.csv` (primary key); `Recommended_Serving_Temp_C` / `Temp_Tolerance_Degrees` are Decimal; all text fields (Pour_Technique, Tasting_Notes, etc.) are Text[250] in BC — consider length | 🟢 READY — Reference/advisory content table; no import blockers |

---

## Section 5 — Delyra Enchantment Extension Tables (Files 50–56)

| File Name | BC Entity Mapping | Missing Required Fields | Format Concerns | Recommended Action |
|-----------|-------------------|------------------------|-----------------|-------------------|
| **50-enchantment-types.csv** | `EnchantmentType` (Table 60000) — DelyraEnchantmentRefreshServices extension | No critical fields missing | `Expected_Lifespan_Days` is integer; `Decay_Rate_Pct` / `Full_Threshold_Pct` / `Moderate_Threshold_Pct` / `Low_Threshold_Pct` / `Critical_Threshold_Pct` are Decimal; `Requires_Lunar_Alignment` is boolean; thresholds must be validated: `Full > Moderate > Low > Critical` | 🟡 MINOR — Add data validation note: threshold fields must be in descending order |
| **51-refresh-process-templates.csv** | `RefreshProcessTemplate` (Table 60010) — DelyraEnchantmentRefreshServices extension | `Work_Center_Code` (if refresh processes should link to BC Work Center for capacity planning) | `Enchantment_Type_Code` FK to `50-enchantment-types.csv`; `Estimated_Duration_Days` / `Rush_Duration_Days` are integer; `Rush_Premium_Multiplier` is Decimal; `Rush_Capable` / `Requires_Lunar_Alignment` / `Active` are boolean | 🟡 MINOR — Consider adding `Work_Center_Code` FK to `53-dimensional-work-centers.csv` for production planning |
| **52-volume-pricing-tiers.csv** | `VolumePricingTier` (Table 60015) — DelyraEnchantmentRefreshServices extension | `Item_No` or `Item_Category_Code` (needed to apply tiers to specific BC items); `Sales_Type` / `Sales_Code` (to scope tiers to customer groups) | `Min_Quantity` / `Max_Quantity` are Decimal; `Discount_Pct` is Decimal; without item/customer scoping, tiers cannot be applied automatically by BC pricing engine | 🔴 REVIEW — Add `Item_No` or `Item_Category_Code` and `Sales_Type`/`Sales_Code` to enable BC price list line integration |
| **53-dimensional-work-centers.csv** | `DimensionalWorkCenter` (Table 59000) — DelyraMultiplanarWorkCenters extension; `BC_Work_Center_No` FK to BC `Work Center` (Table 99000754) | No critical fields missing for custom extension table | `BC_Work_Center_No` correctly references BC Work Center (good); `Time_Acceleration_Ratio` is Decimal; `Safety_Check_Interval_Days` is integer; `Max_Staff_Hours_Per_Day` is Decimal; `Location_Code` FK to BC `Location`; `Dimensional_Status` should define enum values | 🟢 READY — Strong BC integration via `BC_Work_Center_No` reference |
| **54-rare-material-vendors.csv** | `RareMaterialVendor` (Table 59009) — DelyraMultiplanarWorkCenters extension; `BC_Vendor_No` FK to BC `Vendor` | No critical fields missing for custom extension table | `BC_Vendor_No` correctly references BC Vendor (good); `Reliability_Rating` should define scale; `Ethical_Sourcing_Certified` is boolean; `Status` should define enum values | 🟢 READY — Strong BC integration via `BC_Vendor_No` reference |
| **55-portal-gateways.csv** | `PortalGateway` (Table 61000) — DelyraPortalShopManagement extension | No critical fields missing | `Location_Code` FK to BC `Location`; `Connected_Gateway_Code` self-referencing FK; `Max_Transfers_Per_Hour` is Decimal; `Last_Maintenance_Date` / `Operational_Since` are BC Date format; `Base_Transfer_Cost` / `Emergency_Cost_Multiplier` are Decimal; `Status` should define enum values | 🟢 READY — Location-linked gateway reference table |
| **56-shop-profiles.csv** | `ShopProfile` (Table 61006) — DelyraPortalShopManagement extension | No critical fields missing | `Location_Code` FK to BC `Location` (primary key); `City_Code` FK to `15-cities.csv`; `Portal_Gateway_Code` FK to `55-portal-gateways.csv`; `Opening_Date` is BC Date format; `Average_Daily_Customers` is Decimal; `Peak_Season` should define enum values | 🟢 READY — Clean Location-extension profile table |

---

## Section 6 — Rini Arenas Extension Tables (Files 57–62)

| File Name | BC Entity Mapping | Missing Required Fields | Format Concerns | Recommended Action |
|-----------|-------------------|------------------------|-----------------|-------------------|
| **57-arena-profiles.csv** | `ArenaProfile` (Table 53000) — RiniDimensionalTournamentBrackets extension | No critical fields missing | `City_Code` FK to `15-cities.csv`; `Capacity` / `Fighter_Capacity` are Decimal/integer; `Difficulty_Weighting` / `Environmental_Risk_Pct` / `Safety_Threshold_Pct` are Decimal; `Active` is boolean; `Cultural_Combat_Rules` / `Restricted_Techniques` / `Required_Rituals` are Text | 🟢 READY — Arena master reference table |
| **58-tournament-seasons.csv** | `Season` (Table 53020) — RiniDimensionalTournamentBrackets extension | No critical fields missing | `Start_Date` / `End_Date` are BC Date format; `Status` should define enum values (Planning/Active/Completed/Cancelled); `Default_Tournament_Format` should define enum values | 🟢 READY — Calendar/season reference table; document status enums |
| **59-tournament-templates.csv** | `TournamentTemplate` (Table 53010) — RiniDimensionalTournamentBrackets extension | No critical fields missing | `Arena_Profile_Code` FK to `57-arena-profiles.csv`; `Season_Code` FK to `58-tournament-seasons.csv`; `Max_Participants` is integer; `Rounds_Per_Match` / `Match_Duration_Min` are integer; `Active` is boolean; `Bracket_Format` should define enum values | 🟢 READY — Tournament structure template table |
| **60-portal-mage-services.csv** | `PortalMageService` (Table 55020) — RiniMultiRealmSportsBroadcasting extension | `Resource_No` (Code[20], FK to BC `Resource` — portal mages as billable resources); `Gen_Prod_Posting_Group` (for billing integration) | `Base_City_Code` FK to `15-cities.csv`; `Cost_Per_Person` / `Minimum_Booking_Fee` are Decimal; `Max_Capacity_Per_Portal` / `Daily_Portal_Limit` are integer; `Reliability_Rating` should define scale; `Peak_Championship_Approved` is boolean | 🟡 MINOR — Add `Resource_No` FK for billing portal mage services through BC |
| **61-loyalty-programs.csv** | `LoyaltyProgram` (Table 55012) — RiniMultiRealmSportsBroadcasting extension | `Customer_Price_Group_Code` (to apply discounts automatically via BC pricing) | `City_Code` FK to `15-cities.csv`; `Arena_Code` FK to `57-arena-profiles.csv`; `Points_Threshold` is integer; `Season_Ticket_Discount_Pct` is Decimal; `Portal_Priority_Booking` / `VIP_Event_Access` are boolean; `Status` should define enum values | 🟡 MINOR — Add `Customer_Price_Group_Code` link for BC discount automation |
| **62-hall-of-fame-entries.csv** | `HallofFameEntry` (Table 55032) — RiniMultiRealmSportsBroadcasting extension | No critical fields missing | `Induction_Date` is BC Date format; `Induction_Season` FK to `58-tournament-seasons.csv`; `Total_Seasons` / `Total_Matches` / `Championship_Wins` / `Display_Order` are integer; `Featured_Entry` is boolean; `Win_Record` is Text (consider structured format, e.g., `W-L-D`) | 🟢 READY — Historical records table; consider standardizing `Win_Record` format |

---

## Section 7 — Weltina Preserve Extension Tables (Files 63–73)

| File Name | BC Entity Mapping | Missing Required Fields | Format Concerns | Recommended Action |
|-----------|-------------------|------------------------|-----------------|-------------------|
| **63-species-profiles.csv** | `SpeciesProfile` (Table 56000) — WeltinaAdvancedCreatureCareProtocols extension | No critical fields missing | `Min_Temperature_C` / `Max_Temperature_C` are Decimal; `Min_Humidity_Pct` / `Max_Humidity_Pct` are Decimal (0–100); `Critical_Population_Threshold` / `Avg_Lifespan_Years` / `Gestation_Period_Days` are Decimal/integer; `Genetic_Diversity_Threshold` is Decimal; `Lunar_Sensitivity` / `Endangered_Status` should define enum values; `Origin_Region_Code` FK to `01-kingdoms-countries.csv` | 🟢 READY — Rich species master data structure |
| **64-lifecycle-stage-definitions.csv** | `LifecycleStageDefinition` (Table 56001) — WeltinaAdvancedCreatureCareProtocols extension | No critical fields missing | Composite PK `Species_Code` + `Lifecycle_Stage`; `Species_Code` FK to `63-species-profiles.csv`; `Min_Age_Years` / `Max_Age_Years` are Decimal; `Meals_Per_Day` / `Min_Enclosure_Size_sqm` are Decimal; `Vet_Exam_Required_On_Entry` / `Visitor_Interaction_Allowed` are boolean | 🟢 READY — Composite-key detail table; good BC line-table pattern |
| **65-species-compatibility-matrix.csv** | `SpeciesCompatibilityMatrix` (Table 56002) — WeltinaAdvancedCreatureCareProtocols extension | No critical fields missing | Composite PK `Species_Code_A` + `Species_Code_B`; both FKs to `63-species-profiles.csv`; `Diet_Compatible` / `Temperature_Compatible` / `Temperament_Compatible` are boolean; `Compatibility_Rating` should define enum values | 🟢 READY — Cross-reference matrix; document `Compatibility_Rating` enum |
| **66-habitat-profiles.csv** | `HabitatProfile` (Table 58000) — WeltinaMultiHabitatManagement extension | No critical fields missing | `Location_Code` FK to BC `Location`; `Climate_Zone` FK to `31-climate-zones.csv`; `Min_Temperature_C` / `Max_Temperature_C` / `Min_Humidity_Pct` / `Max_Humidity_Pct` / `Total_Capacity_SqM` are Decimal; `Maintenance_Interval_Days` is integer; `Seasonal_Adjustment` is boolean | 🟢 READY — Habitat master with good environmental parameter coverage |
| **67-educational-program-templates.csv** | `EducationalProgramTemplate` (Table 58003) — WeltinaMultiHabitatManagement extension | No critical fields missing | `Habitat_Code` FK to `66-habitat-profiles.csv`; `Min_Age` / `Max_Age` are integer; `Duration_Hours` / `Max_Participants` are Decimal/integer; `Requires_Creature_Interaction` is boolean | 🟢 READY — Program template reference table |
| **68-warden-territories.csv** | `WardenTerritory` (Table 58006) — WeltinaMultiHabitatManagement extension | No critical fields missing | `Country_Region_Code` FK to `01-kingdoms-countries.csv`; `Climate_Zone` FK to `31-climate-zones.csv`; `Seasonal_Availability` should define enum values; `Risk_Level` should define enum values | 🟢 READY — Territory reference table |
| **69-species-yield-profiles.csv** | `SpeciesYieldProfile` (Table 58013) — WeltinaMultiHabitatManagement extension | No critical fields missing | Composite PK `Species_Code` + `Component_Type`; `Species_Code` FK to `63-species-profiles.csv`; `Yield_Cadence_Days` / `Max_Annual_Yield` / `Minimum_Age_Months` are integer; `Seasonal_Modifier` is Decimal; `Requires_Vet_Approval` is boolean | 🟢 READY — Sustainable yield planning table |
| **70-emergency-response-protocols.csv** | `EmergencyResponseProtocol` (Table 58021) — WeltinaMultiHabitatManagement extension | No critical fields missing | `SLA_Hours` is Decimal; `Active` is boolean; `Escalation_Level_1/2/3` are Text — consider whether these reference BC `Resource` or custom staff records for structured escalation | 🟡 MINOR — Consider structured escalation FK references if automated notifications are planned |
| **71-patronage-tiers.csv** | `PatronageTier` (Table 57000) — WeltinaPatronAuctionManagement extension | `Customer_Posting_Group_Code` (to classify patrons correctly in BC AR) | `Minimum_Annual_Funding` is Decimal; `Sort_Order` is integer; `Exclusive_Tour_Access` / `Research_Briefing_Access` / `Named_Program_Eligibility` are boolean; `Recognition_Level` and `Patronage_Level` should define enum values | 🟡 MINOR — Add `Customer_Posting_Group_Code` for financial classification of patron revenue |
| **72-harvesting-quotas.csv** | `HarvestingQuota` (Table 57010) — WeltinaPatronAuctionManagement extension | No critical fields missing | Composite key `Species_Code` + `Component_Type` + `Period_Start_Date`; `Species_Code` FK to `63-species-profiles.csv`; `Period_Start_Date` / `Period_End_Date` are BC Date format; `Quota_Limit` is Decimal; `Prohibited` is boolean | 🟢 READY — Conservation quota table with clear composite key |
| **73-migration-corridors.csv** | `MigrationCorridor` (Table 58032) — WeltinaMultiHabitatManagement extension | `From_Location_Code` / `To_Location_Code` (explicit FK to BC `Location` table — `Corridor_From` / `Corridor_To` naming is ambiguous) | `Species_Code` FK to `63-species-profiles.csv`; `Corridor_From` / `Corridor_To` should be renamed `From_City_Code` / `To_City_Code` (FKs to `15-cities.csv`) or `From_Location_Code` / `To_Location_Code`; `Severity` should define enum values; `Migration_Date` is BC Date format | 🟡 MINOR — Rename `Corridor_From` / `Corridor_To` to explicit FK field names |

---

## Section 8 — Summary Findings

### Status Distribution

| Status | Count | Files |
|--------|-------|-------|
| 🟢 **READY** | 44 | 05, 12, 15–20, 22–28, 30–34, 36–40, 43–44, 49, 53–59, 62–69, 72 |
| 🟡 **MINOR** | 23 | 01, 03–04, 08, 11, 13–14, 21, 29, 35, 41–42, 45–48, 50–51, 60–61, 70–71, 73 |
| 🔴 **REVIEW** | 6 | 02, 06, 07, 09, 10, 52 |

### Critical Issues (🔴 REVIEW — Must Fix Before BC Import)

| Priority | File | Core Issue |
|----------|------|-----------|
| **P1** | `02-chart-of-accounts.csv` | Missing `Direct_Posting`, `Blocked`, `Gen_Posting_Type`, and VAT/posting group fields — accounts cannot post without these |
| **P1** | `06-customers-by-company.csv` | Missing full address block (`Address`, `City`, `Post_Code`, `Country_Region_Code`) and `Blocked` — BC customer record is non-functional without address for document printing and tax jurisdiction |
| **P1** | `07-vendors-by-company.csv` | Same as customers — missing address block and `Blocked`; `Lead_Time_Days` must be Date Formula |
| **P2** | `09-services.csv` | Ambiguous BC table target — conflates Item (Service type) and Resource schemas; needs splitting or target discriminator |
| **P2** | `10-posting-groups.csv` | Single flat file conflates 5 BC posting group tables; missing payables/receivables account fields per group type |
| **P2** | `52-volume-pricing-tiers.csv` | Lacks item/customer scoping fields (`Item_No`, `Sales_Type`, `Sales_Code`) — cannot be used by BC pricing engine without them |

### Top Minor Improvements (🟡)

1. **`03-number-series.csv`** — Add `Default_Nos` and `Manual_Nos` boolean columns
2. **`04-dimensions.csv`** — Add `Totaling` column for Total-type dimension values
3. **`42-ale-type-profiles.csv`** — Add `Item_No` FK to link ale profiles to BC Items
4. **`47-tavern-delivery-schedules.csv`** — Clarify `Tavern_No` as explicit `Customer_No` FK
5. **`73-migration-corridors.csv`** — Rename `Corridor_From`/`Corridor_To` to explicit FK field names

### Cross-File Dependency Chain (Import Order)

For successful BC configuration package import, respect this dependency order:

```
1. 01-kingdoms-countries      → Country/Region (no dependencies)
2. 15-cities                  → depends on 01
3. 02-chart-of-accounts       → GL Accounts (no dependencies)
4. 03-number-series           → No. Series (no dependencies)
5. 04-dimensions              → Dimensions (no dependencies)
6. 16-guilds                  → depends on 01, 15
7. 10-posting-groups          → depends on 02
8. 11-locations-by-company    → depends on 01, 15
9. 12-inventory-posting-setups → depends on 02, 11
10. 06-customers-by-company   → depends on 10, 11
11. 07-vendors-by-company     → depends on 10, 11
12. 08-items                  → depends on 10, 12
13. 09-services               → depends on 10
14. 13-resources-by-company   → depends on 10, 11
15. 14-fixed-assets-by-company → depends on 11, 07
16. 31-climate-zones          → depends on (none)
17. 34-preservation-requirements → depends on 08, 31
18. 42-ale-type-profiles       → depends on 08
19. [remaining extension tables follow their FK chains]
```

---

## Section 9 — Recommended Actions

### Immediate (Before Data Population)

1. **Add missing fields to `06-customers-by-company.csv` and `07-vendors-by-company.csv`:**
   Add columns: `Address`, `Address_2`, `City`, `Post_Code`, `Country_Region_Code`, `Phone_No`, `Email`, `Contact`, `Blocked`, `Payment_Method_Code`

2. **Add missing fields to `02-chart-of-accounts.csv`:**
   Add columns: `Direct_Posting`, `Blocked`, `Gen_Posting_Type`, `Gen_Bus_Posting_Group`, `Gen_Prod_Posting_Group`, `VAT_Bus_Posting_Group`, `VAT_Prod_Posting_Group`, `Reconciliation_Account`
   Rename `Balance_Sheet_Type` + `Income_Statement_Type` → consolidate into `Income_Balance`

3. **Split or clarify `09-services.csv`:**
   Either add a `BC_Table_Target` column (values: `Item`, `Resource`) or split into two files: `09a-service-items.csv` and `09b-service-resources.csv`

4. **Split `10-posting-groups.csv` by type:**
   Consider creating separate files: `10a-gen-posting-setup.csv`, `10b-customer-posting-groups.csv`, `10c-vendor-posting-groups.csv` — or add the missing account fields for each type and ensure the import mapping handles the discriminator correctly

5. **Add scoping fields to `52-volume-pricing-tiers.csv`:**
   Add `Item_No` or `Item_Category_Code` and `Sales_Type` / `Sales_Code` for BC price list integration

### Short-Term (During Data Population)

6. **Standardize all Date fields** to `YYYY-MM-DD` format across all files
7. **Standardize Date Formula fields** (e.g., `Lead_Time_Days` in vendors → `5D`; `Cross_Dock_Due_Date_Calc` in locations → `1D`)
8. **Validate all enum values** match BC option string captions exactly (Account Type, Item Type, Resource Type, Costing Method, Depreciation Method, Blocked options)
9. **Add `Item_No` FKs** to `42-ale-type-profiles.csv` and `48-limited-edition-allocations.csv`
10. **Rename `73-migration-corridors.csv`** fields `Corridor_From` / `Corridor_To` to `From_City_Code` / `To_City_Code`

### Before Import / Configuration Package Creation

11. **Validate FK chain integrity:** Ensure all `Country_Region_Code` values in downstream files exist in `01-kingdoms-countries.csv`; all `City_Code` values exist in `15-cities.csv`; all `Location_Code` values exist in `11-locations-by-company.csv`
12. **Separate FA Depreciation Book records** (`14-fixed-assets-by-company.csv`) into a companion import file since `Fixed Asset` and `FA Depreciation Book` are separate tables in BC
13. **Follow the import order** in Section 8 to avoid foreign key violations during configuration package processing

---

*Report generated from schema-only CSV files (header rows validated; no data rows present at time of review). Re-validate after data population to check enum value compliance and FK referential integrity.*
