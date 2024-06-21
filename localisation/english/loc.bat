@echo off
setlocal enabledelayedexpansion

set /p filenames=Enter filenames separated by spaces: 

for %%i in (%filenames%) do (
    set "filename=%%i"
    set "newfile=!filename!_l_english.yml"
    if exist "!newfile!" (
        echo File !newfile! already exists. Skipping...
    ) else (
        echo Creating file !filename!_l_english.yml...
        (
            echo l_english:
            echo !filename! | findstr /C:"country" >nul
            if !errorlevel! equ 0 (
                echo  TAG: ""
                echo  TAG_DEF: ""
                echo  TAG_ADJ: ""
                echo.
                echo  TAG_communism: ""
                echo  TAG_communism_DEF: ""
                echo  TAG_communism_ADJ: ""
                echo  TAG_communism_party: ""
                echo  TAG_communism_party_long: ""
                echo.
                echo  TAG_democratic: ""
                echo  TAG_democratic_DEF: ""
                echo  TAG_democratic_ADJ: ""
                echo  TAG_democratic_party: ""
                echo  TAG_democratic_party_long: ""
                echo.
                echo  TAG_fascism: ""
                echo  TAG_fascism_DEF: ""
                echo  TAG_fascism_ADJ: ""
                echo  TAG_fascism_party: ""
                echo  TAG_fascism_party_long: ""
                echo.
                echo  TAG_neutrality: ""
                echo  TAG_neutrality_DEF: ""
                echo  TAG_neutrality_ADJ: ""
                echo  TAG_neutrality_party: ""
                echo  TAG_neutrality_party_long: ""
            )
        ) > "!filename!_l_english.yml"
        rem Use PowerShell to convert the file to UTF-8 with BOM
        PowerShell -Command "(Get-Content -Path '!filename!_l_english.yml') | Set-Content -Path '!filename!_l_english.yml' -Encoding UTF8"
        echo File created: !filename!_l_english.yml
    )

    if !errorlevel! neq 0 (
        echo Error occurred while converting !newfile! to UTF-8.
    )
)

pause