<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="AutoFillableChart.ascx.vb" Inherits="WebApplication1.AutoFillableChart" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
<ajaxToolkit:PieChart ID="Chart1" runat="server" ChartHeight="300" 
ChartWidth="450" ChartTitle="Roles de Usuarios Conectados" 
ChartTitleColor="#0E426C"> 
<PieChartValues>
    <ajaxToolkit:PieChartValue Category="Profesores" Data="1" 
    PieChartValueColor="#6C1E83" PieChartValueStrokeColor="black" />
    <ajaxToolkit:PieChartValue Category="Alumnos" Data="1" 
    PieChartValueColor="#D08AD9" PieChartValueStrokeColor="black" />
    <ajaxToolkit:PieChartValue Category="Admin" Data="1" 
    PieChartValueColor="#6586A7" PieChartValueStrokeColor="black" />
   
</PieChartValues>
</ajaxToolkit:PieChart >
        </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
    </Triggers>
</asp:UpdatePanel>
<asp:Timer ID="Timer1" runat="server" Interval="10000"></asp:Timer>
