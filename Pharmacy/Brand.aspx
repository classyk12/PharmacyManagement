<%@ Page Title="" Language="C#" MasterPageFile="~/pharm.Master" AutoEventWireup="true" CodeBehind="Brand.aspx.cs" Inherits="Pharmacy.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div style="font-weight: bold;font-size: 20px;margin: 10px 10px; border-bottom-style: solid; border-bottom-color:purple;">&nbsp;Medicine Brand</div>
    <p></p>
    <asp:ScriptManager runat="server" ID="Scriptmanager1"></asp:ScriptManager>
    <p></p>
    <p></p>
     <asp:UpdatePanel runat="server" ID="Updatepanel1">
            <ContentTemplate>
    <div class="row">
        <div class="col-lg-5">
              <div class="form-group">
                  <div style="text-align:center;background-color:purple" class="text-white"><h3>Add New Brand</h3><p></p></div>
        <asp:Label ID="BrandLabel" runat="server" Text="Name: "></asp:Label>
        <asp:TextBox ID="BrandTextBox" CssClass="form-control" runat="server" placeholder="Enter brand name"></asp:TextBox>
                     <asp:Label runat="server" ID="BrandTextBoxLbl" ForeColor="Red" style="font-size:small;font-style:italic;font-weight:bold"></asp:Label>
            
    </div>
    <asp:Button ID="Brandbutton" class="btn btn-success"  runat="server" Text="Add" OnClick="Brandbutton_Click"/></div>
       
         <div class="col-lg-7">
           <div>  <asp:Label id="successLbl" runat="server" text="" ForeColor="Green" Font-Italic="true"></asp:Label>
           
            </div>
             <asp:Label runat="server" ID="ErrorLbl" ForeColor="Red"></asp:Label>
          <asp:GridView ID="BrandGridView" EmptyDataRowStyle-ForeColor="Red" runat="server"  AutoGenerateColumns="False" DataKeyNames="ID" CssClass="text-center" OnRowDeleting="BrandGridView_RowDeleting"  OnRowEditing="BrandGridView_RowEditing" OnRowCancelingEdit="BrandGridView_RowCancelingEdit" OnRowUpdating="BrandGridView_RowUpdating" CellPadding="5" ForeColor="Gray" GridLines="Horizontal" AllowPaging="True" AllowSorting="True" CellSpacing="1" PageSize="7" Width="596px" OnPageIndexChanging="BrandGridView_PageIndexChanging" OnSorting="BrandGridView_Sorting" BackColor="White" BorderColor="#999999" BorderStyle="Inset">
              <AlternatingRowStyle BackColor="White" ForeColor="Gray" />
             <Columns>
                 <asp:TemplateField HeaderText="ID" SortExpression="ID">
                     <ItemTemplate>
                         <asp:Label runat="server" ID="Lbl1" Text='<%#Eval("ID")%>' ></asp:Label>
                     </ItemTemplate>
                   <%--  <EditItemTemplate>
                         <asp:TextBox runat="server" ID="IDTextBox" Text='<%#Eval("ID")%>'></asp:TextBox>
                     </EditItemTemplate>--%>
                 </asp:TemplateField>

                 <asp:TemplateField HeaderText="Name" SortExpression="Name">
                     <ItemTemplate>
                         <asp:Label ID="Lbl2" runat="server" Text='<%#Eval("Name")%>'></asp:Label>
                     </ItemTemplate>
                     <EditItemTemplate>
                         <asp:TextBox runat="server" CssClass="form-control" ID="NameTextBox"  Text='<%#Eval("Name")%>'></asp:TextBox>
                     </EditItemTemplate>

                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Action">
                     <ItemTemplate>
                         <asp:LinkButton runat="server" ID="Editbtn" CssClass="btn fa fa-edit text-primary"  CommandName="edit" ToolTip="Edit Brand" />
                         <asp:LinkButton runat="server" ID="Deletebtn" CssClass="btn fa fa-trash text-danger"  commandName="Delete" ToolTip="Delete Brand" />
                     </ItemTemplate>
                     <EditItemTemplate>
                         <asp:LinkButton runat="server" ID="Updatebtn" CssClass="btn  fa fa-save text-success"  CommandName="Update" ToolTip="Update Record" />
                         <asp:LinkButton runat="server" ID="Cancelbtn" CssClass="btn secondary fa fa-times text-secondary"  CommandName="cancel" ToolTip="Cancel" />
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
               </ContentTemplate>
       
         </asp:UpdatePanel>  

</asp:Content>
