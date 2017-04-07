Public Class LogOut_aspx
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session.Abandon()
        Application.Lock()

        If Session("role") = "P" Then
            Dim temp As ListBox
            temp = Application("listaprof")
            temp.Items.Remove(Session("username"))
            Application("listaprofs") = temp
            Application("numP") = Application("numP") - 1
        ElseIf Session("role") = "A" Then
            Dim temp As ListBox
            temp = Application("listaalum")
            temp.Items.Remove(Session("username"))
            Application("listaalum") = temp
            Application("numP") = Application("numA") - 1
        Else
            Application("numADM") = Application("numADM") - 1
        End If

        Application.UnLock()
        FormsAuthentication.SignOut()
        Response.Redirect("/Inicio.aspx?msj= Vuelve Pronto :)")
    End Sub

End Class