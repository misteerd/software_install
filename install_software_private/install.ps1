#elevate as admin
# if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) 
# { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

##create window
#create window itself
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
$objForm = New-Object System.Windows.Forms.Form
$objForm.Backcolor="darkgray"
$objForm.StartPosition = "CenterScreen"
$objForm.Text = "Install Software"
$objForm.size = New-Object System.Drawing.Size(500,300)

$install_button_box = New-Object System.Windows.Forms.GroupBox
$install_button_box.Location = '45,20'
$install_button_box.size = '400,190'
$install_button_box.text = "Which Software you want to install?"

#Create the collection of radio buttons
$check_7zip = New-Object System.Windows.Forms.CheckBox
$check_7zip.Location = '20,30'
$check_7zip.size = '150,20'
$check_7zip.Checked = $true 
$check_7zip.Text = "Install 7-Zip"
$objForm.Controls.Add($check_7zip)

$check_battlenet = New-Object System.Windows.Forms.CheckBox
$check_battlenet.Location = '20,50'
$check_battlenet.size = '150,20'
$check_battlenet.Checked = $false 
$check_battlenet.Text = "Install Battle.Net"
$objForm.Controls.Add($check_battlenet)

$check_chrome = New-Object System.Windows.Forms.CheckBox
$check_chrome.Location = '20,70'
$check_chrome.size = '150,20'
$check_chrome.Checked = $false 
$check_chrome.Text = "Install Chrome"
$objForm.Controls.Add($check_chrome)

$check_epicgames = New-Object System.Windows.Forms.CheckBox
$check_epicgames.Location = '20,90'
$check_epicgames.size = '150,20'
$check_epicgames.Checked = $false 
$check_epicgames.Text = "Install EpicGames"
$objForm.Controls.Add($check_epicgames)

$check_firefox = New-Object System.Windows.Forms.CheckBox
$check_firefox.Location = '20,110'
$check_firefox.size = '150,20'
$check_firefox.Checked = $false 
$check_firefox.Text = "Install Firefox"
$objForm.Controls.Add($check_firefox)

$check_libreoffice = New-Object System.Windows.Forms.CheckBox
$check_libreoffice.Location = '20,110'
$check_libreoffice.size = '150,20'
$check_libreoffice.Checked = $false 
$check_libreoffice.Text = "Install Firefox"
$objForm.Controls.Add($check_libreoffice)

$check_npp = New-Object System.Windows.Forms.CheckBox
$check_npp.Location = '20,130'
$check_npp.size = '150,20'
$check_npp.Checked = $true 
$check_npp.Text = "Install Notepad++"
$objForm.Controls.Add($check_npp)

$check_steam = New-Object System.Windows.Forms.CheckBox
$check_steam.Location = '20,150'
$check_steam.size = '150,20'
$check_steam.Checked = $false 
$check_steam.Text = "Install Steam"
$objForm.Controls.Add($check_steam)

$check_thunderbird = New-Object System.Windows.Forms.CheckBox
$check_thunderbird.Location = '200,30'
$check_thunderbird.size = '150,20'
$check_thunderbird.Checked = $false 
$check_thunderbird.Text = "Install Thunderbird"
$objForm.Controls.Add($check_thunderbird)

# Add all the GroupBox controls on one line
$install_button_box.Controls.AddRange(@($check_7zip, $check_battlenet, $check_chrome, $check_epicgames, $check_firefox, $check_libreoffice, $check_npp, $check_steam, $check_thunderbird))

#create install button
$start_ins_button = New-Object System.Windows.Forms.Button
#button size,location and content
$start_ins_button.Location = New-Object System.Drawing.Size(250,220)
$start_ins_button.Size = New-Object System.Drawing.Size(100,25)
$start_ins_button.Text = "Start Installation"
$start_ins_button.Name = "Start Installation"
#$start_ins_button.DialogResult = "start"
#start button function
$start_ins_button.Add_Click({start_install($check_7zip.Checked, $check_battlenet.Checked, $check_chrome.Checked, $check_epicgames.Checked, $check_firefox.Checked,$check_libreoffice.Checked, $check_npp.Checked, $check_steam.Checked, $check_thunderbird.Checked) 
    $objForm.Close()})
$objForm.Controls.Add($start_ins_button)

#create cancel button
$cancel_button = New-Object System.Windows.Forms.Button
#button size,location and content
$cancel_button.Location = New-Object System.Drawing.Size(370,220)
$cancel_button.Size = New-Object System.Drawing.Size(75,25)
$cancel_button.Text = "Abbrechen"
$cancel_button.Name = "Abbrechen"
$cancel_button.DialogResult = "Cancel"
#cancel button function
$cancel_button.Add_Click({$objForm.Close()})
$objForm.Controls.Add($cancel_button)

$objForm.Controls.AddRange(@($install_button_box,$start_ins_button,$cancel_button))

#open window
[void] $objForm.ShowDialog()

function start_install {
    param ()
    if ($check_7zip.Checked -eq $true) {
        Write-Host "7-Zip installation startet ..."
        install_7zip
    }
    if ($check_battlenet.Checked -eq $true) {
        Write-Host "Battle.Net installation startet ..."
        install_battlenet
    }
    if ($check_chrome.Checked -eq $true) {
        Write-Host "Google Crome installation startet ..."
        install_chrome
    }
    if ($check_epicgames.Checked -eq $true) {
        Write-Host "Epic Games installation startet ..."
        install_epicgames
    }
    if ($check_firefox.Checked -eq $true) {
        Write-Host "Mozilla Firefox installation startet ..."
        install_firefox
    }
    if ($check_npp.Checked -eq $true) {
        Write-Host "Notepad++ installation startet ..."
        install_npp
    }
    if ($check_steam.Checked -eq $true) {
        Write-Host "Steam installation startet ..."
        install_steam
    }
    if ($check_thunderbird.Checked -eq $true) {
        Write-Host "Thunderbird installation startet ..."
        install_thunderbird
    }     
}
function install_7zip {
    
}
function install_battlenet {
    
}
function install_chrome {
    
}
function install_epicgames {
    
}
function install_firefox {
    
}
function install_npp {
    
}
function install_steam {
    
}
function install_thunderbird {
    
}