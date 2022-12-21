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
