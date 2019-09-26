<%@ Page Title="" Language="C#" MasterPageFile="~/pharm.Master" AutoEventWireup="true" CodeBehind="Suppliers.aspx.cs" Inherits="Pharmacy.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

       <div style="font-weight: bold;font-size: 20px;margin: 10px 10px; border-bottom-style: solid; border-bottom-color:purple">Suppliers</div>
  
       
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal1">Add Supplier</button>
            <div class="modal fade modal" id="modal1" role="dialog">
                <div class="modal-dialog dialog-lg">
                    <div class="modal-content">
                        <div class="modal-header"style="border-bottom-color:green;border-bottom-style:solid;border-bottom-width:thick">
                            <h1 class="modal-title">Add Supplier</h1>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <asp:Label runat="server" ID="Label1">Name</asp:Label>
                                <asp:TextBox runat="server" ID="SupplierNameTextBox" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" ID="Label2">Phone</asp:Label>
                                <asp:TextBox runat="server" ID="SupplierPhoneTextBox" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" ID="Label3">Address</asp:Label>
                                <asp:TextBox runat="server" ID="SupplierAddressTextBox" CssClass="form-control"></asp:TextBox><p></p>

                                 <asp:Label id="TipLbl" runat="server" ForeColor="Black" Font-Italic="true">Click outside the Pop-up to close the section....</asp:Label>
                                <p></p>
                                 <asp:Label runat="server" ID="EmptyLbl" CssClass="text-danger"></asp:Label>
                                
                            </div>
                            <div class="modal-footer">    
                                <asp:Button runat="server" ID="SupplierAddBtn" CssClass="btn btn-success form-control" Text="Add" OnClick="SupplierAddBtn_Click" />
                            </div>
                        </div>
                </div>
            </div></div>
                <p></p>
                <asp:ScriptManager runat="server"></asp:ScriptManager>
     
 <asp:UpdatePanel runat="server">
     <ContentTemplate>
         <div>
              <asp:TextBox ID="SuppliersearchTextBox" placeholder="search by name" CssClass="form-control" runat="server" OnTextChanged="SuppliersearchTextBox_TextChanged"></asp:TextBox>
         </div>
   
     </ContentTemplate>
 </asp:UpdatePanel>
     
  <p></p>
     <div>
       <asp:UpdatePanel runat="server">
             <ContentTemplate>
                  <asp:Label runat="server" ID="successLbl" CssClass="text-success"></asp:Label>
                       <asp:Label runat="server" ID="ErrorLbl" CssClass="text-danger"></asp:Label>
       <asp:GridView runat="server" OnSorting="SuppliersGridView_Sorting" OnPageIndexChanging="SuppliersGridView_PageIndexChanging" ID="SuppliersGridView" DataKeyNames="ID" AutoGenerateColumns="False"  OnRowDeleting="SuppliersGridView_RowDeleting" CellPadding="5" ForeColor="Gray" GridLines="Horizontal" Width="1083px" CssClass="text-center"
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
                    <asp:HyperLinkField DataNavigateUrlFields="ID" ControlStyle-CssClass="btn btn-toolbar fa fa-edit text-primary" DataNavigateUrlFormatString="~/UpdateSupplier.aspx?ID={0}" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="DeleteBttn" runat="server" CommandName="Delete" CssClass="btn btn-toolbar fa fa-trash text-danger"></asp:LinkButton>
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
