<%@ Page Title="" Language="C#" MasterPageFile="~/pharm.Master" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="Pharmacy.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

       <div style="font-weight: bold;font-size: 20px;margin: 10px 10px; border-bottom-style: solid; border-bottom-color:purple">Customers</div>
    <asp:ScriptManager runat="server"></asp:ScriptManager>
  
        <button type="button" id="ModalBtn" class="btn btn-primary" data-target="#modal1" data-toggle="modal">Add Customer</button>
    <div class="modal fade modal" id="modal1" role="dialog">
        <div class="modal-dialog dialog-lg">
            <div class="modal-content">
                <div class="modal-header" style="border-bottom-color:green;border-bottom-style:solid;border-bottom-width:thick">
                    <h1 class="modal-title">Add Customer</h1>
                </div>
                <div class="modal-body">
                   <div class="form-group">
                    <asp:Label ID="Label1" runat="server">Name</asp:Label>
                    <asp:TextBox ID="CustomerNameTextBox" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                    <asp:Label runat="server" ID="Label2">Phone</asp:Label>
                    <asp:TextBox runat="server" ID="CustomerPhoneTextBox" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                    <asp:Label runat="server" ID="Label3">Address</asp:Label>
                    <asp:TextBox runat="server" ID="CustomerAddressTextBox" CssClass="form-control"></asp:TextBox>
                    </div>
                    <asp:label id="EmptyLbl" runat="server" text="" ForeColor="Red"></asp:label><p></p>
                       <label runat="server" id="TipLbl" class="text-right" style="font-style:italic">Click outside the Pop-up to close this section.....</label>
                   
                </div>
                <div class="modal-footer">
                        <asp:Button ID="AddCustomerSubmitButton" runat="server" CssClass="btn btn-success form-control" Text="Add" OnClick="AddCustomerSubmitButton_Click" />
                        </div>  
                 
                </div>
            </div>
        </div>
    <p></p>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
               <div class="input-group">
          <asp:TextBox ID="CustomersearchTextBox" placeholder="search by name" CssClass="form-control" runat="server" AutoPostBack="true" OnTextChanged="CustomersearchTextBox_TextChanged"></asp:TextBox>
  </div>

        </ContentTemplate>
    </asp:UpdatePanel>
   <p></p>
    
    <div>
          <asp:UpdatePanel runat="server">
        <ContentTemplate>
             <asp:label id="ErrorLbl" runat="server" text="" ForeColor="Red"></asp:label><p> <asp:Label ID="SuccessLbl" runat="server" Text="" ForeColor="Green"></asp:Label></p>
      <asp:GridView runat="server" DataKeyNames="ID" OnPageIndexChanging="CustomersGridView_PageIndexChanging" ID="CustomersGridView" AutoGenerateColumns="False" OnRowDeleting="CustomersGridView_RowDeleting" CellPadding="5" ForeColor="Gray" GridLines="Horizontal" Width="1083px" CssClass="text-center"
                 AllowPaging="true" AllowSorting="true" BorderStyle="Solid" BorderColor="Gray">
                <AlternatingRowStyle BackColor="White" />
                <Columns>

                    <asp:TemplateField HeaderText="ID" SortExpression="ID">
                        <ItemTemplate>
                            <asp:Label ID="Lbl1" runat="server" Text='<%#Eval("ID")%>'></asp:Label>
                        </ItemTemplate>
                   
                    </asp:TemplateField>

                             <asp:TemplateField HeaderText="Name" SortExpression="Name">
                        <ItemTemplate>
                            <asp:Label ID="Lbl2" runat="server" Text='<%#Eval("Name")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField Headertext="Phone">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="Lbl3" Text='<%#Eval("Phone")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                         <asp:TemplateField HeaderText="Address">
                        <ItemTemplate>
                            <asp:Label ID="Lbl6" runat="server" Text='<%#Eval("Address")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:HyperLinkField ControlStyle-CssClass="btn fa fa-edit text-primary"  DataNavigateUrlFormatString="~/UpdateCustomer.aspx?ID={0}" DataNavigateUrlFields="ID" />
                    <asp:TemplateField>
                        <ItemTemplate>                         
                            <asp:LinkButton ID="DeleteBttn" runat="server" CommandName="Delete" CssClass="btn fa fa-trash text-danger"></asp:LinkButton>
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
                 </ContentTemplate>
    </asp:UpdatePanel>
        </div>
       
</asp:Content>
