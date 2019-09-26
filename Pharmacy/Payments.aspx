<%@ Page Title="" Language="C#" MasterPageFile="~/pharm.Master" AutoEventWireup="true" CodeBehind="Payments.aspx.cs" Inherits="Pharmacy.WebForm16" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

             <div style="font-weight: bold;font-size: 20px;margin: 10px 10px; border-bottom-style: solid; border-bottom-color: #33CC33;">Payment</div>
  
      <div class="input-group">
          <asp:TextBox ID="InvoiceTextBox" placeholder="Enter Keyword here" CssClass="form-control" runat="server"></asp:TextBox>
    <div class="input-group-btn">
    <asp:Button ID="Customersearchbutton" runat="server" Text="Search" CssClass="btn btn-outline-success"/>
    </div>
  </div>
    <div>
        <asp:GridView ID="CustomerGridView" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="Action" ShowHeader="True" Text="View" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
    </div>
   
       <div>
           <asp:DetailsView ID="CustomerDetailsView" runat="server" Height="50px" Width="125px" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None">
               <AlternatingRowStyle BackColor="PaleGoldenrod" />
               <EditRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
               <FooterStyle BackColor="Tan" />
               <HeaderStyle BackColor="Tan" Font-Bold="True" />
               <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
           </asp:DetailsView>
       </div>

</asp:Content>
