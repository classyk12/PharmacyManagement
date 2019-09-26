<%@ Page Title="" Language="C#" MasterPageFile="~/pharm.Master" AutoEventWireup="true" CodeBehind="Purchase-report.aspx.cs" Inherits="Pharmacy.WebForm17" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
          <div style="font-weight: bold;font-size: 20px;margin: 10px 10px; border-bottom-style: solid; border-bottom-color: #33CC33;">Purchase Report</div>
   <div class="row" style="font-weight:bold">
       <div class="col-md-3">
           <asp:Label ID="purchaseReportLabel" Text="From" runat="server"></asp:Label>
           <asp:TextBox ID="PurchaseDateTextbox" CssClass="form-control" Placeholder="Date" runat="server" OnTextChanged="PurchaseDateTextbox_TextChanged"></asp:TextBox>
       </div>

       <div class="col-md-3"> <asp:Label ID="ToDateLabel" Text="To" runat="server"></asp:Label>
           <asp:TextBox ID="ToDateTextBox" Placeholder="Date" CssClass="form-control" runat="server"></asp:TextBox></div>

       <div class="col-md-3"> <asp:Label ID="SuppNameLabel" Text="Supplier" runat="server"></asp:Label>
        <asp:DropDownList ID="SupplierDropDownList" CssClass="form-control" runat="server"></asp:DropDownList>   </div>
       
       <div class="col-lg-1 text-white"><asp:Label ID="ButtonLabel" Text="." runat="server"></asp:Label>
           <asp:button runat="server" CssClass=" btn btn-primary" Text="submit" /></div>
       <div class="col-lg-1"><asp:Label ID="ButtonLabel1" runat="server" Text="." CssClass="text-white"></asp:Label>
           <asp:Button runat="server" Text="PDF" CssClass=" btn btn-primary"/></div>
           <div class="col-lg-1"><asp:Label ID="Label2" runat="server" Text="." CssClass="text-white"></asp:Label>
           <asp:button runat="server" ID="CSVButton" Text="CSV" CssClass="btn btn-primary" />
       </div>
       <div>
           <asp:GridView ID="PurchaseReportGridView" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
               <AlternatingRowStyle BackColor="White" />
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
   </div>

</asp:Content>
