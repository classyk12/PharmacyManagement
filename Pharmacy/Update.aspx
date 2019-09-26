<%@ Page Title="" Language="C#" MasterPageFile="~/pharm.Master" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="Pharmacy.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="border-bottom:thick;border-width:thin;border-bottom-color:purple;font-weight:bold;font-size:medium">Edit Medicine</div>
    <p></p>
    <div style="border-color:rebeccapurple;border-style:solid;border-width:thin;padding:20px">
        <div>
   <asp:Label runat="server" Text="ID: "></asp:Label>
            <asp:TextBox runat="server" ID="EditTextBox" Enabled="false" CssClass="form-control"></asp:TextBox>
        </div>

        <asp:Label runat="server" Text="Name: "></asp:Label>
            <asp:TextBox runat="server" ID="EditNameTextBox" CssClass="form-control"></asp:TextBox>
        
        
          <div>
        <asp:Label runat="server" Text="Brand: "></asp:Label>
            <asp:DropDownList runat="server" ID="EditBrandDDL" CssClass="form-control" DataSourceID="BrandDropList" DataTextField="Name" DataValueField="Name"></asp:DropDownList>
               <asp:SqlDataSource ID="BrandDropList" runat="server" ConnectionString="Data Source=CLASSYK\SQLEXPRESS;Initial Catalog=Pharmacy;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [Name] FROM [BrandList]"></asp:SqlDataSource>
        </div>
        
          <div>
        <asp:Label runat="server" Text="Category: "></asp:Label>
            <asp:DropDownList runat="server" ID="EditCategoryDDL" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Name"></asp:DropDownList>
              <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=CLASSYK\SQLEXPRESS;Initial Catalog=Pharmacy;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [Name] FROM [CategoryList]"></asp:SqlDataSource>
        </div>

          <div>
        <asp:Label runat="server" Text="Purchase: "></asp:Label>
            <asp:TextBox runat="server" ID="EditPurchaseTextBox" CssClass="form-control"></asp:TextBox>
        </div>

        
          <div>
        <asp:Label runat="server" Text="Retail: "></asp:Label>
            <asp:TextBox runat="server" ID="EditRetailTextBox" CssClass="form-control"></asp:TextBox>
        </div>
        
        
          <div>
        <asp:Label runat="server" Text="Wholesale: "></asp:Label>
            <asp:TextBox runat="server" ID="EditWholesaleTextBox" CssClass="form-control"></asp:TextBox>
        </div>

        
          <div>
        <asp:Label runat="server" Text="Quantity: "></asp:Label>
            <asp:TextBox runat="server" ID="EditQuantityTextBox" CssClass="form-control"></asp:TextBox>
        </div>
        <p></p>
        <div style="text-align:center">
            <asp:LinkButton runat="server" OnClick="Unnamed_Click" Text="Update" CssClass="btn btn-success"></asp:LinkButton>
            <asp:LinkButton runat="server" Text="Cancel" CssClass="btn  btn-danger" PostBackUrl="~/List.aspx"></asp:LinkButton>
        </div>
        
    </div>

    


</asp:Content>
