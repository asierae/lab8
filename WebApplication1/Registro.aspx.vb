Imports accesoBD.GestBD
Imports System.Data.SqlClient
Imports crypto.Sha1

Public Class Registro

    Inherits System.Web.UI.Page
    Public host As String = "http://hadsier.azurewebsites.net" ''http://localhost
    Public Shared conn As accesoBD.GestBD
    Private Shared comando As New SqlCommand
    Public key As Integer
    Public matriculado As Boolean = False




    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
      
    End Sub

    Public Function RandomKey() As Integer
        Dim NumConf As Decimal
        Randomize()
        NumConf = CLng(Rnd() * 9000000) + 1000000
        Return NumConf
    End Function

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim emailer As New Email.Email
        Dim url_activar As String
        If Page.IsValid Then
            conectar()
            key = RandomKey()
            url_activar = host + "/Confirmar.aspx?mbr=" + TextBox1.Text + "&numconf=" + key.ToString
            Dim resp = registrar()
            If resp = "OK" Then
                emailer.enviarEmail(TextBox1.Text, "Email de Bienvenida", "Bienvenido! Activa tu cuenta desde la siguiente dirección:" + url_activar)
                Literal1.Text = "Te has registrado con exito " & TextBox2.Text.Split().GetValue(0) & "! Comprueba tu correo para activar la cuenta"
            Else
                Literal1.Text = resp
            End If
        End If


    End Sub

    Public Function registrar() As String
        If Not matriculado Then
            Return TextBox1.Text & " no está Matriculado en la asignatura"
        End If
        If usuarioExiste(TextBox1.Text) Then
            Label1.Text = "El email ya se encuentra registrado"
            Return "El email ya se encuentra registrado"
        End If

        Dim array = TextBox2.Text.Split()
        Dim apellidos
        If array.Length >= 3 Then
            apellidos = array.GetValue(1) & " " & array.GetValue(2)
        Else
            apellidos = array.GetValue(1)
        End If

        'Dim st = "insert into Usuarios (email,nombre,apellidos,pregunta,respuesta,dni,numconfir,confirmado,pass) values('" & TextBox1.Text & "','" & array.GetValue(0) & "','" & apellidos & "','" & TextBox6.Text & "','" & TextBox7.Text & "','" & TextBox3.Text & "'," & key & ",'" & False & "','" & getSha1(TextBox4.Text) & "')"
        Dim st = "insert into Usuarios (email,nombre,pregunta,respuesta,dni,confirmado,grupo,tipo,pass) values('" & TextBox1.Text & "','" & array.GetValue(0) & "','" & TextBox6.Text & "','" & TextBox7.Text & "'," & TextBox3.Text & "," & 1 & ",'" & 1 & "','" & DropDownList1.SelectedValue & "','" & getSha1(TextBox4.Text) & "')"

        Dim numregs As Integer
        comando = New SqlCommand(st, accesoBD.GestBD.conexion)
        Try
            numregs = comando.ExecuteNonQuery()
        Catch ex As Exception

            Return ex.Message
        End Try
        'Return (numregs & " registro(s) insertado(s) en la BD ")
        Return "OK"
    End Function
 

    Function usuarioExiste(ByVal email As String) As Boolean

        Dim existe As Integer
        Dim st = "SELECT count(*) FROM Usuarios WHERE email='" & email & "'"
        comando = New SqlCommand(st, conexion)
        Try
            existe = comando.ExecuteScalar()
        Catch ex As Exception
            Label1.Text = (ex.Message)
        End Try
        If existe > 0 Then
            Return True
        Else
            Return False
        End If

    End Function

    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        Response.Redirect("/Inicio.aspx")
    End Sub


    Private Sub TextBox1_TextChanged(sender As Object, e As EventArgs) Handles TextBox1.TextChanged
        Image1.Visible = True
        Dim x As New comprobarmatricula.Matriculas
        Dim resp = x.comprobar(TextBox1.Text)
        If resp = "SI" Then
            matriculado = True
            Label1.Text = "El usuario esta matriculado y se puede registrar"
            Image1.ImageUrl = "img/rigth.png"
            Label1.ForeColor = Drawing.Color.Green

        Else
            Label1.Text = "Usuario no matriculado en la asignatura"
            Image1.ImageUrl = "img/wrong.png"
            Label1.ForeColor = Drawing.Color.Red
            matriculado = False
        End If
    End Sub
End Class