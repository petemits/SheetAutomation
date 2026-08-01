# automate.ps1 - Google Sheets CSV Processor
# SAVE YOUR GOOGLE SHEET AS CSV IN THIS FOLDER

Write-Host "`n=== GOOGLE SHEETS AUTOMATION ===" -ForegroundColor Cyan
Write-Host "Looking for CSV files..." -ForegroundColor Yellow

# Look for CSV files in current folder
$CsvFiles = Get-ChildItem -Path ".\" -Filter "*.csv"
if ($CsvFiles.Count -eq 0) {
    Write-Host "ERROR: No CSV files found in this folder!" -ForegroundColor Red
    Write-Host "`nINSTRUCTIONS:" -ForegroundColor Yellow
    Write-Host "1. Open your Google Sheet" -ForegroundColor White
    Write-Host "2. Click File → Download → Comma-separated values (.csv)" -ForegroundColor White
    Write-Host "3. Save the file HERE: $PWD" -ForegroundColor White
    Write-Host "4. You can rename it to: mysheet.csv" -ForegroundColor White
    pause
    exit
}

# Use the first CSV file found
$CsvFile = $CsvFiles[0].FullName
Write-Host "Found CSV file: $($CsvFiles[0].Name)" -ForegroundColor Green

# Import data
try {
    $data = Import-Csv $CsvFile | Select-Object -First 1
    Write-Host "✓ CSV file loaded successfully" -ForegroundColor Green
    
    # Show available columns
    Write-Host "`nCOLUMNS FOUND IN YOUR CSV:" -ForegroundColor Cyan
    $data.PSObject.Properties.Name | ForEach-Object {
        Write-Host "  - $_ : $($data.$_)" -ForegroundColor Gray
    }
    
    # Use the first column's value
    $FirstColumn = $data.PSObject.Properties.Name[0]
    $DataToPaste = $data.$FirstColumn
    
    Write-Host "`n✓ First value to use: $DataToPaste" -ForegroundColor Green
    Write-Host "  (From column: '$FirstColumn')" -ForegroundColor Gray
    
    # Now you can add your website automation here
    # Example: 
    # $ie = New-Object -ComObject InternetExplorer.Application
    # $ie.Navigate("your-website.com")
    # ...
    
    Write-Host "`n=== READY FOR WEBSITE AUTOMATION ===" -ForegroundColor Cyan
    Write-Host "Add your website code after this point" -ForegroundColor Yellow
    
} catch {
    Write-Host "ERROR loading CSV: $_" -ForegroundColor Red
}

Write-Host "`nScript completed. Press any key..." -ForegroundColor Gray
pause