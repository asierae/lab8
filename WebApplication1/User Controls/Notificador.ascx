<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="Notificador.ascx.vb" Inherits="WebApplication1.Notificador" %>

<style type="text/css">
            body
            {
                font-family: Verdana;
                font-size: 14px;
            }
            /* Accordion */
            .accordionHeader
            {
                border: 1px solid #2F4F4F;
                color: white;
                background-color: #2E4d7B;
                font-family: Arial, Sans-Serif;
                font-size: 12px;
                font-weight: bold;
                padding: 5px;
                margin-top: 5px;
                cursor: pointer;
            }
 
            #master_content .accordionHeader a
            {
                color: #FFFFFF;
                background: none;
                text-decoration: none;
            }
 
                #master_content .accordionHeader a:hover
                {
                    background: none;
                    text-decoration: underline;
                }
 
            .accordionHeaderSelected
            {
                border: 1px solid #2F4F4F;
                color: white;
                background-color: #5078B3;
                font-family: Arial, Sans-Serif;
                font-size: 12px;
                font-weight: bold;
                padding: 5px;
                margin-top: 5px;
                cursor: pointer;
            }
        </style>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <asp:LinkButton ID="lnkDummy" runat="server"></asp:LinkButton>
<ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" BehaviorID="mpe" runat="server"
    PopupControlID="pnlPopup" TargetControlID="lnkDummy" BackgroundCssClass="body" 
    CancelControlID = "btnHide" Drag ="true" PopupDragHandleControlID="accordionHeader" 
    X="820" Y="350" DropShadow="true">
</ajaxToolkit:ModalPopupExtender>
<asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup" Style="display: none">
    <div class="accordionHeaderSelected">
        Notificación de logueo
    </div>
    <div class="body;background:blue">
        <asp:Label ID="Label1" runat="server" Text="Label">X</asp:Label> acaba de iniciar Sesión
       
        <br />
        <asp:Button ID="btnHide" runat="server" Text="Cerrar" />
    </div>
</asp:Panel>
        </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
    </Triggers>
    </asp:UpdatePanel>
<asp:Timer ID="Timer1" runat="server" Interval="5000"></asp:Timer>

     

    