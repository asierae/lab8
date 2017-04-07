Imports accesoBD.GestBD
Imports System.Data.SqlClient
Imports crypto.Sha1
Imports System.Web.Security

Public Class WebForm1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        If Not IsNothing(Request.Params("msj")) Then
            Label1.Text = Request.Params("msj")
        ElseIf Not IsNothing(Request.Params("ReturnUrl")) Then
            Label1.Text = "No tienes permiso  para acceder al recurso: " & Request.Params("ReturnUrl")
        End If
        If Page.IsPostBack Then

        End If
    End Sub




    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        If estaConectado(TextBox1.Text) Then
            Label1.Text = "El usuario " & TextBox1.Text & " ya se encuentra conectado,prueba más tarde"
            Label1.ForeColor = Drawing.Color.Orange
        Else

            Dim resp = tryLogin(TextBox1.Text, TextBox2.Text)
            If resp = "1" Then
                Application.Lock()
                Application("numusers") = Application("numusers") + 1
                Application("last") = TextBox1.Text
                Application.UnLock()

                If TextBox1.Text = "vadillo@ehu.es" Then

                    FormsAuthentication.SetAuthCookie("vadillo@ehu.es", False)
                Else
                    FormsAuthentication.SetAuthCookie(Session("role"), False)
                End If

                If Session("role") = "P" Then

                    Dim temp As New ListBox()
                    temp = Application("listaprof")
                    temp.Items.Add(TextBox1.Text)
                    Application("listaprof") = temp
                    Application("numP") = Application("numP") + 1
                    Response.Redirect("/Profesores/Profesor.aspx")
                ElseIf Session("role") = "A" Then
                    Dim temp As New ListBox
                    temp = Application("listaalum")
                    temp.Items.Add(TextBox1.Text)
                    Application("listaalum") = temp
                    Application("numA") = Application("numA") + 1
                    Response.Redirect("/Alumnos/Alumno.aspx")
                ElseIf Session("role") = "ADMIN" Then
                    Application("numADM") = Application("numADM") + 1
                    Response.Redirect("/Admin/GestionUsuarios.aspx")
                Else
                    Response.Redirect("Inicio.aspx?msj= que role eres?")
                End If

            Else
                Literal1.Text = "<span style=""color: red;"">Credenciales Incorrectas </span>"

            End If
        End If
    End Sub
    Private Function tryLogin(user As String, pass As String) As String
        conectar()
        Dim existe As SqlDataReader
        Dim st = "SELECT * FROM Usuarios WHERE email='" & user & "' and pass='" & getSha1(pass) & "'"
        Dim comando = New SqlCommand(st, conexion)
        Try
            existe = comando.ExecuteReader()
        Catch ex As Exception
            Label1.Text = (ex.Message)
            comando.Dispose()

            cerrarConexion()
            Return ex.Message
        End Try
        If existe.Read() Then
            Session("username") = TextBox1.Text
            Session("logged") = True
            Session("role") = existe.Item("tipo")
            comando.Dispose()
            existe.Close()
            cerrarConexion()
            Return "1"
        Else
            comando.Dispose()
            existe.Close()
            cerrarConexion()
            Return "0"

        End If

    End Function
    Public Function estaConectado(usr As String) As Boolean
        Dim sv As New WebService1
        Return sv.isConnected(usr)
    End Function

    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        Response.Redirect("/Registro.aspx")
    End Sub

    Protected Sub LinkButton2_Click(sender As Object, e As EventArgs) Handles LinkButton2.Click
        Response.Redirect("/CambiarPassword.aspx")
    End Sub
End Class