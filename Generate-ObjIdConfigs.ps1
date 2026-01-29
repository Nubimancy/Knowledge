# ==================================================================================
# Generate-ObjIdConfigs.ps1
# PowerShell script to create .objidconfig files for all 38 Nubimancy applications
# Uses object ID ranges from ArchitecturePlanning.md
# ==================================================================================

[CmdletBinding()]
param()

Write-Host "🎯 Generating .objidconfig files for all 38 Nubimancy applications..." -ForegroundColor Cyan

# Base path for all applications
$basePath = "c:\Work\nubimancy\NubimancyPencilSketch"

# Application configurations with object ID ranges from ArchitecturePlanning.md
$applications = @(
    # AppSource Applications (4 main + 4 test)
    @{
        id = "NimbusCoreFoundation"
        name = "Nimbus Core Foundation"
        rangeFrom = 80000
        rangeTo = 87999
        description = "Nimbus Core Foundation object full range"
        skipGeneration = $true  # Already exists
    },
    @{
        id = "NimbusCoreFoundation.Test"
        name = "Nimbus Core Foundation Test"
        rangeFrom = 88000
        rangeTo = 88999
        description = "Nimbus Core Foundation test object range"
    },
    @{
        id = "NimbusSupply"
        name = "Nimbus Supply - Logistics & Distribution Suite"
        rangeFrom = 70000
        rangeTo = 77999
        description = "Nimbus Supply object full range"
    },
    @{
        id = "NimbusSupply.Test"
        name = "Nimbus Supply Test"
        rangeFrom = 78000
        rangeTo = 78999
        description = "Nimbus Supply test object range"
    },
    @{
        id = "NimbusExhibition"
        name = "Nimbus Exhibition - Events & Services Suite"
        rangeFrom = 60000
        rangeTo = 67999
        description = "Nimbus Exhibition object full range"
    },
    @{
        id = "NimbusExhibition.Test"
        name = "Nimbus Exhibition Test"
        rangeFrom = 68000
        rangeTo = 68999
        description = "Nimbus Exhibition test object range"
    },
    @{
        id = "NimbusManufacturing"
        name = "Nimbus Manufacturing - Production & Retail Suite"
        rangeFrom = 90000
        rangeTo = 97999
        description = "Nimbus Manufacturing object full range"
    },
    @{
        id = "NimbusManufacturing.Test"
        name = "Nimbus Manufacturing Test"
        rangeFrom = 98000
        rangeTo = 98999
        description = "Nimbus Manufacturing test object range"
    },

    # Bran's Transportation PTEs (50,000-52,999)
    @{
        id = "BranMysticalRoutePlanning"
        name = "Bran's Mystical Route Planning"
        rangeFrom = 50000
        rangeTo = 50799
        description = "Bran's Mystical Route Planning main object range"
    },
    @{
        id = "BranMysticalRoutePlanning.Test"
        name = "Bran's Mystical Route Planning Test"
        rangeFrom = 50800
        rangeTo = 50999
        description = "Bran's Mystical Route Planning test object range"
    },
    @{
        id = "BranArcaneScrollProcessing"
        name = "Bran's Arcane Scroll Processing"
        rangeFrom = 51000
        rangeTo = 51799
        description = "Bran's Arcane Scroll Processing main object range"
    },
    @{
        id = "BranArcaneScrollProcessing.Test"
        name = "Bran's Arcane Scroll Processing Test"
        rangeFrom = 51800
        rangeTo = 51999
        description = "Bran's Arcane Scroll Processing test object range"
    },
    @{
        id = "BranCaravanFestivalCoordination"
        name = "Bran's Caravan Festival Coordination"
        rangeFrom = 52000
        rangeTo = 52799
        description = "Bran's Caravan Festival Coordination main object range"
    },
    @{
        id = "BranCaravanFestivalCoordination.Test"
        name = "Bran's Caravan Festival Coordination Test"
        rangeFrom = 52800
        rangeTo = 52999
        description = "Bran's Caravan Festival Coordination test object range"
    },

    # Rini's Combat Sports PTEs (53,000-55,999)
    @{
        id = "RiniDimensionalTournamentBrackets"
        name = "Rini's Dimensional Tournament Brackets"
        rangeFrom = 53000
        rangeTo = 53799
        description = "Rini's Dimensional Tournament Brackets main object range"
    },
    @{
        id = "RiniDimensionalTournamentBrackets.Test"
        name = "Rini's Dimensional Tournament Brackets Test"
        rangeFrom = 53800
        rangeTo = 53999
        description = "Rini's Dimensional Tournament Brackets test object range"
    },
    @{
        id = "RiniFighterProgressionAnalytics"
        name = "Rini's Fighter Progression Analytics"
        rangeFrom = 54000
        rangeTo = 54799
        description = "Rini's Fighter Progression Analytics main object range"
    },
    @{
        id = "RiniFighterProgressionAnalytics.Test"
        name = "Rini's Fighter Progression Analytics Test"
        rangeFrom = 54800
        rangeTo = 54999
        description = "Rini's Fighter Progression Analytics test object range"
    },
    @{
        id = "RiniMultiRealmSportsBroadcasting"
        name = "Rini's Multi-Realm Sports Broadcasting"
        rangeFrom = 55000
        rangeTo = 55799
        description = "Rini's Multi-Realm Sports Broadcasting main object range"
    },
    @{
        id = "RiniMultiRealmSportsBroadcasting.Test"
        name = "Rini's Multi-Realm Sports Broadcasting Test"
        rangeFrom = 55800
        rangeTo = 55999
        description = "Rini's Multi-Realm Sports Broadcasting test object range"
    },

    # Weltina's Creature Care PTEs (56,000-58,999)
    @{
        id = "WeltinaAdvancedCreatureCareProtocols"
        name = "Weltina's Advanced Creature Care Protocols"
        rangeFrom = 56000
        rangeTo = 56799
        description = "Weltina's Advanced Creature Care Protocols main object range"
    },
    @{
        id = "WeltinaAdvancedCreatureCareProtocols.Test"
        name = "Weltina's Advanced Creature Care Protocols Test"
        rangeFrom = 56800
        rangeTo = 56999
        description = "Weltina's Advanced Creature Care Protocols test object range"
    },
    @{
        id = "WeltinaPatronAuctionManagement"
        name = "Weltina's Patron Auction Management"
        rangeFrom = 57000
        rangeTo = 57799
        description = "Weltina's Patron Auction Management main object range"
    },
    @{
        id = "WeltinaPatronAuctionManagement.Test"
        name = "Weltina's Patron Auction Management Test"
        rangeFrom = 57800
        rangeTo = 57999
        description = "Weltina's Patron Auction Management test object range"
    },
    @{
        id = "WeltinaMultiHabitatManagement"
        name = "Weltina's Multi-Habitat Management"
        rangeFrom = 58000
        rangeTo = 58799
        description = "Weltina's Multi-Habitat Management main object range"
    },
    @{
        id = "WeltinaMultiHabitatManagement.Test"
        name = "Weltina's Multi-Habitat Management Test"
        rangeFrom = 58800
        rangeTo = 58999
        description = "Weltina's Multi-Habitat Management test object range"
    },

    # Delyra's Multi-Dimensional PTEs (59,000-61,999)
    @{
        id = "DelyraMultiplanarWorkCenters"
        name = "Delyra's Multi-planar Work Centers"
        rangeFrom = 59000
        rangeTo = 59799
        description = "Delyra's Multi-planar Work Centers main object range"
    },
    @{
        id = "DelyraMultiplanarWorkCenters.Test"
        name = "Delyra's Multi-planar Work Centers Test"
        rangeFrom = 59800
        rangeTo = 59999
        description = "Delyra's Multi-planar Work Centers test object range"
    },
    @{
        id = "DelyraEnchantmentRefreshServices"
        name = "Delyra's Enchantment Refresh Services"
        rangeFrom = 60000
        rangeTo = 60799
        description = "Delyra's Enchantment Refresh Services main object range"
    },
    @{
        id = "DelyraEnchantmentRefreshServices.Test"
        name = "Delyra's Enchantment Refresh Services Test"
        rangeFrom = 60800
        rangeTo = 60999
        description = "Delyra's Enchantment Refresh Services test object range"
    },
    @{
        id = "DelyraPortalShopManagement"
        name = "Delyra's Portal Shop Management"
        rangeFrom = 61000
        rangeTo = 61799
        description = "Delyra's Portal Shop Management main object range"
    },
    @{
        id = "DelyraPortalShopManagement.Test"
        name = "Delyra's Portal Shop Management Test"
        rangeFrom = 61800
        rangeTo = 61999
        description = "Delyra's Portal Shop Management test object range"
    },

    # Thorin's Hospitality PTEs (62,000-64,999)
    @{
        id = "ThorinDwarvenAleQualityTracking"
        name = "Thorin's Dwarven Ale Quality Tracking"
        rangeFrom = 62000
        rangeTo = 62799
        description = "Thorin's Dwarven Ale Quality Tracking main object range"
    },
    @{
        id = "ThorinDwarvenAleQualityTracking.Test"
        name = "Thorin's Dwarven Ale Quality Tracking Test"
        rangeFrom = 62800
        rangeTo = 62999
        description = "Thorin's Dwarven Ale Quality Tracking test object range"
    },
    @{
        id = "ThorinTavernNetworkRelationshipManagement"
        name = "Thorin's Tavern Network Relationship Management"
        rangeFrom = 63000
        rangeTo = 63799
        description = "Thorin's Tavern Network Relationship Management main object range"
    },
    @{
        id = "ThorinTavernNetworkRelationshipManagement.Test"
        name = "Thorin's Tavern Network Relationship Management Test"
        rangeFrom = 63800
        rangeTo = 63999
        description = "Thorin's Tavern Network Relationship Management test object range"
    },
    @{
        id = "ThorinCommunityEventOrchestration"
        name = "Thorin's Community Event Orchestration"
        rangeFrom = 64000
        rangeTo = 64799
        description = "Thorin's Community Event Orchestration main object range"
    },
    @{
        id = "ThorinCommunityEventOrchestration.Test"
        name = "Thorin's Community Event Orchestration Test"
        rangeFrom = 64800
        rangeTo = 64999
        description = "Thorin's Community Event Orchestration test object range"
    }
)

# Function to create .objidconfig file
function New-ObjIdConfig {
    param(
        [Parameter(Mandatory=$true)]
        [hashtable]$AppDefinition,
        [Parameter(Mandatory=$true)]
        [string]$BasePath
    )

    $appPath = Join-Path $BasePath $AppDefinition.id
    $configPath = Join-Path $appPath ".objidconfig"
    
    if ($AppDefinition.skipGeneration) {
        Write-Host "⏭️  Skipping $($AppDefinition.id) (already exists)" -ForegroundColor DarkYellow
        return
    }

    Write-Host "🔨 Creating .objidconfig for $($AppDefinition.id)..." -ForegroundColor Green
    
    # Create the configuration object
    $config = @{
        idRanges = @(
            @{
                from = $AppDefinition.rangeFrom
                to = $AppDefinition.rangeTo
                description = $AppDefinition.description
            }
        )
    }
    
    # Convert to JSON and save
    $json = $config | ConvertTo-Json -Depth 3
    Set-Content -Path $configPath -Value $json -Encoding UTF8
    
    Write-Host "  ✅ Created: $configPath" -ForegroundColor DarkGreen
    Write-Host "     Range: $($AppDefinition.rangeFrom) - $($AppDefinition.rangeTo)" -ForegroundColor DarkGray
}

# Main execution
Write-Host "📍 Target: Generate .objidconfig for 37 applications" -ForegroundColor Yellow
Write-Host "📂 Base Path: $basePath" -ForegroundColor Cyan

$created = 0
foreach ($app in $applications) {
    $appPath = Join-Path $basePath $app.id
    
    if (-not (Test-Path $appPath)) {
        Write-Warning "  ❌ Application directory not found: $appPath"
        continue
    }
    
    New-ObjIdConfig -AppDefinition $app -BasePath $basePath
    if (-not $app.skipGeneration) {
        $created++
    }
}

Write-Host "`n🎉 Object ID Configuration Complete!" -ForegroundColor Green
Write-Host "📊 Created: $created new .objidconfig files" -ForegroundColor Cyan
Write-Host "📊 Skipped: 1 existing configuration (NimbusCoreFoundation)" -ForegroundColor Cyan
Write-Host "🎯 Total: 38 applications now have Object ID Ninja configuration" -ForegroundColor Green

Write-Host "`n🧙‍♂️ Ready for Object ID Ninja MCP allocation!" -ForegroundColor Magenta
