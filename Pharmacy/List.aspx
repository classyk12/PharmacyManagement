  <%@ Page Title="" Language="C#" MasterPageFile="~/pharm.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="Pharmacy.WebForm4" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div style="font-weight: bold;font-size: 20px;margin: 10px 10px; border-bottom-style: solid; border-bottom-color:purple;">Items</div>
   
         

      <asp:SqlDataSource ID="DSforBDDL" runat="server"
         ConnectionString="<%$ ConnectionStrings:PharmacyConnectionString%>"
        SelectCommand="SELECT * FROM BrandList ORDER BY ID" >
        </asp:SqlDataSource>

     <asp:SqlDataSource ID="SqlDataSource1" runat="server"
         ConnectionString="<%$ ConnectionStrings:PharmacyConnectionString%>"
        SelectCommand="SELECT * FROM CategoryList ORDER BY ID" >
        </asp:SqlDataSource>
    <p></p>
   
  <div>
      <div class="col-md-6 text-left">
     
       <a class="btn btn-sm bg-primary btn-primary" href="Add.aspx">
           <div class="fa fa-plus"></div>Add New
      </a>
        <a class="btn btn-sm bg-primary btn-primary" href="#">
            <div class="fa fa-download"></div>Import Data
        </a> 
        </div>

   <p></p>
          <asp:ScriptManager runat="server"></asp:ScriptManager>
       
      <asp:UpdatePanel runat="server" ID="UPDPanel2">
          <ContentTemplate>
                 <div >
          <asp:TextBox ID="itemsearchTextBox" AutoPostBack="true" CssClass="form-control" placeholder="search by name"  runat="server" OnTextChanged="itemsearchTextBox_TextChanged"></asp:TextBox>
  
      </div>
          </ContentTemplate>

      </asp:UpdatePanel>
  
  </div>
      
    <p></p>
  
     <asp:UpdatePanel runat="server">
     <ContentTemplate>

   
         <div>
               <asp:Label id="successLbl" runat="server" text="" ForeColor="Green"></asp:Label><br />
           <asp:Label runat="server" ID="ErrorLbl" ForeColor="Red"></asp:Label>
            <asp:GridView runat="server" OnSorting="MedicineGridView_Sorting" OnPageIndexChanging="MedicineGridView_PageIndexChanging" ID="MedicineGridView" DataKeyNames="ID" AutoGenerateColumns="False" OnRowDeleting="BrandGridView_RowDeleting" CellPadding="5" ForeColor="Gray" Width="1083px" CssClass="text-center"
                 AllowPaging="true" AllowSorting="true" BorderColor="#999999" BorderStyle="Solid" GridLines="Horizontal">
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

                    <asp:TemplateField Headertext="Brand" SortExpression="Brand">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="Lbl3" Text='<%#Eval("Brand")%>'></asp:Label></ItemTemplate>
                    </asp:TemplateField>

                    
                    <asp:TemplateField Headertext="Quantity" SortExpression="Quantity">
                        <ItemTemplate>
                         <asp:Label id="Lbl4" runat="server" Text='<%#Eval("Quantity")%>'></asp:Label> </ItemTemplate>                 
                    </asp:TemplateField>

                    
                    <asp:TemplateField Headertext="Category" SortExpression="Category">
                        <ItemTemplate>
                         <asp:label id="Lbl5" runat="server" Text='<%#Eval("Category")%>'></asp:label>
                        </ItemTemplate>                 
                    </asp:TemplateField>

                         <asp:TemplateField HeaderText="Purchase($)" SortExpression="Purchase$">
                        <ItemTemplate>
                            <asp:Label ID="Lbl6" runat="server" Text='<%#Eval("Purchase$")%>'></asp:Label> </ItemTemplate>                    
                    </asp:TemplateField>
                 
                             <asp:TemplateField HeaderText="Retail($)" SortExpression="Retail$">
                        <ItemTemplate>
                            <asp:Label ID="Lbl7" runat="server" Text='<%#Eval("Retail$")%>'></asp:Label>
                        </ItemTemplate>                  
                    </asp:TemplateField>

                             <asp:TemplateField HeaderText="Wholesale($)" SortExpression="Wholesale$">
                        <ItemTemplate>
                            <asp:Label ID="Lbl8" runat="server" Text='<%#Eval("Wholesale$")%>'></asp:Label>
                        </ItemTemplate>                      
                    </asp:TemplateField>

                    <asp:HyperLinkField ControlStyle-CssClass="btn btn-toolbar fa fa-edit text-primary" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="Update.aspx?ID={0}"/>                  
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="DeleteButton" CssClass="btn btn-toolbar fa fa-trash text-danger" CommandName="Delete"></asp:LinkButton>
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
          
             <br />
                    </div>
         </div>
                   </ContentTemplate>
 </asp:UpdatePanel>

      
 
  
</asp:Content>
