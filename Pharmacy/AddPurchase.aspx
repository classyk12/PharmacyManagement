<%@ Page Title="" Language="C#" MasterPageFile="~/pharm.Master" AutoEventWireup="true" CodeBehind="AddPurchase.aspx.cs" Inherits="Pharmacy.WebForm13" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            display: block;
            width: 100%;
            font-size: 1rem;
            line-height: 1.5;
            color: #495057;
            background-clip: padding-box;
            border-radius: .25rem;
            transition: none;
            border: 1px solid #ced4da;
            margin-top: 0;
            background-color: #fff;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <div class="container-fluid">
      <div class="text-black rounded-circle" style="font-weight: bold;font-size: 20px;margin: 10px 10px;border-bottom-style:solid;border-bottom-color:green" >Add Purchase</div>
          <asp:UpdatePanel runat="server">
                    <ContentTemplate>
    <div class=" container-fluid row rounded" style="border: thin solid #33CC33; margin-bottom:30px; padding: 10px;">
            <div class="col-md-4">
                   <i class="fa fa-suitcase"></i> <asp:Label runat="server" Text="Supplier Name "></asp:Label>
                    <asp:DropDownList runat="server" ID="SupplierDDL" CssClass="form-control" DataSourceID="SupplierNameDS" DataTextField="Name" DataValueField="Name"></asp:DropDownList>
                   <asp:SqlDataSource ID="SupplierNameDS" runat="server" ConnectionString="Data Source=CLASSYK\SQLEXPRESS;Initial Catalog=Pharmacy;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [Name] FROM [SuppliersList]"></asp:SqlDataSource>
                   <br />  
               <i class="fa fa-plus"> </i><asp:Label runat="server" TEXT="Medicine Name "></asp:Label>
                <asp:DropDownList runat="server"  ID="MedicineNameDDL" CssClass="form-control" DataSourceID="MedicineNameDS" DataTextField="Name" DataValueField="Name">           
                </asp:DropDownList><br />
                <asp:SqlDataSource ID="MedicineNameDS" runat="server" ConnectionString="Data Source=CLASSYK\SQLEXPRESS;Initial Catalog=Pharmacy;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [Name] FROM [MedicineList]"></asp:SqlDataSource>
                <div class="form-row">
                <span class=" col">
     <i class="fa fa-list"></i> <asp:Label runat="server" Text="Quantity"></asp:Label>
                <asp:TextBox runat="server" ID="QuantityTextBox" OnTextChanged="QuantityTextBox_TextChanged" AutoPostBack="true" CssClass="form-control"></asp:TextBox></span>
              <span class="col"> <i class="fa fa-dollar"></i> <asp:Label runat="server" Text="Price"></asp:Label>
                <asp:TextBox runat="server" ID="PurchasePriceTextBox" OnTextChanged="PurchasePriceTextBox_TextChanged" AutoPostBack="true" CssClass="form-control"></asp:TextBox>
                </span>
                    
                </div>
                    <div class="col">
                      
                    </div>
               <p>          <span class="text-right text-secondary" style="font-size:smaller">Press Enter to calculate values </span>
                      </p>
                <span>
                    <asp:TextBox runat="server" CssClass= "form-control" ReadOnly="true" ID="TotalResultTxtBox1" Font-Bold="true"></asp:TextBox>
                </span><p>
                    <span >
                        <asp:Label runat="server" ID="ErrorLbl" class="text-center text-danger" style="font-size:small;font-style:italic;font-weight:bold"></asp:Label>
                    </span>
                       </p>
                <div class="text-center">
                    <asp:LinkButton runat="server" OnClick="AddPurchase1_Click" ID="AddPurchase1" CssClass="btn btn-primary">Add To List</asp:LinkButton>
                </div> </div>
           
          
            <div class="col-lg-8">
                <div style="align-content:center">
                  <i class="fa fa-calendar"></i> <asp:Label runat="server" ID="DateLbl" Text="Date Of Purchase"></asp:Label>
                    <asp:TextBox runat="server" CssClass="form-control" Width="150px" ID="DateTextBox"></asp:TextBox>
                </div><p></p>
           <div class="card">
               <div class="card-header text-white" style="background-color:purple;font-size:large">Product List</div>
               <div class="card-body" style="width:300px">
                  <asp:GridView OnRowDeleting="DetailsGridView_RowDeleting" EmptyDataText="No Enlisted product....!!!" EmptyDataRowStyle-Font-Italic="true" DataKeyNames="SupplierName" ShowHeaderWhenEmpty="True"  OnRowDataBound="DetailsGridView_RowDataBound" runat="server" ID="DetailsGridView" AutoGenerateColumns="False" BackColor="White" BorderColor="Gray" BorderStyle="None" CellPadding="5" GridLines="Horizontal" Width="600px" ForeColor="Gray">
                      <Columns>                   
                         
                            <asp:BoundField HeaderText="Supplier" DataField="SupplierName"></asp:BoundField>
                            <asp:BoundField HeaderText="Medicine" DataField="MedicineName"></asp:BoundField>
                            <asp:BoundField HeaderText="Price" DataField="Price"></asp:BoundField>
                            <asp:BoundField HeaderText="Qty" DataField="Quantity"></asp:BoundField>
                            <asp:BoundField HeaderText="Amt" DataField="Amount"></asp:BoundField>
                           <asp:TemplateField>
                               <ItemTemplate>
                                  <asp:LinkButton runat="server" ToolTip="Delete" ID="DeleteBtn" CommandName="Delete" CssClass="btn btn-toolbar fa fa-trash text-danger"></asp:LinkButton>
                              </ItemTemplate>
                          </asp:TemplateField>
                      </Columns>
                          <EditRowStyle BackColor="White" BorderStyle="None" CssClass="text white" />
              <EmptyDataRowStyle ForeColor="Red" />
              <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
              <HeaderStyle BackColor="Purple" Font-Bold="True" ForeColor="White" />
              <PagerSettings Mode="NextPrevious" FirstPageText="First" LastPageText="End" NextPageText="Next" PreviousPageText="Previous" />
              <PagerStyle BackColor="#BEE9D3" ForeColor="#666666" HorizontalAlign="Center" CssClass="bg-transparent" Font-Bold="True" Font-Italic="True" Font-Names="Comic Sans MS" />
              <RowStyle BackColor="White" />
              <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
              <SortedAscendingCellStyle BackColor="#F8FAFA" />
              <SortedAscendingHeaderStyle BackColor="#246B61" />
              <SortedDescendingCellStyle BackColor="#D4DFE1" />
              <SortedDescendingHeaderStyle BackColor="#15524A" />
                  </asp:GridView>
               </div>
               <div class="card-footer text-right text-white" style="font-weight:bold;font-size:medium;background-color:purple"> Total:
                    <asp:Label runat="server" ID="TotalLbl"></asp:Label>
               </div>
        
                </div>
                <p></p>
                 <span class="col">
                           <asp:CheckBox runat="server" AutoPostBack="true" ID="DiscountCheckBox" Text=" Discount%" OnCheckedChanged="DiscountCheckBox_CheckedChanged"></asp:CheckBox><br />
                      <asp:Label runat="server" Text="Discount"></asp:Label>                 
                <asp:TextBox runat="server" Enabled="false" CssClass="form-control" AutoPostBack="true"  OnTextChanged="DiscountTextBox_TextChanged" ID="DiscountTextBox"></asp:TextBox>
                     </span> 
                 <div class="form-row">
                    <div class="col">              
                         <asp:Label runat="server" CssClass="text-center" Text="Total" ID="GrandTotalLbl"></asp:Label>
                    <asp:TextBox runat="server" CssClass="form-control" AutoPostBack="true" Font-Bold="true" ID="TotalResultTxtBox" ReadOnly="true"></asp:TextBox>
                   <p></p>
         
              <div>
                   <i class="fa fa-paypal"></i> <asp:Label runat="server" Text="Payment Method: "></asp:Label><br />
                    <asp:DropDownList runat="server" ID="MethodDDL" CssClass="form-control">
       
                        <asp:ListItem>Cash</asp:ListItem>
                        <asp:ListItem>Check</asp:ListItem>     
                    </asp:DropDownList></div>
              <div>
                    <asp:Label runat="server" Text="Status: "></asp:Label><br />
                    <asp:DropDownList runat="server" ID="StatusDDL" CssClass="form-control">
                 
                        <asp:ListItem>Paid</asp:ListItem>
                        <asp:ListItem>Due</asp:ListItem>
                    </asp:DropDownList>
   </div><p></p>
                <asp:Button runat="server" ID="SavePurchaseButton" OnClick="SavePurchaseButton_Click" Text="Save Purchase" CssClass="btn btn-success text-center" />
            </div>
          
              </div>
       
              
               

        </div>
    
   
    </div> </div>
    </ContentTemplate>
                </asp:UpdatePanel></div> 
</asp:Content>
