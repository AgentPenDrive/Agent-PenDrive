Function TitleAndUsage
  Dim s
  WScript.Echo "+------------------------------------------------------+"
  WScript.Echo "| XPMOVE.VBS To move more recent files between folders |"
  WScript.Echo "| Copyright (c) 2004-2005 by Prof. Timo Salmi          |"
  WScript.Echo "| Last modified Sat 31-Dec-2005                        |"
  WScript.Echo "+------------------------------------------------------+"
  WScript.Echo
  s = "Usage: cscript //nologo "
  s = s & WScript.ScriptName & " FromFolder ToFolder [/sub:no]"
  WScript.Echo s
  WScript.Echo
  WScript.Echo "If /sub:no is not present, also ToFolder subfolders are traversed"
  WScript.Echo
  WScript.Echo "Warning: Moving files can always involve some dangers."
  WScript.Echo "         All the risks are carried by the user alone."
  WScript.Echo "         DON'T USE UNLESS YOU KNOW WHAT YOU ARE DOING"
End Function

Function CheckFileExistenceOkAndReport(FileName)
  Dim FSO
  Set FSO=CreateObject("Scripting.FileSystemObject")
  If Not FSO.FileExists(FileName) Then
    WScript.Echo "Error: File " & FileName & " not found"
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

' Pad a string with zeros if need be
Function Pad0Left(Str,Places)
  Dim s
  For i = 1 To Places-1
    s = s & "0"
  Next
  Pad0Left = Mid(s & Str, Len(Str), Places)
End Function

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

Function GetFileDate(FileName)
  Dim FSO, fin
  Set FSO = CreateObject("Scripting.FileSystemObject")
  Set fin = FSO.GetFile(FileName)
  GetFileDate = ToYyyyMmDd(fin.DateLastModified)
End Function

Function GetFileTime(FileName)
  Dim FSO, fin
  Set FSO = CreateObject("Scripting.FileSystemObject")
  Set fin = FSO.GetFile(FileName)
  GetFileTime = ToHhMmSs(fin.DateLastModified)
End Function

' Show information about a file
Function ShowFileInfo(FileName)
  Dim FileDate, FileTime, fso, f, s
  s = GetFileDate(FileName)
  FileDate = s
  s = GetFileTime(FileName)
  FileTime = s
  Set FSO=CreateObject("Scripting.FileSystemObject")
  Set f = fso.GetFile(FileName)
  WScript.Echo FileDate & " " & FileTime & " " & f.size & " " & FileName
End Function

' Show the information about the two files
Function ShowFileInfo2(FileName1,FileName2)
  ShowFileInfo(FileName1)
  ShowFileInfo(FileName2)
End Function

' Is the first file more recent than the second
Function IsFirstLater(FileName1,FileName2)
  Dim FileDate1, FileDate2, FileTime1, FileTime2, s
  s = GetFileDate(FileName1)
  FileDate1 = CLng(s)
  s = GetFileTime(FileName1)
  FileTime1 = CLng(s)
  s = GetFileDate(FileName2)
  FileDate2 = CLng(s)
  s = GetFileTime(FileName2)
  FileTime2 = CLng(s)
  IsFirstLater = 0
  If FileDate1 > FileDate2 Then
    IsFirstLater = -1
  End If
  If FileDate1 = FileDate2 Then
    If FileTime1 > FileTime2 Then
      IsFirstLater = -1
    End If
  End If
End Function

' Are the file names the same save for the paths
Function IsSameName(FileName1,FileName2)
  Dim FSO, f1, f2
  Set FSO = CreateObject("Scripting.FileSystemObject")
  f1 = FSO.GetBaseName(FileName1) & "." & FSO.GetExtensionName(FileName1)
  f2 = FSO.GetBaseName(FileName2) & "." & FSO.GetExtensionName(FileName2)
  IsSameName = 0
  If UCase(f1) = UCase(f2) Then IsSameName = -1
End Function

Function IsFileHiddenOrSystem(FileName)
  Dim FSO, f
  Set FSO = CreateObject("Scripting.FileSystemObject")
  Set f = FSO.GetFile(FileName)
  IsFileHiddenOrSystem = 0
  If (f.attributes and 2) Then
    IsFileHiddenOrSystem = -1
  End If
  If (f.attributes and 4) Then
    IsFileHiddenOrSystem = -1
  End If
End Function

Function IsFileReadOnly(FileName)
  Dim FSO, f
  Set FSO = CreateObject("Scripting.FileSystemObject")
  Set f = FSO.GetFile(FileName)
  IsFileReadOnly = 0
  If (f.attributes and 1) Then
    IsFileReadOnly = -1
  End If
End Function

Function YesFromUser(PromptText)
  Dim StdIn, StdOut, answer
  Set StdIn = WScript.StdIn
  Set StdOut = WScript.StdOut
  StdOut.Write PromptText
  answer = StdIn.ReadLine
  if answer <> "" And Ucase(answer) <> "Y" And Ucase(answer) <> "N" Then
    YesFromUser PromptText
  End If
  YesFromUser = (Ucase(answer) = "Y")
End Function

Function MoveAFile(MoveFrom,MoveTo)
  Dim fso
  Set fso = CreateObject("Scripting.FileSystemObject")
  If Not IsFileReadOnly(MoveTo) Then
    fso.DeleteFile MoveTo
  Else
    Wscript.Echo "Access denied: " & MoveTo & " is ReadOnly"
    Exit Function
  End if
  fso.MoveFile MoveFrom, MoveTo
  ShowFileInfo MoveTo
  WScript.Echo
  moveCount = CLng(moveCount) + 1
End Function

Function CompareTwoFolders(FromFolder,ToFolder)
  Dim FSO
  Dim fold1, fc1, file1path
  Dim fold2, fc2, file2path
  Set FSO = CreateObject("Scripting.FileSystemObject")
  Set fold1 = FSO.GetFolder(FromFolder)
  Set fold2 = FSO.GetFolder(ToFolder)
  WScript.Echo "To:   " & fold2
  Set fc1 = fold1.Files
  Set fc2 = fold2.Files
  For Each file1 in fc1
    file1path = fold1 & "\" & file1.name
    If Not CBool(IsFileHiddenOrSystem(file1path)) Then
      For Each file2 in fc2
        file2path = fold2 & "\" & file2.name
        If Not CBool(IsFileHiddenOrSystem(file2path)) Then
          If CBool(IsSameName(file1path,file2path)) Then
            If CBool(IsFirstLater(file1path,file2path)) Then
              ShowFileInfo2 file1path, file2path
              hitCount = CLng(HitCount) + 1
              If YesFromUser("The first is more recent. Move [y/N]? ") Then
                WScript.Echo "Moving: " & file1path
                WScript.Echo "Onto:   " & file2path
                MoveAFile file1path, file2path
              Else
                WScript.Echo "Skipped ..."
              End If
            End If
          End If
        End If
      Next
    End If
  Next
End Function 'CompareTwoFolders

Function CompareToSubfolders(FromFolder,ToFolder)
  Dim fso, f, f2, sf
  Set fso = CreateObject("Scripting.FileSystemObject")
  Set f = fso.GetFolder(ToFolder)
  Set sf = f.SubFolders
  For Each f2 in sf
    if Instr (1, Ucase(f2), "RECYCLER") = 0  Then
      CompareTwoFolders FromFolder, f2
      CompareToSubFolders FromFolder, f2
    End If
  Next
End Function

Sub MainProgram()
  Dim FromFolder, ToFolder
  '
  ' Get the arguments and check their validity
  if WScript.Arguments.Count < 2 Then
    TitleAndUsage
    WScript.Quit
  End If
  FromFolder=WScript.Arguments.Unnamed(0)
  ToFolder=WScript.Arguments.Unnamed(1)
  CheckFolderExistenceOkAndReport FromFolder
  CheckFolderExistenceOkAndReport ToFolder
  '
  ' Do the comparison between the two folders
  WScript.Echo "From: " & FromFolder
  CompareTwoFolders FromFolder, ToFolder
  '
  ' Also check the ToFolder subdirectories
  If UCase(WScript.Arguments.Named.Item("sub")) <> "NO" Then
    CompareToSubfolders FromFolder, ToFolder
  End If
  '
  'Report
  WScript.Echo "Total number of hits:  " & CLng(hitCount)
  WScript.Echo "Total number of moves: " & CLng(moveCount)
End Sub

Dim HitCount, MoveCount
MainProgram
