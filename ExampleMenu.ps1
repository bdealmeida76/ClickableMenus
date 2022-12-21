. .\ClickableMenus.ps1

$counter = 0;

$form1      = New-UIForm -Name 'Form1' -Border
$button1    = New-UIButton -Text "Accept" -X 4 -HighlightStyle 'ColorElement' -ClickScript {
    $str = "You checked"
    foreach($box in $checkboxes) {
        if($box.Checked) {
            $str += " $($box.Text)"
        }
    }

    $label1.UpdateText("$($script:counter += 1; $script:counter) $str")
}
$button2    = New-UIButton -Text "Decline" -X 22 -QuitsForm -HighlightStyle 'Underline'
$button3    = New-UIButton -Text "Options?" -X 41 -QuitsForm -HighlightStyle 'ColorText'
$checkboxes = @(
    New-UICheckbox -X 4 -Y 10 -Text "We" -HighlightStyle Underline
    New-UICheckbox -X 4 -Y 11 -Text "Like" -HighlightStyle ColorElement
    New-UICheckbox -X 4 -Y 12 -Text "To Party" -HighlightStyle ColorText
)
$label1     = New-UILabel -Text "Test your might!" -X 4 -Y 6

$form1.Add($button1)
$form1.Add($button2)
$form1.Add($button3)
$form1.Add($checkboxes)
$form1.Add($label1)

$res = $form1.Show()

switch($res.Text) {
    'Accept' {
        'Might forever!!'
    }
    'Decline' {
        'Might denied :('
    }
    'Options?' {
        'Make a choice next time.'
    }
    Default {
        "That wasn't allowed..."
    }
}

<#Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Data Entry Form'
$form.Size = New-Object System.Drawing.Size(300,200)
$form.StartPosition = 'CenterScreen'

$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(75,120)
$okButton.Size = New-Object System.Drawing.Size(75,23)
$okButton.Text = 'OK'
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $okButton
$form.Controls.Add($okButton)

$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(150,120)
$cancelButton.Size = New-Object System.Drawing.Size(75,23)
$cancelButton.Text = 'Cancel'
$cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $cancelButton
$form.Controls.Add($cancelButton)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,20)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = 'Please enter the information in the space below:'
$form.Controls.Add($label)

$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(10,40)
$textBox.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($textBox)

$form.Topmost = $true

$form.Add_Shown({$textBox.Select()})
$result = $form.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
    $x = $textBox.Text
    $x
}#>