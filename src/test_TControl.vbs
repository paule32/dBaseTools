Option Explicit

On Error Resume Next

Dim obj
Set obj = CreateObject("DBase.TControl")

If Err.Number <> 0 Then
    WScript.Echo "Fehler beim Erstellen des Objekts: " & Err.Description
Else
    WScript.Echo "Objekt erfolgreich erstellt: " & TypeName(obj)

    ' Wenn deine Klasse z. B. eine Methode "ClickButton" hat:
    On Error Resume Next
    obj.ClickButton
    If Err.Number <> 0 Then
        WScript.Echo "Methode konnte nicht aufgerufen werden: " & Err.Description
    Else
        WScript.Echo "Methode ClickButton() wurde erfolgreich aufgerufen."
    End If
End If

Set obj = Nothing
