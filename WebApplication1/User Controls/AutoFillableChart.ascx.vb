Public Class AutoFillableChart
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        If Application("numP") > 0 Then
            Chart1.PieChartValues.Item(0).Data = Application("numP")
            Chart1.PieChartValues.Item(0).Category = "Prfesores"
            Chart1.PieChartValues.Item(0).PieChartValueColor = "#6C1E83"
            Chart1.PieChartValues.Item(0).PieChartValueStrokeColor = "black"
        Else
            Chart1.PieChartValues.Item(0).Data = 0.00000099999999999999995
        End If
        If Application("numA") > 0 Then
            Chart1.PieChartValues.Item(1).Data = Application("numA")
            Chart1.PieChartValues.Item(1).Category = "Alumnos"
            Chart1.PieChartValues.Item(1).PieChartValueStrokeColor = "black"
            Chart1.PieChartValues.Item(1).PieChartValueColor = "#D08AD9"
        Else
            Chart1.PieChartValues.Item(1).Data = 0.00000099999999999999995
        End If
        If Application("numADM") > 0 Then
            Chart1.PieChartValues.Item(2).Data = Application("numADM")
            Chart1.PieChartValues.Item(2).Category = "Admins"
            Chart1.PieChartValues.Item(2).PieChartValueStrokeColor = "black"
            Chart1.PieChartValues.Item(2).PieChartValueColor = "#6586A7"
        Else
            Chart1.PieChartValues.Item(2).Data = 0.00000099999999999999995
        End If
    End Sub
End Class