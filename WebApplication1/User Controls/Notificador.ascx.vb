Public Class Notificador
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick

        Dim last = Application("last")
        If last <> "Noone" Then
            Label1.Text = last
            ModalPopupExtender1.Show()
        End If
        Threading.Thread.Sleep(2000)
        Application("last") = "Noone"

    End Sub


End Class