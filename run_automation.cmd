@echo off
title Google Sheets Automation
echo ===================================
echo  GOOGLE SHEETS TO WEBSITE AUTOMATION
echo ===================================
echo.
echo Step 1: Export your Google Sheet as CSV
echo Step 2: Save it in this folder as: mysheet.csv
echo Step 3: This script will process it automatically
echo.
pause
powershell -ExecutionPolicy Bypass -File "automate.ps1"
echo.
echo AUTOMATION COMPLETE!
pause