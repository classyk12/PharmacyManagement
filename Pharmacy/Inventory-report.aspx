<%@ Page Title="" Language="C#" MasterPageFile="~/pharm.Master" AutoEventWireup="true" CodeBehind="Inventory-report.aspx.cs" Inherits="Pharmacy.WebForm19" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div style="font-weight: bold;font-size: 20px;margin: 10px 10px; border-bottom-style: solid; border-bottom-color: #33CC33;">Inventory Report</div>
    <div class="form-group" style="text-align:right">
        <asp:Button ID="CsvButton" CssClass="btn btn-primary" runat="server" Text="Xls File" />
        <asp:Button ID="PdfButton" CssClass="btn btn-primary" runat="server" Text="Pdf File" />
    </div><p></p>
    <div class="row" style="text-align:center">
       <div class="col-md-3" style="border-right-style: solid; border-width: thin; border-color:gray;border-bottom-style: solid;border-width:thin;border-color:grey"><asp:Label ID="TotalInventoryLabel" runat="server" Text="label"></asp:Label>
           <p></p>Total Inventory</div>
        <div class="col-md-3" style="border-right-style: solid; border-width: thin; border-color: grey;border-bottom-style: solid;border-width:thin;border-color:grey"><asp:Label ID="InventorycostLabel" runat="server" Text="label"></asp:Label>
           <p></p>Total Cost of Inventory</div>
        <div class="col-md-3" style="border-right-style: solid; border-width: thin; border-color: grey;border-bottom-style: solid;border-width:thin;border-color:grey"><asp:Label ID="InventorySalesLabel" runat="server" Text="label"></asp:Label>
           <p></p>Total Sales of Inventory</div>
        <div class="col-md-3" style="border-right-style: solid; border-width: thin; border-color: grey;border-bottom-style: solid;border-width:thin;border-color:grey"><asp:Label ID="InventoryProfitLabel" runat="server" Text="label"></asp:Label>
           <p></p>Total Inventory</div>
    </div><p></p>
        <div class="input-group">
          <asp:TextBox ID="SuppliersearchTextBox" placeholder="Enter Keyword here" CssClass="form-control" runat="server"></asp:TextBox>
    <div class="input-group-btn">
    <asp:Button ID="Suppliersearchbutton" placeholder="Enter keyword" runat="server" Text="Search" CssClass="btn btn-outline-success"/>
    </div>
  </div>
    <p></p>
    <asp:GridView ID="InventoryGridView" runat="server"></asp:GridView>

       
    
</asp:Content>
