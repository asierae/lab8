﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="TareasProfesor.aspx.vb" Inherits="WebApplication1.TareasProfesor1"  %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Tareas Profesor</title>
            <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
		<script src="js/jquery-3.1.1.min.js"></script>
    <style type="text/css">
        .auto-style1 {
            display: block;
            width: 100%;
            height: 34px;
            padding: 6px 12px;
            font-size: 14px;
            line-height: 1.42857143;
            color: #555;
            background-color: #fff;
            background-image: none;
            border: 1px solid #ccc;
            border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
            -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
            margin-top: 13;
        }
    </style>
</head>
<body>
    <form id="form1" class="form-horizontal" runat="server">
         <nav class="navbar navbar-default">
      <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/Profesor.aspx">Menu Profesor</a>
        </div>
    
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="navbar-collapse-1">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">Home</a></li>
            <li><a href="#">About</a></li>
            <li><a href="#">Works</a></li>
            <li><a href="/LogOut.aspx">Logout</a></li>
          </ul>
          
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container -->
    </nav><!-- /.navbar -->
               <div class="row">
        <div class="col-md-3">
            <ul class="nav nav-pills nav-stacked">
                <li class="active"><a href="/Profesor.aspx"><i class="fa fa-home fa-fw"></i>Home</a></li>
         
                <li><a href="TareasProfesor.aspx"><i class="fa fa-file-o fa-fw"></i>VerTareas</a></li>
                <li><a href="Estadisticas.aspx"><i class="fa fa-table fa-fw"></i>Estadisticas</a></li>
                <li><a href="InsertarTarea.aspx"><i class="fa fa-tasks fa-fw"></i>Insertar tarea</a></li>
                <li><a href="ImportarTareasXMLDocument.aspx"><i class="fa fa-calendar fa-fw"></i>Importar Tareas(XMLDocument)</a></li>
                <li><a href="ImportarVDataset.aspx">ImportarTareas(DataSet)</a></li>
                <li><a href="Vadillo/ExportarTareas.aspx"><i class="fa fa-book fa-fw"></i>Exportar Tareas</a></li>
                 <li><a href="Vadillo/Coordinador.aspx"><i class="fa fa-book fa-fw"></i>Coordinador</a></li>
                <li><a href="#">OpcionFuture</a></li>
            </ul>
        </div>
        <div id="contenido" class="col-md-9 well">
          
      <h4>Gestión de Tareas Genéricas<asp:ScriptManager ID="ScriptManager1" runat="server">
          </asp:ScriptManager>
            </h4>
 <div class="form-group">
  <label class="col-md-2 control-label" for="selectbasic">Asignaturas</label><asp:UpdatePanel ID="UpdatePanel1" runat="server">
         <ContentTemplate>
             <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" BackColor="#CCFFCC" CssClass="auto-style1" DataSourceID="SqlDataSource1" DataTextField="codigoAsig" DataValueField="codigoAsig" Height="42px" Width="145px">
             </asp:DropDownList>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:hads14ConnectionString %>" SelectCommand="getAsignaturasProfesor" SelectCommandType="StoredProcedure">
                 <SelectParameters>
                     <asp:SessionParameter Name="profesor" SessionField="username" Type="String" />
                 </SelectParameters>
             </asp:SqlDataSource>
             <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Codigo" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Height="193px" Width="719px">
                 <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                 <Columns>
                     <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                     <asp:BoundField DataField="Codigo" HeaderText="Codigo" ReadOnly="True" SortExpression="Codigo" />
                     <asp:BoundField DataField="CodAsig" HeaderText="CodAsig" SortExpression="CodAsig" />
                     <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                     <asp:CheckBoxField DataField="Explotacion" HeaderText="Explotacion" SortExpression="Explotacion" />
                     <asp:BoundField DataField="HEstimadas" HeaderText="HEstimadas" SortExpression="HEstimadas" />
                     <asp:BoundField DataField="TipoTarea" HeaderText="TipoTarea" SortExpression="TipoTarea" />
                 </Columns>
                 <EditRowStyle BackColor="#999999" />
                 <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                 <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                 <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                 <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                 <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                 <SortedAscendingCellStyle BackColor="#E9E7E2" />
                 <SortedAscendingHeaderStyle BackColor="#506C8C" />
                 <SortedDescendingCellStyle BackColor="#FFFDF8" />
                 <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
             </asp:GridView>
             <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:hads14ConnectionString %>" SelectCommand="getTareasProfesor" SelectCommandType="StoredProcedure"
             UpdateCommand="UPDATE TareasGenericas SET Descripcion=@Descripcion,CodAsig=@CodAsig,HEstimadas=@HEstimadas,Explotacion=@Explotacion,TipoTarea=@TipoTarea WHERE Codigo=@Codigo">
            <SelectParameters>
                <asp:SessionParameter Name="profesor" SessionField="username" Type="String" />
                <asp:ControlParameter ControlID="DropDownList1" Name="asignatura" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
         </ContentTemplate>
     </asp:UpdatePanel>
&nbsp;<div class="col-md-4">

</div>
        </div>
        
            <br />
            
            <a href="InsertarTarea.aspx" class="btn btn-default">Insertar Tarea</a>
</div> 
    </form>
</body>
</html>
