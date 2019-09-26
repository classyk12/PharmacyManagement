<%@ Page Title="" Language="C#" MasterPageFile="~/pharm.Master" AutoEventWireup="true" CodeBehind="UpdateSupplier.aspx.cs" Inherits="Pharmacy.WebForm21" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div style="border-bottom-color:purple;font-size:large;padding:5px 5px 5px 5px"><p></p>Edit Supplier</div><p></p>

            <div  style="font-size:15px;margin: 10px 10px; border-bottom-style: solid;border-top-style:solid;border-bottom-color:purple; border-top-color:purple"><p></p>
                   <asp:Label runat="server" Text="Customer ID: "></asp:Label>
        <asp:TextBox runat="server" ID="EditIDTextBox" CssClass="form-control" ReadOnly="true"></asp:TextBox>


        <asp:Label runat="server" Text="Customer Name: "></asp:Label>
        <asp:TextBox runat="server" ID="EditSupplierName" CssClass="form-control"></asp:TextBox>

         <asp:Label runat="server" Text="Customer Phone: "></asp:Label>
        <asp:TextBox runat="server" ID="EditSupplierPhone" CssClass="form-control"></asp:TextBox>

         <asp:Label runat="server" Text="Customer Address: "></asp:Label>
        <asp:TextBox runat="server" ID="EditSupplierAddress" CssClass="form-control"></asp:TextBox>
        <p></p>

                <div style="text-align:center">

               
        <asp:LinkButton runat="server" ID="UpdateButton" OnClick="UpdateButton_Click" CssClass="btn btn-success text-center">Update</asp:LinkButton>
        <asp:Button runat="server" ID="CancelButton" CssClass="btn btn-danger text-center" PostBackUrl="~/Customers.aspx" Text="Cancel" /><p></p>
    </div> </div>
              
</asp:Content>
