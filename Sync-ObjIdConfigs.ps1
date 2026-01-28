# ==================================================================================
# Sync-ObjIdConfigs.ps1
# PowerShell script to synchronize .objidconfig files with app.json ID ranges
# ==================================================================================

[CmdletBinding()]
param()

Write-Host "🔄 Synchronizing .objidconfig files with app.json ranges..." -ForegroundColor Cyan

$basePath = "c:\Work\nubimancy\NubimancyPencilSketch"

# Get all app.json files
$appJsonFiles = Get-ChildItem -Path $basePath -Recurse -Filter "app.json"

$updated = 0
$skipped = 0

foreach ($appJsonFile in $appJsonFiles) {
    $appDir = $appJsonFile.Directory.FullName
    $appName = $appJsonFile.Directory.Name
    $objIdConfigPath = Join-Path $appDir ".objidconfig"
    
    # Read app.json
    try {
        $appJson = Get-Content $appJsonFile.FullName | ConvertFrom-Json
        
        if (-not $appJson.idRanges -or $appJson.idRanges.Count -eq 0) {
            Write-Warning "⚠️  $appName has no idRanges in app.json"
            $skipped++
            continue
        }
        
        $from = $appJson.idRanges[0].from
        $to = $appJson.idRanges[0].to
        
        # Determine description based on app name
        $description = if ($appName -like "*Test") {
            "$($appName -replace '\.Test$', '') test object range"
        } else {
            if ($appName -like "Nimbus*") {
                "$appName object range"
            } else {
                "$appName main object range"
            }
        }
        
        # Create or update .objidconfig
        $objIdConfig = @{
            idRanges = @(
                @{
                    from = $from
                    to = $to
                    description = $description
                }
            )
        }
        
        # Write to file
        $json = $objIdConfig | ConvertTo-Json -Depth 3
        Set-Content -Path $objIdConfigPath -Value $json -Encoding UTF8
        
        Write-Host "✅ Updated $appName" -ForegroundColor Green
        Write-Host "   Range: $from - $to" -ForegroundColor DarkGray
        $updated++
        
    } catch {
        Write-Warning "❌ Error processing $appName`: $_"
        $skipped++
    }
}

Write-Host "`n🎉 Synchronization Complete!" -ForegroundColor Green
Write-Host "📊 Updated: $updated applications" -ForegroundColor Cyan
Write-Host "⏭️  Skipped: $skipped applications" -ForegroundColor Yellow
