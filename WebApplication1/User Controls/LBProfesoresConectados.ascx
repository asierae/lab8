<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="LBProfesoresConectados.ascx.vb" Inherits="WebApplication1.LBProfesoresConectados" %>
<style type="text/css">
    .auto-style1 {
        text-decoration: underline;
    }
</style>
<asp:UpdatePanel ID="UpdatePanel1" width="250px" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <h5 class="auto-style1">Profesores Conectados</h5>

        <asp:ListBox ID="ListBox1" CssClass="form-control" runat="server" Height="79px" Width="220px">
            <asp:ListItem>Nadie Conectado</asp:ListItem>
        </asp:ListBox>
        <br />
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
    </Triggers>
</asp:UpdatePanel>
<asp:Timer ID="Timer1" runat="server" Interval="4000">
</asp:Timer>

