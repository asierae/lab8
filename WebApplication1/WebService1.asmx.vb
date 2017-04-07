Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.ComponentModel
Imports accesoBD.GestBD
Imports System.Data.SqlClient

' Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente.
<System.Web.Script.Services.ScriptService()> _
<System.Web.Services.WebService(Namespace:="http://tempuri.org/")> _
<System.Web.Services.WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<ToolboxItem(False)> _
 Public Class WebService1
    Inherits System.Web.Services.WebService

    <WebMethod()> _
    Public Function HelloWorld() As String
        Return "Hola a todos"
    End Function
    <WebMethod()> _
    Public Function Sumar(x As Integer, y As Integer) As Integer
        Return x + y
    End Function
    <WebMethod()> _
    Public Function obtenerDedicacionMediaAsig(asig As String) As Integer
        Dim horas = 0
        conectar()
        Dim st = "SELECT avg(HReales) FROM EstudiantesTareas INNER JOIN TareasGenericas on CodTarea=Codigo and CodAsig='" & asig & "'"
        Dim comm As New SqlCommand(st, conexion)
        Dim resp = comm.ExecuteScalar()
        cerrarConexion()
        If resp Is DBNull.Value Then
            Return horas
        End If
        Return resp
    End Function
    <WebMethod()> _
    Public Function isConnected(user As String) As Boolean
        Dim listaP As New ListBox
        Dim listaA As New ListBox
        listaP = Application("listaprof")
        listaA = Application("listaalum")
        For Each usr In listaP.Items
            If usr.value = user Then
                Return True
            End If
        Next
        For Each usr In listaA.Items
            If usr = user Then
                Return True
            End If
        Next

        Return False
    End Function
    <WebMethod()> _
    Public Function cargaSobrepasada(asig As String, horasT As Integer) As String
        Dim maxhoras = Application("nummaxdedic")
        conectar()
        Dim st = "SELECT sum(HEstimadas) FROM TareasGenericas WHERE CodAsig='" & asig & "'"
        Dim comm As New SqlCommand(st, conexion)
        Dim resp = comm.ExecuteScalar()
        cerrarConexion()
        If resp Is DBNull.Value Then
            Return "OK"
        End If
        If resp + horasT > maxhoras Then
            Return "Has sobrepasado la carga máxima de trabajo, a " & asig & " le quedan " & maxhoras - resp & " horas de carga"
        Else
            Return "OK"
        End If

    End Function
End Class