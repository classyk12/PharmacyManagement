<%@ Page Title="" Language="C#" MasterPageFile="~/pharm.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="Pharmacy.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

       <div style="font-weight: bold;font-size: 20px;margin: 10px 10px; border-bottom-style: solid; border-bottom-color:purple;">Users</div>
    
        <div>
      <button type="button" id="ModalBtn" class="btn btn-primary" data-toggle="modal" data-target="#modal1">Add User</button><p></p>
        </div>
    <div class="modal fade modal" id="modal1" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header"style="border-bottom-color:green;border-bottom-style:solid;border-bottom-width:thick">
                    <h1 class="modal-title">Add User</h1>
                </div>
                <div class="modal-body">
                    <div class="input-container">
                        <i class="fa fa-user icon"></i>
                        <asp:TextBox runat="server" CssClass="form-control" placeholder="Enter a Username" ID="AddUserTextBox"></asp:TextBox>
                        
                    </div>
                    <div class="input-container">
                       <i class="fa fa-envelope icon"> </i>
                        <asp:TextBox runat="server" ID="AddUserEmailTextBox" CssClass="form-control" placeholder="Enter Valid Email"></asp:TextBox>
                        <asp:RegularExpressionValidator runat="server" ForeColor="Red" ErrorMessage="Invalid Email Format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="AddUserEmailTextBox"></asp:RegularExpressionValidator>
                       
                    </div>
                      <asp:ScriptManager runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                                 <div class="input-container">
                        <i class="fa fa-key icon"> </i>
                           <asp:TextBox runat="server" ID="PasswordReg1" TextMode="Password" CssClass="form-control" placeholder="enter a password"></asp:TextBox>
                           
                    </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
               
                    <div class="input-container">
                        <i class="fa fa-key icon"></i>
                        <asp:TextBox runat="server" ID="PasswordReg2" TextMode="Password" CssClass="form-control" placeholder="password must match"></asp:TextBox>
                        
                    </div>
                    <div class="input-container">
                        <i class="fa fa-phone icon"></i>
                        <asp:TextBox ID="AddUserPhoneTextBox" CssClass="form-control" runat="server" placeholder="Enter valid phone number here"></asp:TextBox>
                        
                    </div><p></p>
                    <div class="input-container">
                        <i class="fa fa-list"></i>
                        <asp:DropDownList runat="server" ID="RoleDropDownList">
                            <asp:ListItem>Admin</asp:ListItem>
                            <asp:ListItem>Manager</asp:ListItem>
                            <asp:ListItem>User</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                     <p></p>
     <asp:Label runat="server" ID="TipLbl" Font-Italic="true" ForeColor="Black">Click outside the Pop-Up to close this section....</asp:Label>
                </div>
                <asp:label runat="server" ID="EmptyLbl" ForeColor="Red" Font-Italic="true"></asp:label>
             
                <div class="modal-footer">
                    <asp:Button runat="server" ID="AddUserButton" CssClass="btn btn-success text-center form-control" Text="Add" OnClick="AddUserButton_Click" />
                </div>
               
                
          
        </div>
    </div></div>
   
      <div>
          <asp:TextBox ID="UsersearchTextBox" placeholder="search by username" CssClass="form-control" runat="server" OnTextChanged="UsersearchTextBox_TextChanged"></asp:TextBox>
  </div><p></p>
          
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                   <asp:label runat="server" ID="ErrorLbl" ForeColor="Red" Font-Italic="true"></asp:label>
                  <asp:Label runat="server" ID="SuccessLbl" ForeColor="Green" CssClass="font-italic"></asp:Label> 
        <asp:GridView runat="server" OnSorting="UsersGridView_Sorting"  OnPageIndexChanging="UsersGridView_PageIndexChanging" ID="UsersGridView" DataKeyNames="ID" AutoGenerateColumns="False" OnRowDeleting="UsersGridView_RowDeleting" CellPadding="5" ForeColor="Gray" GridLines="Horizontal" Width="1083px" CssClass="text-center"
                 AllowPaging="true" AllowSorting="true" BorderColor="Gray" BorderStyle="Solid">
                <AlternatingRowStyle BackColor="White" />
                <Columns>

                    <asp:TemplateField HeaderText="ID" SortExpression="ID">
                        <ItemTemplate>
                            <asp:Label ID="Lbl1" runat="server" Text='<%#Eval("ID")%>'></asp:Label>
                        </ItemTemplate>
                  
                    </asp:TemplateField>

                             <asp:TemplateField HeaderText="Username" SortExpression="Username">
                        <ItemTemplate>
                            <asp:Label ID="Lbl2" runat="server" Text='<%#Eval("Username")%>'></asp:Label>
                        </ItemTemplate>
                    
                    </asp:TemplateField>

                            <asp:TemplateField HeaderText="Email" SortExpression="Email">
                        <ItemTemplate>
                            <asp:Label ID="Lbl3" runat="server" Text='<%#Eval("Email")%>'></asp:Label>
                        </ItemTemplate>
                   
                    </asp:TemplateField>

                    
                    <asp:TemplateField Headertext="Phone" SortExpression="Phone">
                        <ItemTemplate>
                         <asp:label id="Lbl4" runat="server" Text='<%#Eval("Phone")%>'></asp:label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    
                    <asp:TemplateField Headertext="Role" SortExpression="Role">
                        <ItemTemplate>
                         <asp:label id="Lbl5" runat="server" Text='<%#Eval("Role")%>'></asp:label>
                        </ItemTemplate>
                   
                    </asp:TemplateField>

                       

                    <asp:TemplateField HeaderText="Action" >
                        <ItemTemplate>
                            <asp:LinkButton ID="ViewBttn" runat="server" CommandName="Select" CssClass="btn btn-primary fa fa-eye"></asp:LinkButton>
                            <asp:LinkButton ID="DeleteBttn" runat="server" CommandName="Delete" CssClass="btn btn-danger fa fa-trash"></asp:LinkButton>
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
 
   
       <div>
       </div>
    </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>
