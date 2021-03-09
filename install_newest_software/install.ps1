#get the folderpath
$ScriptPath = $MyInvocation.MyCommand.Definition
$ScriptFolder = [System.IO.Path]::GetDirectoryName($ScriptPath)

# get install informations from json
$software = Get-Content -Raw $scriptfolder\install_software.json | ConvertFrom-Json

#get software and install software if wanted
#7zip
$software_name = "7-Zip"
if (!($software.sevenzip_install -eq "true")) {
    Write-Host "$software_name is not wanted and will not be installed." -ForegroundColor yellow
}else {
    Write-Host "$software_name Installation wird durchgefuehrt." -ForegroundColor Green
    #download of the newest software installer
    Write-Host "download of the newest software version is starting ..." -ForegroundColor Magenta
    $URL = 'https://www.7-zip.org/download.html'
    $software_name = "7Zip"
    $Page = Invoke-RestMethod -Uri $url
    $DLPrefix = $URL.Split('d')[0]
    $RelLink = (((($Page -split '7-Zip for 64-bit Windows')[1] -split '<TR>')[-1] -split 'href="')[1] -split '"')[0]
    $download_path = -join ($DLPrefix, $RelLink)
    $software_file = ((((($Page -split '7-Zip for 64-bit Windows')[1] -split '<TR>')[-1] -split 'href="')[1] -split '"')[0] -split "a/")[1]
    (New-Object System.Net.WebClient).DownloadFile($download_path,"$scriptfolder\$software_file")  
   
    #start the installation
    Write-Host "$software_name installing ..." -ForegroundColor Green
    #Start-Process -FilePath "msiexec.exe" -ArgumentList "/i ""$ScriptFolder\$software_file"" /qn /norestart" -Wait -WindowStyle Hidden
    Start-Sleep -Seconds "5"
    Write-Host "$software_name installed." -ForegroundColor Green
}
#ausweisapp
$software_name = "AusweisApp"
if (!($software.ausweisapp_install -eq "true")) {
    Write-Host "$software_name is not wanted and will not be installed." -ForegroundColor yellow
}else {
    Write-Host "$software_name Installation wird durchgefuehrt." -ForegroundColor Green
    #download of the newest software installer
    Write-Host "download of the newest software version is starting ..." -ForegroundColor Magenta
    $github_api_url = "https://api.github.com/repos/Governikus/AusweisApp2/releases/latest"
    $downloads_list = (Invoke-WebRequest $github_api_url | ConvertFrom-Json).assets.browser_download_url
    foreach ($item in $downloads_list){
        if ($item -like "*.msi"){
            $download_path = $item
        }
    }
    $software_file = ($download_path -split "/")[-1]
    (New-Object System.Net.WebClient).DownloadFile($download_path,"$scriptfolder\$software_file")

    #start the installation
    Write-Host "$software_name installing ..." -ForegroundColor Green
    #Start-Process -FilePath "msiexec.exe" -ArgumentList "/i ""$ScriptFolder\$software_file"" /qn /norestart" -Wait -WindowStyle Hidden
    Start-Sleep -Seconds "5"
    Write-Host "$software_name installed." -ForegroundColor Green
}
#chrome
$software_name = "Google Chrome"
if (!($software.chrome_install -eq "true")) {
    Write-Host "$software_name is not wanted and will not be installed." -ForegroundColor yellow
}else {
    Write-Host "$software_name Installation wird durchgefuehrt." -ForegroundColor Green
    #download of the newest software installer
    Write-Host "download of the newest software version is starting ..." -ForegroundColor Magenta
    #start the installation
    Write-Host "$software_name installing ..." -ForegroundColor Green
}
#citavi
$software_name = "Citavi"
if (!($software.citavi_install -eq "true")) {
    Write-Host "$software_name is not wanted and will not be installed." -ForegroundColor yellow
}else {
    Write-Host "$software_name Installation wird durchgefuehrt." -ForegroundColor Green
    #download of the newest software installer
    Write-Host "download of the newest software version is starting ..." -ForegroundColor Magenta
    $URL = 'https://www.citavi.com/de/download'
    $webpage = Invoke-RestMethod -Uri $url
    $download_path = (($webpage -split "download-msi`" href=`"")[1] -split "`" class")[0]
    $software_file = ($download_path -split "/")[-1]
    (New-Object System.Net.WebClient).DownloadFile($download_path,"$scriptfolder\$software_file")

    #start the installation
    Write-Host "$software_name installing ..." -ForegroundColor Green
    #Start-Process -FilePath "msiexec.exe" -ArgumentList "/i ""$ScriptFolder\$software_file"" /qn /norestart" -Wait -WindowStyle Hidden
    Write-Host "$software_name installed." -ForegroundColor Green
}
#filezilla
$software_name = "FileZilla"
if (!($software.filezilla_install -eq "true")) {
    Write-Host "$software_name is not wanted and will not be installed." -ForegroundColor yellow
}else {
    Write-Host "$software_name Installation wird durchgefuehrt." -ForegroundColor Green
    #download of the newest software installer
    Write-Host "download of the newest software version is starting ..." -ForegroundColor Magenta
    $URL = "https://filezilla-project.org/download.php?show_all=1"
    $Page = Invoke-RestMethod -Uri $url
    $newest_version = (($Page -split "The latest stable version of FileZilla Client is ")[1] -split "</p>")[0]
    $download_path = (($Page -split "`" rel=`"nofollow`">FileZilla_${newest_version}_win64-setup.exe")[0] -split "<a href=`"")[-1]
    $software_file = (($download_path -split "/")[4] -split "exe")[0] + "exe"
    (New-Object System.Net.WebClient).DownloadFile($download_path,"$scriptfolder\$software_file")

    #start the installation
    Write-Host "$software_name installing ..." -ForegroundColor Green
    Start-Process -FilePath "$ScriptFolder\$software_file" -ArgumentList "/S /user=all" -Wait -WindowStyle Hidden
    Start-Sleep -Seconds "5"
    Write-Host "$software_name installed." -ForegroundColor Green
}
#firefox
$software_name = "Firefox"
if (!($software.firefox.install -eq "true")) {
    Write-Host "$software_name is not wanted and will not be installed." -ForegroundColor yellow
}else {
    Write-Host "$software_name Installation wird durchgefuehrt." -ForegroundColor Green
    #download of the newest software installer
    Write-Host "download of the newest software version is starting ..." -ForegroundColor Magenta
    $download_path_esr = "https://download.mozilla.org/?product=firefox-esr-msi-latest-ssl&os=win64&lang=de"
    $newest_version_esr = (Invoke-WebRequest "https://product-details.mozilla.org/1.0/firefox_versions.json" | ConvertFrom-Json).FIREFOX_ESR
    $download_path_latest = "https://download.mozilla.org/?product=firefox-msi-latest-ssl&os=win64&lang=de"
    $newest_version_latest = (Invoke-WebRequest "https://product-details.mozilla.org/1.0/firefox_versions.json" | ConvertFrom-Json).LATEST_FIREFOX_VERSION
    if ($software.firefox.esr -eq "true"){
        $software_file = "Firefox_$newest_version_esr.msi"
        $download_path = $download_path_esr
    }else {
        $software_file = "Firefox_$newest_version_latest.msi"
        $download_path = $download_path_latest
    }
    (New-Object System.Net.WebClient).DownloadFile($download_path,"$scriptfolder\$software_file")

    #start the installation
    Write-Host "$software_name installing ..." -ForegroundColor Green
    #Start-Process -FilePath "msiexec.exe" -ArgumentList "/i ""$ScriptFolder\$software_file"" /qn /norestart" -Wait -WindowStyle Hidden
    Start-Sleep -Seconds "5"
    Write-Host "$software_name installed." -ForegroundColor Green
}
#ghostscript
$software_name = "Ghostscript"
if (!($software.ghostscript_install -eq "true")) {
    Write-Host "$software_name is not wanted and will not be installed." -ForegroundColor yellow
}else {
    Write-Host "$software_name Installation wird durchgefuehrt." -ForegroundColor Green
    #download of the newest software installer
    Write-Host "download of the newest software version is starting ..." -ForegroundColor Magenta
    $github_api_url = "https://api.github.com/repos/ArtifexSoftware/ghostpdl-downloads/releases/latest"
    $downloads_list = (Invoke-WebRequest $github_api_url | ConvertFrom-Json).assets.browser_download_url
    foreach ($item in $downloads_list){
        if ($item -like "*w64.exe"){
            $download_path = $item
        }
    }
    $software_file = ($download_path -split "/")[-1]
    (New-Object System.Net.WebClient).DownloadFile($download_path,"$scriptfolder\$software_file")

    #start the installation
    Write-Host "$software_name installing ..." -ForegroundColor Green
    Start-Process -FilePath "$scriptfolder\$software_file" -ArgumentList "-S" -Wait -WindowStyle Hidden
    Write-Host "$software_name installing ..." -ForegroundColor Green
}
#gimp
$software_name = "Gimp"
if (!($software.gimp_install -eq "true")) {
    Write-Host "$software_name is not wanted and will not be installed." -ForegroundColor yellow
}else {
    Write-Host "$software_name Installation wird durchgefuehrt." -ForegroundColor Green
    #download of the newest software installer
    Write-Host "download of the newest software version is starting ..." -ForegroundColor Magenta
    $URL = 'https://www.gimp.org/downloads/'
    $Page = Invoke-RestMethod -Uri $url
    $dl_site = (($Page -split "windows/`">direct download")[0] -split "<a href=`"")[-1]
    $dl_site = "https:" + $dl_site + "windows/"
    $dl_page = Invoke-RestMethod -Uri $dl_site
    if ($dl_page -split "`"" -contains "gimp-$newest_version-setup.exe"){
        $download_path = $dl_site +"gimp-$newest_version-setup.exe"
    }else {
        Write-Output "There is no new Version found to download.`nPlease check the manually!"
    }
    $software_file = "gimp-$newest_version-setup.exe"
    (New-Object System.Net.WebClient).DownloadFile($download_path,"$scriptfolder\$software_file")
    
    #start the installation
    Write-Host "$software_name installing ..." -ForegroundColor Green
    Start-Process -FilePath "$scriptfolder\$software_file" -ArgumentList "/VERYSILENT /ALLUSERS /NORESTART /SUPPRESSMSGBOXES" -Wait -WindowStyle Hidden
    Write-Host "$software_name installing ..." -ForegroundColor Green
}
#greenshot
$software_name = "Greenshot"
if (!($software.greenshot_install -eq "true")) {
    Write-Host "$software_name is not wanted and will not be installed." -ForegroundColor yellow
}else {
    Write-Host "$software_name Installation wird durchgefuehrt." -ForegroundColor Green
    #download of the newest software installer
    Write-Host "download of the newest software version is starting ..." -ForegroundColor Magenta
    #start the installation
    Write-Host "$software_name installing ..."
}
#inkscape
$software_name = "Inkscape"
if (!($software.inkscape_install -eq "true")) {
    Write-Host "$software_name is not wanted and will not be installed." -ForegroundColor yellow
}else {
    Write-Host "$software_name Installation wird durchgefuehrt." -ForegroundColor Green
    #download of the newest software installer
    Write-Host "download of the newest software version is starting ..." -ForegroundColor Magenta
    $URL = 'https://inkscape.org/de/release/'
    $Page = Invoke-RestMethod -Uri $url
    $download_site = (($Page -split "windows/")[0] -split " <a href=`"")[-1]
    $download_site = "https://inkscape.org" + $download_site + "windows/64-bit/msi/dl"
    $dl_page = Invoke-RestMethod -Uri $download_site
    $download_path = (($dl_page -split "`">klicke bitte hier</a> zum Herunterladen")[0] -split "<a href=`"")[-1]
    $download_path = "https://inkscape.org" + $download_path
    $software_file = ($download_path -split "/")[-1]
    (New-Object System.Net.WebClient).DownloadFile($download_path,"$scriptfolder\$software_file")

    #start the installation
    Write-Host "$software_name installing ..." -ForegroundColor Green
    Start-Process -FilePath "msiexec.exe" -ArgumentList "/i ""$ScriptFolder\$software_file"" /qn /norestart" -Wait -WindowStyle Hidden
    Start-Sleep -Seconds "5"
    Write-Host "$software_name installed." -ForegroundColor Green
}
#irfanview
$software_name = "IrfanView"
if (!($software.irfanview_install -eq "true")) {
    Write-Host "$software_name is not wanted and will not be installed." -ForegroundColor yellow
}else {
    Write-Host "$software_name Installation wird durchgefuehrt." -ForegroundColor Green
    #download of the newest software installer
    Write-Host "download of the newest software version is starting ..." -ForegroundColor Magenta
    $URL = 'https://www.irfanview.com/'
    $Page = Invoke-RestMethod -Uri $url
    $download_path = ((($Page -split "<p class=`"download-style-box`">64-BIT</p>")[1] -split "`" target=")[0] -split "<a href=`"")[1]
    $software_file = ($download_path -split "=")[-1]
    (New-Object System.Net.WebClient).DownloadFile($download_path,"$scriptfolder\$software_file")

    #start the installation
    Write-Host "$software_name installing ..."
    Start-Process -FilePath "$scriptfolder\$installer_file" -ArgumentList "/silent /desktop=0 /group=1 /allusers=1 /assoc=1" -Wait -WindowStyle Hidden
    Start-Sleep -Seconds "5"
    Write-Host "$software_name installed." -ForegroundColor Green
}
#keepassxc
$software_name = "KeePassXC"
if (!($software.keepassxc_install -eq "true")) {
    Write-Host "$software_name is not wanted and will not be installed." -ForegroundColor yellow
}else {
    Write-Host "$software_name Installation wird durchgefuehrt." -ForegroundColor Green
    #download of the newest software installer
    Write-Host "download of the newest software version is starting ..." -ForegroundColor Magenta
    $github_api_url = "https://api.github.com/repos/keepassxreboot/keepassxc/releases/latest"
    $downloads_list = (Invoke-WebRequest $github_api_url | ConvertFrom-Json).assets.browser_download_url
    foreach ($item in $downloads_list){
    if ($item -like "*64.msi"){
        $download_path = $item
        }
    }
    $software_file = ($download_path -split "/")[-1]
    (New-Object System.Net.WebClient).DownloadFile($download_path,"$scriptfolder\$software_file")

    #start the installation
    Write-Host "$software_name installing ..." -ForegroundColor Green
    Start-Process -FilePath "msiexec.exe" -ArgumentList "/i ""$ScriptFolder\$software_file"" /qn /norestart" -Wait -WindowStyle Hidden
    Start-Sleep -Seconds "5"
    Write-Host "$software_name installed." -ForegroundColor Green
}
#notepad++
$software_name = "Notepad++"
if (!($software.npp_install -eq "true")) {
    Write-Host "$software_name is not wanted and will not be installed." -ForegroundColor yellow
}else {
    Write-Host "$software_name Installation wird durchgefuehrt." -ForegroundColor Green
    #download of the newest software installer
    Write-Host "download of the newest software version is starting ..." -ForegroundColor Magenta
    $github_api_url = "https://api.github.com/repos/notepad-plus-plus/notepad-plus-plus/releases/latest"
    $downloads_list = (Invoke-WebRequest $github_api_url | ConvertFrom-Json).assets.browser_download_url
    foreach ($item in $downloads_list){
        if ($item -like "*x64.exe"){
            $download_path = $item
        }
    }
    $software_file = ($download_path -split "/")[-1]
    (New-Object System.Net.WebClient).DownloadFile($download_path,"$scriptfolder\$software_file")

    #start the installation
    Write-Host "$software_name installing ..." -ForegroundColor Green
    #Start-Process -FilePath "$ScriptFolder\$software_file" -ArgumentList "/S" -Wait -WindowStyle Hidden
    Write-Host "$software_name installed." -ForegroundColor Green
}
#pdf24
$software_name = "PDF-24 Creator"
if (!($software.pdf24_install -eq "true")) {
    Write-Host "$software_name is not wanted and will not be installed." -ForegroundColor yellow
}else {
    Write-Host "$software_name Installation wird durchgefuehrt." -ForegroundColor Green
    #download of the newest software installer
    Write-Host "download of the newest software version is starting ..." -ForegroundColor Magenta
    $URL = 'https://tools.pdf24.org/de/creator'
    $Page = Invoke-RestMethod -Uri $url
    $dllinkpart = (((($Page -split "business")[-1] -split "',updateUrl:")[0] -split "//")[1] -split "{")[0]
    $newest_version = ((($Page -split "Aktuelle Version</div>")[1] -split "</span>")[0] -split "Version ")[1]
    $download_path = "https://" + $dllinkpart + $newest_version
    $software_file = "pdf24-creator-$newest_version.msi"
    (New-Object System.Net.WebClient).DownloadFile($download_path,"$scriptfolder\$software_file")

    #start the installation
    Write-Host "$software_name installing ..." -ForegroundColor Green
    #Start-Process -FilePath "msiexec.exe" -ArgumentList "/i ""$ScriptFolder\$software_file"" /qn /norestart" -Wait -WindowStyle Hidden
    Write-Host "$software_name installed." -ForegroundColor Green
}
#putty
$software_name = "Putty"
if (!($software.putty_install -eq "true")) {
    Write-Host "$software_name is not wanted and will not be installed." -ForegroundColor yellow
}else {
    Write-Host "$software_name Installation wird durchgefuehrt." -ForegroundColor Green
    #download of the newest software installer
    Write-Host "download of the newest software version is starting ..." -ForegroundColor Magenta
    $URL = 'https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html'
    $Page = Invoke-RestMethod -Uri $url
    $download_path = (($Page -split "64-bit:</span>`n<span class=`"downloadfile`"><a href=`"")[1] -split "`"><code>")[0]
    $software_file = ($download_path -split "/")[-1]
    (New-Object System.Net.WebClient).DownloadFile($download_path,"$scriptfolder\$software_file")

    #start the installation
    Write-Host "$software_name installing ..." -ForegroundColor Green
    #Start-Process -FilePath "msiexec.exe" -ArgumentList "/i ""$ScriptFolder\$software_file"" /qn /norestart" -Wait -WindowStyle Hidden
    Write-Host "$software_name installed." -ForegroundColor Green
}
#rocketchat
$software_name = "RocketChat"
if (!($software.rocketchat_install -eq "true")) {
    Write-Host "$software_name is not wanted and will not be installed." -ForegroundColor yellow
}else {
    Write-Host "$software_name Installation wird durchgefuehrt." -ForegroundColor Green
    #download of the newest software installer
    Write-Host "download of the newest software version is starting ..." -ForegroundColor Magenta
    $github_api_url = "https://api.github.com/repos/RocketChat/Rocket.Chat.Electron/releases/latest"
    $downloads_list = (Invoke-WebRequest $github_api_url | ConvertFrom-Json).assets.browser_download_url
    foreach ($item in $downloads_list){
        if ($item -like "*.msi"){
            $download_path = $item
        }
    }
    $software_file = ($download_path -split "/")[-1]
    (New-Object System.Net.WebClient).DownloadFile($download_path,"$scriptfolder\$software_file")

    #start the installation
    Write-Host "$software_name installing ..." -ForegroundColor Green
    #Start-Process -FilePath "msiexec.exe" -ArgumentList "/i ""$ScriptFolder\$software_file"" /qn /norestart" -Wait -WindowStyle Hidden
    Write-Host "$software_name installed." -ForegroundColor Green
}
#thunderbird
$software_name = "Thunderbird"
if (!($software.thunderbird_install -eq "true")) {
    Write-Host "$software_name is not wanted and will not be installed." -ForegroundColor yellow
}else {
    Write-Host "$software_name Installation wird durchgefuehrt." -ForegroundColor Green
    #download of the newest software installer
    Write-Host "download of the newest software version is starting ..." -ForegroundColor Magenta

    $newest_version = (Invoke-WebRequest "https://product-details.mozilla.org/1.0/thunderbird_versions.json" | ConvertFrom-Json).LATEST_THUNDERBIRD_VERSION
    $download_path = "https://download.mozilla.org/?product=thunderbird-$newest_version-msi-SSL&os=win64&lang=de"
    $software_file = "Thunderbird_$newest_version.exe"
    (New-Object System.Net.WebClient).DownloadFile($download_path,"$scriptfolder\$software_file")

    #start the installation
    Write-Host "$software_name installing ..." -ForegroundColor Green
    #Start-Process -FilePath "msiexec.exe" -ArgumentList "/i ""$ScriptFolder\$software_file"" /qn /norestart" -Wait -WindowStyle Hidden
    Write-Host "$software_name installed." -ForegroundColor Green
}
#vlc
$software_name = "VLC"
if (!($software.vlc_install -eq "true")) {
    Write-Host "$software_name is not wanted and will not be installed." -ForegroundColor yellow
}else {
    Write-Host "$software_name Installation wird durchgefuehrt." -ForegroundColor Green
    #download of the newest software installer
    Write-Host "download of the newest software version is starting ..." -ForegroundColor Magenta
    $URL = 'https://www.videolan.org/vlc/download-windows.html'
    $Page = Invoke-RestMethod -Uri $url
    $Downloadlink = (($Page -split "`">Installer for 64bit version")[0] -split "><a href=`"//")[-1]
    $download_path = "https://" + $Downloadlink
    $software_file = ($download_path -split '/')[-1]
    (New-Object System.Net.WebClient).DownloadFile($download_path,"$scriptfolder\$software_file")

    #start the installation
    Write-Host "$software_name installing ..." -ForegroundColor Green
    #Start-Process -FilePath "$scriptfolder\$installer_file" -ArgumentList "/S L=1031" -Wait -WindowStyle Hidden
    Write-Host "$software_name installed." -ForegroundColor Green
}