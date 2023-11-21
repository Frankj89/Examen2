<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Equipo.aspx.cs" Inherits="Examen2.Equipo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center">
    <h2>Lista de equipos</h2>
</div>

<div class="container text-center">
    <asp:GridView runat="server" ID="datagrid" PageSize="10" HorizontalAlign="Center"
        CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header"
        RowStyle-CssClass="rows" AllowPaging="True" />
    
</div>

      <div class="container text-center">
      <div class="mb-3">
  <label for="exampleInputEmail1" class="form-label">Equipo ID</label>
  <asp:TextBox ID="tid" class="form-control" runat="server"></asp:TextBox>
  
</div>
<div class="mb-3">

    <div class="mb-3">
  <label for="exampleInputEmail1" class="form-label">Tipo equipo</label>
  <asp:TextBox ID="ttipo" class="form-control" runat="server"></asp:TextBox>
  
</div>
<div class="mb-3">

    <div class="mb-3">
  <label for="exampleInputEmail1" class="form-label">Modelo</label>
  <asp:TextBox ID="tmodelo" class="form-control" runat="server"></asp:TextBox>
</div>

    <div class="container text-center">

<asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="Agregar" OnClick="Button1_Click" />
<asp:Button ID="Button2" class="btn btn-primary" runat="server" Text="Borrar" OnClick="Button2_Click"/> 
<asp:Button ID="Button3" class="btn btn-primary" runat="server" Text="Modificar" OnClick="Button3_Click" /> 
<asp:Button ID="Button4" class="btn btn-primary" runat="server" Text="Consultar" OnClick="Button4_Click"/> 
</asp:Content>
