# get install informations from json
$software = Get-Content -Raw .\install_software.json | ConvertFrom-Json

#get the folderpath
$ScriptPath = $MyInvocation.MyCommand.Definition
$ScriptFolder = [System.IO.Path]::GetDirectoryName($ScriptPath)


#get software and install software if wanted
#firefox
$software_name = "Firefox"
if (!($software.firefox_install -eq "true")) {
    Write-Output "$software_name is not wanted and will not be installed."
}else {
    Write-Output "$software_name Installation wird durchgeführt."
    #download of the newest software installer
    Write-Output "download of the newest software version is starting ..."
    #start the installation
    Write-Output "$software_name installing ..."
}
#notepad++
$software_name = "Notepad++"
if (!($software.npp_install -eq "true")) {
    Write-Output "$software_name is not wanted and will not be installed."
}else {
    Write-Output "$software_name Installation wird durchgeführt."
    #download of the newest software installer
    Write-Output "download of the newest software version is starting ..."
    $software_file = 
    #start the installation
    Write-Output "$software_name installing ..."
    Start-Process -FilePath "$ScriptFolder\$software_file" -ArgumentList "/S" -Wait -WindowStyle Hidden
}
#thunderbird
$software_name = "Thunderbird"
if (!($software.thunderbird_install -eq "true")) {
    Write-Output "$software_name is not wanted and will not be installed."
}else {
    Write-Output "$software_name Installation wird durchgeführt."
    #download of the newest software installer
    Write-Output "download of the newest software version is starting ..."
    #start the installation
    Write-Output "$software_name installing ..."
}
#greenshot
$software_name = "Greenshot"
if (!($software.greenshot_install -eq "true")) {
    Write-Output "$software_name is not wanted and will not be installed."
}else {
    Write-Output "$software_name Installation wird durchgeführt."
    #download of the newest software installer
    Write-Output "download of the newest software version is starting ..."
    #start the installation
    Write-Output "$software_name installing ..."
}
#pdf24
$software_name = "PDF-24 Creator"
if (!($software.pdf24_install -eq "true")) {
    Write-Output "$software_name is not wanted and will not be installed."
}else {
    Write-Output "$software_name Installation wird durchgeführt."
    #download of the newest software installer
    Write-Output "download of the newest software version is starting ..."
    #start the installation
    Write-Output "$software_name installing ..."
}
#chrome
$software_name = "Google Chrome"
if (!($software.chrome_install -eq "true")) {
    Write-Output "$software_name is not wanted and will not be installed."
}else {
    Write-Output "$software_name Installation wird durchgeführt."
    #download of the newest software installer
    Write-Output "download of the newest software version is starting ..."
    #start the installation
    Write-Output "$software_name installing ..."
}
#7zip
$software_name = "7-Zip"
if (!($software.sevenzip_install -eq "true")) {
    Write-Output "$software_name is not wanted and will not be installed."
}else {
    Write-Output "$software_name Installation wird durchgeführt."
    #download of the newest software installer
    Write-Output "download of the newest software version is starting ..."
    $software_file = 
    #start the installation
    Write-Output "$software_name installing ..."
    Start-Process -FilePath "msiexec.exe" -ArgumentList "/i ""$ScriptFolder\$software_file"" /qn /norestart" -Wait -WindowStyle Hidden
    Start-Sleep -Seconds "5"
}
#keepassxc
$software_name = "KeePassXC"
if (!($software.keepassxc_install -eq "true")) {
    Write-Output "$software_name is not wanted and will not be installed."
}else {
    Write-Output "$software_name Installation wird durchgeführt."
    #download of the newest software installer
    Write-Output "download of the newest software version is starting ..."
    $software_file = 
    #start the installation
    Write-Output "$software_name installing ..."
    Start-Process -FilePath "msiexec.exe" -ArgumentList "/i ""$ScriptFolder\$software_file"" /qn /norestart" -Wait -WindowStyle Hidden
    Start-Sleep -Seconds "5"
}