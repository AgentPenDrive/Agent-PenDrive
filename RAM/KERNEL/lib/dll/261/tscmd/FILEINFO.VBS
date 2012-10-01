Dim a, d, s, FSO, fin, FileName, sysDate
'
' Title
WScript.Echo "+-----------------------------------+"
WScript.Echo "| FILEINFO.VBS File Information     |"
WScript.Echo "| By Prof. Timo Salmi (c) 2004-2007 |"
WScript.Echo "| Last modified Sat 22-Dec-2007     |"
WScript.Echo "+-----------------------------------+"
WScript.Echo
'
' Check for the correct usage
if WScript.Arguments.Count = 0 Then
  s = "Usage: cscript //nologo "
  s = s & WScript.ScriptFullName & " FileName"
  WScript.Echo s
  WScript.Quit
End If
'
' Test for existence and get a fully qualified file name
Set FSO=CreateObject("Scripting.FileSystemObject")
FileName=WScript.Arguments.Unnamed(0)
'
if not (FSO.FileExists(FileName) or FSO.FolderExists(FileName)) Then
  WScript.Echo "File " & FileName & " Not Found"
  WScript.Quit
End If
if FSO.DriveExists(FileName) Then
  'Set fin = fso.GetDrive(fso.GetDriveName(FileName))
  WScript.Echo FileName & " points to a drive or a main directory!"
  WScript.Quit
End if
if FSO.FileExists(FileName) Then
  Set fin = FSO.GetFile(FileName)
End if
if FSO.FolderExists(FileName) Then
  Set fin = FSO.GetFolder(FileName)
End if
'
' Alternative, condensed date/time format preparations, not used
d = Mid(fin.DateLastModified, 7, 4)
d = d & Mid(fin.DateLastModified, 4, 2)
d = d & Mid(fin.DateLastModified, 1, 2)
d = d & Mid(fin.DateLastModified, 12, 2)
d = d & Mid(fin.DateLastModified, 15, 2)
d = d & Mid(fin.DateLastModified, 18, 2)
'
' File attributes
If (fin.attributes and   2) Then : a = a & "H" : End If
If (fin.attributes and   4) Then : a = a & "S" : End If
If (fin.attributes and   1) Then : a = a & "R" : End If
If (fin.attributes and  32) Then : a = a & "A" : End If
If (fin.attributes and   8) Then : a = a & "V" : End If
If (fin.attributes and  16) Then : a = a & "D" : End If
If (fin.attributes and  64) Then : a = a & "L" : End If
If (fin.attributes and 128) Then : a = a & "C" : End If
'
'Get the current date
sysDate = Date
'
' Left padding
Function PadLeft7(s)
  PadLeft7 = Mid("      " & s, Len(s), 7)
End Function
'
' Get and display the properties
WScript.Echo fin
'
s = "Size:          " & fin.size
WScript.StdOut.WriteLine s
'
s = "Attributes:    " & a
WScript.StdOut.WriteLine s
'
s = "Created:       "
s = s & fin.DateCreated
s = s & PadLeft7(DateDiff("d", fin.DateCreated, SysDate))
s = s & " days ago"
WScript.StdOut.WriteLine s
'
s = "Last modified: "
s = s & fin.DateLastModified
s = s & PadLeft7(DateDiff("d", fin.DateLastModified, SysDate))
s = s & " days ago"
WScript.StdOut.WriteLine s
'
s = "Last accessed: "
s = s & fin.DateLastAccessed
s = s & PadLeft7(DateDiff("d", fin.DateLastAccessed, SysDate))
s = s & " days ago"
WScript.StdOut.WriteLine s
