<%@ Page Title="" Language="C#" MasterPageFile="~/pharm.Master" AutoEventWireup="true" CodeBehind="Purchases.aspx.cs" Inherits="Pharmacy.WebForm12" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div style="font-weight: bold;font-size: 20px;margin: 10px 10px; border-bottom-style: solid; border-bottom-color: purple">Purchases</div>
        <div class="btn">
       <a href="AddPurchase.aspx" class="btn btn-sm bg-primary btn-primary">
           <div class="fa fa-plus"></div>Add New </a> 
           </div>
       
            <asp:ScriptManager runat="server"></asp:ScriptManager>  
      <div class="input-group">
          <asp:TextBox ID="PurchasesearchTextBox" placeholder="Enter Keyword here" CssClass="form-control" runat="server"></asp:TextBox>
  </div>
  
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate><p></p>
                     <asp:Label runat="server" ID="ErrorLbl" ForeColor="Red"></asp:Label><p></p>
           <asp:Label id="successLbl" runat="server" text="" ForeColor="Green"></asp:Label><br />
          
       <asp:GridView EmptyDataText="No records found....!!" runat="server"  OnPageIndexChanging="PurchaseGridView_PageIndexChanging" ID="PurchaseGridView" DataKeyNames="PurchaseID" AutoGenerateColumns="False"  OnRowDeleting="PurchaseGridView_RowDeleting" CellPadding="5" ForeColor="Gray" GridLines="Horizontal" Width="1083px" CssClass="text-center"
                 AllowPaging="true" AllowSorting="true" BorderColor="Gray" BorderStyle="Solid">
                <AlternatingRowStyle BackColor="White" />
                <Columns>

                    <asp:TemplateField HeaderText="PurchaseID" SortExpression="PurchaseID">
                        <ItemTemplate>
                            <asp:Label ID="Lbl1" runat="server" Text='<%#Eval("PurchaseID")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField Headertext="Payment Method" SortExpression="PaymentMethod">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="Lbl3" Text='<%#Eval("Method")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList runat="server" ID="MethodDropDownList" CssClass="form-control">
                                <asp:ListItem>Cash</asp:ListItem>
                                <asp:ListItem>Check</asp:ListItem>                               
                            </asp:DropDownList>
                       </EditItemTemplate>
                    </asp:TemplateField>

                

                    
                    <asp:TemplateField Headertext="Grand Total" SortExpression="Grand Total">
                        <ItemTemplate>
                         <asp:label id="Lbl5" runat="server" Text='<%#Eval("GrandTotal")%>'></asp:label>
                        </ItemTemplate>
                        <EditItemTemplate>
                     <asp:TextBox runat="server" CssClass="form-control" ID="TotalTextBox" Text='<%#Eval("GrandTotal") %>' ></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                         <asp:TemplateField HeaderText="Status" SortExpression="Status">
                        <ItemTemplate>
                            <asp:Label ID="Lbl6" runat="server" Text='<%#Eval("Status")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList runat="server" ID="StatusDropDownList" CssClass="form-control">
                                <asp:ListItem>Paid</asp:ListItem>
                                <asp:ListItem>Due</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>
                 
                             <asp:TemplateField HeaderText="Date" SortExpression="Date">
                        <ItemTemplate>
                            <asp:Label ID="Lbl7" runat="server" Text='<%# Eval("PurchaseDate", "{0:dd MMM yyyy}")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="DateTextBox" CssClass="form-control" Text='<%#Eval("Date")%>'></asp:TextBox>
                              <ajaxToolkit:CalendarExtender ID="CalendarExtender1" PopupPosition="BottomLeft" TargetControlID="DateTextBox" runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                        <asp:HyperLinkField ControlStyle-CssClass="fa fa-eye text-primary" DataNavigateUrlFields="PurchaseID" DataNavigateUrlFormatString="ViewPurchase.aspx?PurchaseID={0}" >
                    <ControlStyle CssClass="fa fa-eye text-primary" />
                    </asp:HyperLinkField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton runat="server" CssClass="fa fa-trash text-danger" CommandName="Delete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                                <EditRowStyle BackColor="White" BorderStyle="None" CssClass="text white" />
              <EmptyDataRowStyle ForeColor="Red" BorderStyle="None" />
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
                 
       
       </div>
       </ContentTemplate>
            </asp:UpdatePanel>
</asp:Content>
