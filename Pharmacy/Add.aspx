<%@ Page Title="" Language="C#" MasterPageFile="~/pharm.Master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="Pharmacy.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="text-black" style="font-weight: bold;font-size: 30px;margin: 10px 10px" >New Medicine</div>
        <div class="form-group">
         <div  style="font-size:15px;margin: 10px 10px; border-bottom-style: solid;border-top-style:solid;border-bottom-color:purple; border-top-color: purple">
             <p></p>
 

                <asp:Label ID="itemIDLabel2" runat="server" Text="Name: "></asp:Label>
        <asp:TextBox ID="medicineNameTextbox" CssClass="form-control" runat="server" placeholder="Enter medicine name"></asp:TextBox>
             

                <asp:Label ID="BrandLabel" runat="server" Text="Brand: "></asp:Label>
             <asp:DropDownList ID="BrandDropdown" CssClass=" form-control" runat="server" DataSourceID="BrandListDS" DataTextField="Name" DataValueField="Name"></asp:DropDownList>

                <asp:SqlDataSource ID="BrandListDS" runat="server" ConnectionString="Data Source=CLASSYK\SQLEXPRESS;Initial Catalog=Pharmacy;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [Name] FROM [BrandList]"></asp:SqlDataSource>

                <asp:Label ID="PurchaseLabel" runat="server" Text="Purchase Price: "></asp:Label>
        <asp:TextBox ID="PurchaseTextbox" CssClass="form-control" runat="server" placeholder="Enter Purchase Price"></asp:TextBox>

                   <asp:Label ID="RetailLabel" runat="server" Text="Retail Price: "></asp:Label>
        <asp:TextBox ID="RetailTextBox" CssClass="form-control" runat="server" placeholder="Enter Retail Price"></asp:TextBox>

              <asp:Label ID="WholseSaleLabel" runat="server" Text="Wholesale Price: "></asp:Label>
        <asp:TextBox ID="WholesaleTexBox" CssClass="form-control" runat="server" placeholder="Enter Wholesale Price"></asp:TextBox>

              <asp:Label ID="CategoryAddLabel" runat="server" Text="Category: "></asp:Label>
             <asp:DropDownList ID="CategoryDropDownList" CssClass="form-control" runat="server" DataSourceID="CategoryDS" DataTextField="Name" DataValueField="Name"></asp:DropDownList>

              <asp:SqlDataSource ID="CategoryDS" runat="server" ConnectionString="Data Source=CLASSYK\SQLEXPRESS;Initial Catalog=Pharmacy;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [Name] FROM [CategoryList]"></asp:SqlDataSource>

              <asp:Label ID="QtyLabel" runat="server" Text="Quantity: "></asp:Label>
          <asp:TextBox runat="server" ID="QuantityTextBox" CssClass="form-control" ></asp:TextBox>
             <p>
                 <asp:Label runat="server" ID="ErrorLbl" ForeColor="Red" CssClass="font-italic"></asp:Label>
             </p>
             <div style="text-align:center">
             <asp:Button ID="AddItemSubmitButton" CssClass="btn btn-success" Text="Add Item" runat="server" OnClick="AddItemSubmitButton_Click" />
                 </div>

             <p></p>
    </div>

                </div>
        
   
</asp:Content>
