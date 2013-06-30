Dim StartAtDir, DaysBack, FromTime, Exact, sysDate

Function TitleAndUsage
  Dim s
  WScript.Echo "+-------------------------------+"
  WScript.Echo "| RECENT.VBS Find recent files  |"
  WScript.Echo "| By Prof. Timo Salmi (c) 2004  |"
  WScript.Echo "| Last modified Tue 7-Sep-2004  |"
  WScript.Echo "+-------------------------------+"
  WScript.Echo
  s = "Usage: cscript //nologo "
  s = s & WScript.ScriptFullName & " StartAtDirectory DaysBack FromTime [Exact]"
  WScript.Echo s
  WScript.Echo
  WScript.Echo "Examples: "
  WScript.Echo " cscript //nologo " & WScript.ScriptFullName & " C:\_F 0 150000"
  s = " cscript //nologo " & WScript.ScriptName
  s = s & " " & Chr(34) & "C:\Program Files" & Chr(34)
  s = s & " 1 000000 Exact"
  WScript.Echo s
  WScript.Echo
  WScript.Echo "For more usage information see TSCMDINF.TXT"
End Function

' Functions for checking the format of the arguments to be given
Function CheckLongOk(x)
  Dim y
  On Error Resume Next
  y = Clng(x)
  On Error Goto 0
  if TypeName(y) = "Long" Then
    If x-y <> 0.0 Then
      CheckLongOk = 0
    Else
      CheckLongOk = -1
    End If
  Else
    CheckLongOk = 0
  End If
End Function

Function CheckLongOkAndReport(x)
  if Not CBool(CheckLongOk(x)) Then
    WScript.Echo "Error: " & x & " is not a proper long integer"
    WScript.Quit
  End If
End Function

Function CheckPackedTimeOkAndReport(x)
  if Not CBool(CheckLongOk(x)) Then
    WScript.Echo "Error: " & x & " is not a proper long integer"
    WScript.Quit
  End If
  If Len(x) <> 6 Then
    WScript.Echo "Error: FromTime must be exactly six digits long"
    WScript.Quit
  End If
  If CLng(x) < 0 OR CLng(x) > 235959 Then
    WScript.Echo "Error: FromTime out of range [000000..235959]"
    WScript.Quit
  End If
End Function

Function CheckFolderExistenceOkAndReport(FolderName)
  Dim FSO
  Set FSO=CreateObject("Scripting.FileSystemObject")
  If Not FSO.FolderExists(FolderName) Then
    WScript.Echo "Error: Folder " & FolderName & " not found"
    WScript.Quit
  End If
End Function

' Get the arguments given to the script
Function GetArguments
  StartAtDir=WScript.Arguments.Unnamed(0)
  CheckFolderExistenceOkAndReport(StartAtDir)
  CheckLongOkAndReport(WScript.Arguments.Unnamed(1))
  DaysBack=CLng(WScript.Arguments.Unnamed(1))
  CheckPackedTimeOkAndReport(WScript.Arguments.Unnamed(2))
  FromTime=CLng(WScript.Arguments.Unnamed(2))
  Exact=CBool(0)
  if WScript.Arguments.Count = 4 Then
    Select Case Ucase(WScript.Arguments.Unnamed(3))
      Case "EXACT" Exact=CBool(-1)
      Case "E"     Exact=CBool(-1)
    End Select
  End If
End Function

' Get the age of a file in days
Function FileAge(FileName)
  Dim FSO, fin
  Set FSO = CreateObject("Scripting.FileSystemObject")
  Set fin = FSO.GetFile(FileName)
  FileAge = DateDiff("d", fin.DateLastModified, SysDate)
End Function

' Pad a string with blanks if need be
Function PadLeft(Str,Places)
  Dim s
  For i = 1 To Places-1
    s = s & " "
  Next
  PadLeft = Mid(s & Str, Len(Str), Places)
End Function

' Pad a string with zeros if need be
Function Pad0Left(Str,Places)
  Dim s
  For i = 1 To Places-1
    s = s & "0"
  Next
  Pad0Left = Mid(s & Str, Len(Str), Places)
End Function

'Convert the date/time into YYYYMMDD format
Function ToYyyyMmDd(DateStr)
  Dim s
  s = DatePart("yyyy", DateStr)
  s = s & Pad0Left(DatePart("m", DateStr),2)
  s = s & Pad0Left(DatePart("d", DateStr),2)
  ToYyyyMmDd=s
End Function

'Convert the date/time into HHMMSS format
Function ToHhMmSs(DateStr)
  Dim s
  s = Pad0Left(DatePart("h", DateStr),2)
  s = s & Pad0Left(DatePart("n", DateStr),2)
  s = s & Pad0Left(DatePart("s", DateStr),2)
  ToHhMmSs = s
End Function

' Display the file information if the file's age fits the range
Function ShowFileDaysbackSizeName(FileName)
  Dim FSO, fin, s
  Set FSO = CreateObject("Scripting.FileSystemObject")
  if FSO.FileExists(FileName) Then
    Set fin = FSO.GetFile(FileName)
    If FileAge(fin) <= DaysBack Then
      If CLng(ToHhMmSs(fin.DateLastModified)) >= FromTime Then
        s = ToYyyyMmDd(fin.DateLastModified) & " "
        s = s & ToHhMmSs(fin.DateLastModified) & " "
        s = s & PadLeft(fin.size,10) & " " & fin
        WScript.Echo s
      End if
    End If
  Else
    WScript.Echo "Error: File " & FileName & " not found"
  End if
End Function

Function ShowFileExactSizeName(FileName)
  Dim FSO, fin, s
  Set FSO = CreateObject("Scripting.FileSystemObject")
  if FSO.FileExists(FileName) Then
    Set fin = FSO.GetFile(FileName)
    If FileAge(fin) = DaysBack Then
      If CLng(ToHhMmSs(fin.DateLastModified)) >= FromTime Then
        s = ToYyyyMmDd(fin.DateLastModified) & " "
        s = s & ToHhMmSs(fin.DateLastModified) & " "
        s = s & PadLeft(fin.size,10) & " " & fin
        WScript.Echo s
      End if
    End If
  Else
    WScript.Echo "Error: File " & FileName & " not found"
  End if
End Function

Function TraverseOneFolder(DirName)
  Dim fso, f, f1, f2, fc
  Set fso = CreateObject("Scripting.FileSystemObject")
  Set f = fso.GetFolder(DirName)
  Set fc = f.Files
  For Each f1 in fc
    f2 = f & "\" & f1.name
    if Exact Then
      ShowFileExactSizeName(f2)
    Else
      ShowFileDaysbackSizeName(f2)
    End If
  Next
End Function

Function TraverseManyFolders(StartDirName)
   Dim fso, f, f1, sf
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set f = fso.GetFolder(StartDirName)
   if Instr (1, Ucase(f), "RECYCLER") = 0  Then
     TraverseOneFolder(f)
   End If
   Set sf = f.SubFolders
   For Each f1 in sf
     if Instr (1, Ucase(f1), "RECYCLER") = 0  Then
       TraverseManyFolders(f1)
     End If
   Next
End Function

' The main program
if WScript.Arguments.Count < 3 Then
  TitleAndUsage
  WScript.Quit
End If
sysDate = Date
GetArguments
Dim WshShell
Set WshShell = WScript.CreateObject("WScript.shell")
TraverseManyFolders StartAtDir
