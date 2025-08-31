Add-Type -AssemblyName Microsoft.Office.Interop.Excel

[Microsoft.Office.Interop.Excel.ApplicationClass]$excel = New-Object -ComObject Excel.Application
$excel.Visible = $true

# Add a new workbook
$workbook = $excel.Workbooks.Add()

$workbook | Get-Member
$workbook.

# Access the first worksheet
$worksheet = $workbook.Worksheets.Item(1)

$worksheet | Get-Member

# Example: Set a value in cell A1
$worksheet.Cells.Item(1, 1).Value = "Hello, Excel!"
$worksheet.Cells.Ite

# Save and close (optional)
# $workbook.SaveAs("D:\Study-PowerShell\Example.xlsx")
# $excel.Quit()

# Release COM objects
# [System.Runtime.InteropServices.Marshal]::ReleaseComObject($worksheet) | Out-Null
# [System.Runtime.InteropServices.Marshal]::ReleaseComObject($workbook) | Out-Null
# [System.Runtime.InteropServices.Marshal]::ReleaseComObject($excel) | Out-Null