<%@ Page Title="" Language="C#" MasterPageFile="~/pharm.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="Pharmacy.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div style="font-weight: bold;font-size: 20px;margin: 10px 10px; border-bottom-style: solid; border-bottom-color:purple;">Medicine Category</div>
    <p></p>
    <p></p>
    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <p></p>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
    <div class="row">
        <div class="col-lg-5">
              <div class="form-group">
                  <div style="text-align:center;background-color:purple" class="text-white"><h3>Add New Category</h3></div>
        <asp:Label ID="CategoryLabel" runat="server" Text="Name: "></asp:Label>
        <asp:TextBox ID="CategoryTextBox" CssClass="form-control" runat="server" placeholder="Enter category name"></asp:TextBox>
               <asp:Label runat="server" ID="Errorlbl"></asp:Label>
    </div>
            
    <asp:Button ID="Categorybutton" class="btn btn-success" runat="server" Text="Add" OnClick="Categorybutton_Click"/></div>
         <div class="col-lg-7">
                    <asp:Label runat="server" ID="LblSuccess" ForeColor="Green"></asp:Label>
             <asp:Label runat="server" ID="LblError" ForeColor="Red" style="font-size:small;font-style:italic;font-weight:bold"></asp:Label>
      <asp:GridView runat="server" CssClass="text-center" ID="CategoryGridView" AutoGenerateColumns="False" DataKeyNames="ID" OnRowEditing="CategoryGridView_RowEditing" OnRowCancelingEdit="CategoryGridView_RowCancelingEdit" OnRowUpdating="CategoryGridView_RowUpdating" OnRowDeleting="CategoryGridView_RowDeleting" AllowPaging="True" AllowSorting="True" CellPadding="5" CellSpacing="1" ForeColor="Gray" GridLines="Horizontal" PageSize="7" Width="596px" OnPageIndexChanging="CategoryGridView_PageIndexChanging" OnSorting="CategoryGridView_Sorting" BorderColor="#999999" BorderStyle="Inset" >
          <AlternatingRowStyle BackColor="White" />
          <Columns>
                <asp:TemplateField HeaderText="ID" SortExpression="ID">
                  <ItemTemplate>
                      <asp:Label ID="label" runat="server" Text='<%#Eval("ID")%>'></asp:Label>
                  </ItemTemplate>
                 
              </asp:TemplateField>

              <asp:TemplateField HeaderText="Name" SortExpression="Name">
                  <ItemTemplate>
                      <asp:Label ID="label1" runat="server" Text='<%#Eval("Name")%>'></asp:Label>
                  </ItemTemplate>
                  <EditItemTemplate>
                       <asp:TextBox ID="CategoryTextBox" CssClass="form-control" runat="server" Text='<%#Eval("Name")%>'></asp:TextBox>
                  </EditItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Action">
                  <ItemTemplate>
                    <asp:LinkButton runat="server" ID="editBtn" CssClass="btn fa fa-edit text-primary" CommandName="Edit"></asp:LinkButton>
                      <asp:LinkButton runat="server" ID="DeleteBtn" CommandName="Delete" CssClass="btn fa fa-trash text-danger"></asp:LinkButton>
                  </ItemTemplate>
                  <EditItemTemplate>
                      <asp:LinkButton runat="server" ID="UpdateBtn" CommandName="Update" class="btn fa fa-save text-success"/>
                      <asp:LinkButton runat="server" ID="CancelBtn" CommandName="Cancel" CssClass="btn fa fa-times text-secondary"/>
                  </EditItemTemplate>
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
        
         
        </div>
            </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>
