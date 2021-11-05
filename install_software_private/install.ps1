#elevate as admin
# if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) 
# { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File "$PSCommandPath"" -Verb RunAs; exit }

#set variables for scriptpath
$scriptpath = $MyInvocation.MyCommand.Definition
$scriptfolder = [System.IO.Path]::GetDirectoryName($scriptpath)

##create window
#create window itself
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
$objForm = New-Object System.Windows.Forms.Form
$objForm.Backcolor="White"
$objForm.StartPosition = "CenterScreen"
$objForm.Text = "Install Software"
$objForm.size = New-Object System.Drawing.Size(530,350)
$objForm.FormBorderStyle = 'FixedDialog'

$info_text = New-Object System.Windows.Forms.Label
$info_text.location = '20,20'
$info_text.text = "Which Software do you want to install?"
$info_text.AutoSize = $true
$objForm.Controls.Add($info_text)

#set line and row
$row1 = "40"
$row2 = "190"
$row3 = "340"
$line1 = "50"
$line2 = "70"
$line3 = "90"
$line4 = "110"
$line5 = "130"
$line6 = "150"
$line7 = "170"
#$line8 = "190"
#$line9 = "210"

#set name software name size
$name_size = "150,20"

#Create the collection of checkboxes
$check_7zip = New-Object System.Windows.Forms.CheckBox
$check_7zip.Location = "$row1,$line1"
$check_7zip.size = $name_size
$check_7zip.Checked = $true 
$check_7zip.Text = "Install 7-Zip"
$objForm.Controls.Add($check_7zip)

$check_battlenet = New-Object System.Windows.Forms.CheckBox
$check_battlenet.Location = "$row1,$line2"
$check_battlenet.size = '150,20'
$check_battlenet.Checked = $false 
$check_battlenet.Text = "Install Battle.Net"
$objForm.Controls.Add($check_battlenet)

$check_chrome = New-Object System.Windows.Forms.CheckBox
$check_chrome.Location = "$row1,$line3"
$check_chrome.size = '150,20'
$check_chrome.Checked = $false 
$check_chrome.Text = "Install Chrome"
$objForm.Controls.Add($check_chrome)

$check_discord = New-Object System.Windows.Forms.CheckBox
$check_discord.Location = "$row1,$line4"
$check_discord.size = '150,20'
$check_discord.Checked = $false 
$check_discord.Text = "Install Discord"
$objForm.Controls.Add($check_discord)

$check_epicgames = New-Object System.Windows.Forms.CheckBox
$check_epicgames.Location = "$row1,$line5"
$check_epicgames.size = '150,20'
$check_epicgames.Checked = $false 
$check_epicgames.Text = "Install EpicGames"
$objForm.Controls.Add($check_epicgames)

$check_firefox = New-Object System.Windows.Forms.CheckBox
$check_firefox.Location = "$row1,$line6"
$check_firefox.size = '150,20'
$check_firefox.Checked = $false 
$check_firefox.Text = "Install Firefox"
$objForm.Controls.Add($check_firefox)

$check_libreoffice = New-Object System.Windows.Forms.CheckBox
$check_libreoffice.Location = "$row1,$line7"
$check_libreoffice.size = '150,20'
$check_libreoffice.Checked = $false 
$check_libreoffice.Text = "Install LibreOffice"
$objForm.Controls.Add($check_libreoffice)

$check_npp = New-Object System.Windows.Forms.CheckBox
$check_npp.Location = "$row2,$line1"
$check_npp.size = '150,20'
$check_npp.Checked = $true 
$check_npp.Text = "Install Notepad++"
$objForm.Controls.Add($check_npp)

$check_steam = New-Object System.Windows.Forms.CheckBox
$check_steam.Location = "$row2,$line2"
$check_steam.size = '150,20'
$check_steam.Checked = $false 
$check_steam.Text = "Install Steam"
$objForm.Controls.Add($check_steam)

$check_thunderbird = New-Object System.Windows.Forms.CheckBox
$check_thunderbird.Location = "$row2,$line3"
$check_thunderbird.size = '150,20'
$check_thunderbird.Checked = $false 
$check_thunderbird.Text = "Install Thunderbird"
$objForm.Controls.Add($check_thunderbird)

$check_vlc = New-Object System.Windows.Forms.CheckBox
$check_vlc.Location = "$row3,$line3"
$check_vlc.size = '150,20'
$check_vlc.Checked = $false 
$check_vlc.Text = "Install VLC"
$objForm.Controls.Add($check_vlc)

$check_teamviewer = New-Object System.Windows.Forms.CheckBox
$check_teamviewer.Location = "$row3,$line1"
$check_teamviewer.size = '150,20'
$check_teamviewer.Checked = $false 
$check_teamviewer.Text = "Install Teamviewer"
$objForm.Controls.Add($check_teamviewer)

$check_pdf24 = New-Object System.Windows.Forms.CheckBox
$check_pdf24.Location = "$row3,$line2"
$check_pdf24.size = '150,20'
$check_pdf24.Checked = $false 
$check_pdf24.Text = "Install PDF24"
$objForm.Controls.Add($check_pdf24)

$check_obs = New-Object System.Windows.Forms.CheckBox
$check_obs.Location = "$row2,$line4"
$check_obs.size = '150,20'
$check_obs.Checked = $false 
$check_obs.Text = "Install OBS"
$objForm.Controls.Add($check_obs)

#create install button
$start_ins_button = New-Object System.Windows.Forms.Button
#button size,location and content
$start_ins_button.Location = New-Object System.Drawing.Size(280,275)
$start_ins_button.Size = New-Object System.Drawing.Size(100,25)
$start_ins_button.Text = "Start Installation"
$start_ins_button.Name = "Start Installation"
#ok button make flatstyle
$start_ins_button.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$start_ins_button.FlatAppearance.BorderSize = 1
$start_ins_button.FlatAppearance.BorderColor = [System.Drawing.Color]::DarkSlateGray
$start_ins_button.FlatAppearance.MouseOverBackColor = [System.Drawing.Color]::LightSkyBlue
#start button function
$start_ins_button.Add_Click(
    {start_install(
        $check_7zip.Checked, 
        $check_battlenet.Checked, 
        $check_chrome.Checked, 
        $check_discord.Checked, 
        $check_epicgames.Checked, 
        $check_firefox.Checked,
        $check_libreoffice.Checked, 
        $check_npp.Checked, 
        $check_steam.Checked, 
        $check_thunderbird.Checked,
        $check_vlc.Checked,
        $check_teamviewer.Checked,
        $check_pdf24.Checked,
        $check_obs.Checked
    ) 
    $objForm.Close()
    }
)
$objForm.Controls.Add($start_ins_button)

#create cancel button
$cancel_button = New-Object System.Windows.Forms.Button
#button size,location and content
$cancel_button.Location = New-Object System.Drawing.Size(400,275)
$cancel_button.Size = New-Object System.Drawing.Size(75,25)
$cancel_button.Text = "Abbrechen"
$cancel_button.Name = "Abbrechen"
$cancel_button.DialogResult = "Cancel"
#ok button make flatstyle
$cancel_button.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$cancel_button.FlatAppearance.BorderSize = 1
$cancel_button.FlatAppearance.BorderColor = [System.Drawing.Color]::DarkSlateGray
$cancel_button.FlatAppearance.MouseOverBackColor = [System.Drawing.Color]::LightPink
#cancel button function
$cancel_button.Add_Click({$objForm.Close()})
$objForm.Controls.Add($cancel_button)

$objForm.Controls.AddRange(@(
    $check_7zip, 
    $check_battlenet, 
    $check_chrome, 
    $check_discord, 
    $check_epicgames, 
    $check_firefox, 
    $check_libreoffice, 
    $check_npp, 
    $check_steam, 
    $check_thunderbird,
    $check_vlc,
    $check_teamviewer,
    $check_pdf24,
    $check_obs,
    $start_ins_button,
    $cancel_button)
)


function start_install {
    param ()
    if ($check_7zip.Checked -eq $true) {
        install_7zip
    }
    if ($check_battlenet.Checked -eq $true) {
        install_battlenet
    }
    if ($check_chrome.Checked -eq $true) {
        install_chrome
    }
    if ($check_discord.Checked -eq $true) {
        install_discord
    }
    if ($check_epicgames.Checked -eq $true) {
        install_epicgames
    }
    if ($check_firefox.Checked -eq $true) {
        install_firefox
    }
    if ($check_libreoffice.Checked -eq $true) {
        install_libreoffice
    }
    if ($check_npp.Checked -eq $true) {
        install_npp
    }
    if ($check_steam.Checked -eq $true) {
        install_steam
    }
    if ($check_thunderbird.Checked -eq $true) {
        install_thunderbird
    }
    if ($check_vlc.Checked -eq $true) {
        install_vlc
    }
    if ($check_teamviewer.Checked -eq $true) {
        install_teamviewer
    }
    if ($check_pdf24.Checked -eq $true) {
        install_pdf24
    }
    if ($check_obs.Checked -eq $true) {
        install_obs
    }
    
    # Information for the user for some products
    if ($check_battlenet.Checked -eq $true) {
        [System.Windows.Forms.MessageBox]::Show("Battle.Net can´t be installed automaticaly because Blizzard does NOT support this option.`n`nYou have to install Battel.Net manually","Information about Battle.Net","0","Information")
    }

}
function install_7zip {
    Write-Host "7-Zip installation startet ..."

    $7zip_URL = 'https://www.7-zip.org/download.html'
    $7zip_page = Invoke-RestMethod -Uri $7zip_URL
    $7zip_DLPrefix = $7zip_URL.Split('d')[0]
    $7zip_RelLink = (((($7zip_page -split '7-Zip for 64-bit Windows')[1] -split '<TR>')[-1] -split 'href="')[1] -split '"')[0]

    #put information together for downloadlink
    $7zip_download_path = -join ($7zip_DLPrefix, $7zip_RelLink)

    #get the installer filename
    $7zip_installer_file = ($7zip_download_path -split "/")[-1]
    
    #download 7zip installer
    (New-Object System.Net.WebClient).DownloadFile($7zip_download_path,"$scriptfolder\$7zip_installer_file")

    #start installation of 7zip
    Start-Process -FilePath "msiexec.exe" -ArgumentList "/i ""$ScriptFolder\$7zip_installer_file"" /qn /norestart" -Wait -WindowStyle Hidden
    Start-Sleep -Seconds "5"
    Remove-Item "$scriptfolder\$7zip_installer_file"
}
function install_battlenet {
    Write-Host "Battle.Net installation startet ..."

    #set variables
    $battlenet_installer_file = "battlenet.exe"
    $battlenet_download_path = "https://eu.battle.net/download/getInstaller?os=win&installer=Battle.net-Setup.exe"

    #downloading the newest battle.net version
    (New-Object System.Net.WebClient).DownloadFile($battlenet_download_path,"$scriptfolder\$battlenet_installer_file")
}
function install_chrome {
    Write-Host "Google Crome installation startet ..."

    #set links for chrome download
    $chrome_version_url = "https://npackd.appspot.com/p/google-chrome-x64"
    $chrome_newest_version = (((((Invoke-RestMethod -Uri $chrome_version_url) -split "Versions:")[1] -split "</a>")[0] -split "<a href=`"/p/google-chrome-x64/")[1] -split "`">")[0]
    $chrome_dl_newversion_url = $chrome_version_url + "/" + $chrome_newest_version
    $chrome_download_path = ((((Invoke-RestMethod -Uri $chrome_dl_newversion_url) -split "Download:")[1] -split "`"")[1] -split "`"")[0]
    $chrome_installer_file = ($chrome_download_path -split "/")[-1]

    #start download of the newest libreoffice version
    (New-Object System.Net.WebClient).DownloadFile($chrome_download_path,"$scriptfolder\$chrome_installer_file")

    #start the installation
    Start-Process -FilePath "msiexec.exe" -ArgumentList "/i ""$ScriptFolder\$chrome_installer_file"" /qn /norestart" -Wait -WindowStyle Hidden
    Start-Sleep -Seconds "5"
    Remove-Item "$scriptfolder\$chrome_installer_file"

}
function install_discord {
    Write-Host "Discord installation startet ..."  
    
    #set variables
    $discord_installer_file = "discord.exe"
    $discord_download_path = "https://discord.com/api/downloads/distributions/app/installers/latest?channel=stable&platform=win&arch=x86"

    #downloading the newest discord version
    (New-Object System.Net.WebClient).DownloadFile($discord_download_path,"$scriptfolder\$discord_installer_file")
    
    #installing the newest discord version
    Start-Process -FilePath "$scriptfolder\$discord_installer_file" -ArgumentList "-s" -Wait -WindowStyle Hidden
    Start-Sleep -Seconds "5"
    Remove-Item "$scriptfolder\$discord_installer_file"
}
function install_epicgames {
    Write-Host "Epic Games installation startet ..."

    #set variables
    $epic_installer_file = "epic.msi"
    $epic_download_path = "https://launcher-public-service-prod06.ol.epicgames.com/launcher/api/installer/download/EpicGamesLauncherInstaller.msi"

    #downloading the newest discord version
    (New-Object System.Net.WebClient).DownloadFile($epic_download_path,"$scriptfolder\$epic_installer_file")
    
    #installing the newest discord version
    Start-Process -FilePath "msiexec.exe" -ArgumentList "/i ""$ScriptFolder\$epic_installer_file"" /qn /norestart" -Wait -WindowStyle Hidden
    Start-Sleep -Seconds "5"
    Remove-Item "$scriptfolder\$epic_installer_file"
}
function install_firefox {
    Write-Host "Mozilla Firefox installation startet ..."
    $firefox_download_path = "https://download.mozilla.org/?product=firefox-latest-ssl&os=win64&lang=de"
    $firefox_installer_file = "Firefox.exe"

    #download the newest firefox installer
    (New-Object System.Net.WebClient).DownloadFile($firefox_download_path,"$scriptfolder\$firefox_installer_file")

    #start installation of firefox
    Start-Process -FilePath "$scriptfolder\$firefox_installer_file" -ArgumentList "-ms" -Wait -WindowStyle Hidden
    Start-Sleep -Seconds "5"
    Remove-Item "$scriptfolder\$firefox_installer_file"
}
function install_libreoffice {
    Write-Host "LibreOffice installation startet ..."

    #set links for libreofficedownload
    $libreoffice_version_url = "https://npackd.appspot.com/p/libreoffice64"
    $libreoffice_newest_version = ((((((Invoke-RestMethod -Uri $libreoffice_version_url) -split "Versions:")[1] -split "</div>")[0] -split "</a>")[0] -split "<a href=`"/p/libreoffice64/")[1] -split "`">")[0]

    $dl_newversion_url = $libreoffice_version_url + "/" + $libreoffice_newest_version
    $libreoffice_download_path = ((((Invoke-RestMethod -Uri $dl_newversion_url) -split "Download:")[1] -split "`"")[1] -split "`"")[0]
    $libreoffice_installer_file = ($libreoffice_download_path -split "/")[-1]

    #start download of the newest libreoffice version
    (New-Object System.Net.WebClient).DownloadFile($libreoffice_download_path,"$scriptfolder\$libreoffice_installer_file")

    #start the installation
    Start-Process -FilePath "msiexec.exe" -ArgumentList "/i ""$ScriptFolder\$libreoffice_installer_file"" /qn /norestart" -Wait -WindowStyle Hidden
    Start-Sleep -Seconds "5"
    Remove-Item "$scriptfolder\$libreoffice_installer_file"
}
function install_npp {
    Write-Host "Notepad++ installation startet ..."
    $github_api_url_npp = "https://api.github.com/repos/notepad-plus-plus/notepad-plus-plus/releases/latest"
    $npp_downloads_list = (Invoke-WebRequest $github_api_url_npp | ConvertFrom-Json).assets.browser_download_url
    foreach ($item in $npp_downloads_list){
        if ($item -like "*x64.exe"){
            $npp_download_path = $item
        }
    }
    $npp_installer_file = ($npp_download_path -split "/")[-1]
    
    #download the npp installer
    (New-Object System.Net.WebClient).DownloadFile($npp_download_path,"$scriptfolder\$npp_installer_file")

    #start installation for npp
    Start-Process -FilePath "$scriptfolder\$npp_installer_file" -ArgumentList "-ms" -Wait -WindowStyle Hidden
    Start-Sleep -Seconds "5"
    Remove-Item "$scriptfolder\$npp_installer_file"
}
function install_steam {
    Write-Host "Steam installation startet ..."

    #set variables
    $steam_installer_file = "steam.exe"
    $steam_download_path = "https://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe"

    #downloading the newest discord version
    (New-Object System.Net.WebClient).DownloadFile($steam_download_path,"$scriptfolder\$steam_installer_file")

    #installing the newest discord version
    Start-Process -FilePath "$scriptfolder\$steam_installer_file" -ArgumentList "/s" -Wait -WindowStyle Hidden
    Start-Sleep -Seconds "5"
    Remove-Item "$scriptfolder\$steam_installer_file"

}
function install_thunderbird {
    Write-Host "Thunderbird installation startet ..."
    #get newest version and create downloadpath
    $thunderbird_newest_version = (Invoke-WebRequest "https://product-details.mozilla.org/1.0/thunderbird_versions.json" | ConvertFrom-Json).LATEST_THUNDERBIRD_VERSION
    $thunderbird_download_path = "https://download.mozilla.org/?product=thunderbird-$thunderbird_newest_version-SSL&os=win&lang=de"
    $thunderbird_installer_file = "Thunderbird_$thunderbird_newest_version.exe"

    #download the thunderbird installer
    (New-Object System.Net.WebClient).DownloadFile($thunderbird_download_path,"$scriptfolder\$thunderbird_installer_file")
    
    #start installation for thunderbird
    Start-Process -FilePath "$scriptfolder\$thunderbird_installer_file" -ArgumentList "-ms" -Wait -WindowStyle Hidden
    Start-Sleep -Seconds "5"
    Remove-Item "$scriptfolder\$thunderbird_installer_file"
}
function install_vlc {
    Write-Host "VLC installation startet ..."

    $vlc_url = 'https://www.videolan.org/vlc/download-windows.html'
    $vlc_page = Invoke-RestMethod -Uri $vlc_url
    $vlc_dllink = (($vlc_page -split "`">Installer for 64bit version")[0] -split "><a href=`"//")[-1]
    $vlc_download_path = "https://" + $vlc_dllink
    $vlc_installer_file = ($vlc_download_path -split '/')[-1]

    #download the vlc installer
    (New-Object System.Net.WebClient).DownloadFile($vlc_download_path,"$scriptfolder\$vlc_installer_file")

    #Start Installation
    Start-Process -FilePath "$scriptfolder\$vlc_installer_file" -ArgumentList "/S" -Wait -WindowStyle Hidden
    Start-Sleep -Seconds "5"
    Remove-Item "$scriptfolder\$vlc_installer_file"
}
function install_teamviewer {
    Write-Host "Teamviewer installation startet ..."

    #set variables
    $teamviewer_installer_file = "teamviewer.exe"
    $teamviewer_download_path = "https://download.teamviewer.com/download/TeamViewer_Setup.exe"

    #downloading the newest discord version
    (New-Object System.Net.WebClient).DownloadFile($teamviewer_download_path,"$scriptfolder\$teamviewer_installer_file")

    #installing the newest discord version
    Start-Process -FilePath "$scriptfolder\$teamviewer_installer_file" -ArgumentList "/S" -Wait -WindowStyle Hidden
    Start-Sleep -Seconds "5"
    Remove-Item "$scriptfolder\$teamviewer_installer_file"
}
function install_pdf24 {
    Write-Host "PDF24 installation startet ..."

    $URL = 'https://tools.pdf24.org/de/creator'
    $pdf24_Page = Invoke-RestMethod -Uri $url
    $dllinkpart_pdf24 = (((($pdf24_Page -split "business")[-1] -split "',updateUrl:")[0] -split "//")[1] -split "{")[0]
    $newest_version_pdf24 = ((($pdf24_Page -split "Aktuelle Version</div>")[1] -split "</span>")[0] -split "Version ")[1]
    $pdf24_download_path = "https://" + $dllinkpart_pdf24 + $newest_version_pdf24
    $pdf24_installer_file = "pdf24-creator-$newest_version_pdf24.msi"

    #download the pdf24 installer
    (New-Object System.Net.WebClient).DownloadFile($pdf24_download_path,"$scriptfolder\$pdf24_installer_file")

    #start installation for psf24
    Start-Process -FilePath "msiexec.exe" -ArgumentList "/i ""$ScriptFolder\$pdf24_installer_file"" /qn /norestart" -Wait -WindowStyle Hidden
    Start-Sleep -Seconds "5"
    Remove-Item "$scriptfolder\$pdf24_installer_file"
}
function install_obs {
    Write-Host "OBS installation startet ..."

    $obs_url = "https://obsproject.com/"
    $obs_download_path = ((((Invoke-RestMethod -Uri $obs_url) -split "download-welcome`">Windows")[0] -split "<a href=`"")[-1] -split "`"")[0]
    $obs_installer_file = ($obs_download_path -split "/")[-1]
    (New-Object System.Net.WebClient).DownloadFile($bs_download_path,"$scriptfolder\$obs_installer_file")
    Start-Process -FilePath "$ScriptFolder\$obs_installer_file" -ArgumentList "/S" -Wait -WindowStyle Hidden
    Start-Sleep -Seconds "5"
    Remove-Item "$scriptfolder\$obs_installer_file"
}

#open window
[void] $objForm.ShowDialog()