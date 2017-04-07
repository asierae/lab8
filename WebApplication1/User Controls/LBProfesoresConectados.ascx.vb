Public Class LBProfesoresConectados
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        ListBox1.Items.Clear()
        Dim temp As New ListBox()
        temp = Application("listaprof")
        For Each elem In temp.Items
            ListBox1.Items.Add(elem)
        Next
    End Sub
End Class