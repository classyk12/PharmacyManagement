<%@ Page Title="" Language="C#" MasterPageFile="~/pharm.Master" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="Pharmacy.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="text-success" style="font-weight: bold;font-size: 40px;margin: 10px 10px" >Add User</div>
    <div  style="border-bottom-color:gold;border-bottom-style:solid">
    <div class="input-container">
    <i class="fa fa-user icon"></i>
      <asp:TextBox ID="nameReg" class="form-control" placeholder="username must contain at least a digit" runat="server"></asp:TextBox>
  </div>

  <div class="input-container">
    <i class="fa fa-envelope icon"></i>
     <asp:TextBox ID="EmailReg" class="input-field form-control" placeholder="Email here" runat="server"></asp:TextBox>
  </div>

  <div class="input-container">
    <i class="fa fa-key icon"></i>
    <asp:TextBox ID="passwordReg" class="input-field form-control" TextMode="Password" Visible="True" placeholder="Password must contain special characters or digits" runat="server"></asp:TextBox>
  </div>
    <div class="input-container">
        <i class="fa fa-key icon"></i>
          <asp:TextBox ID="passwordReg2" class="input-field form-control" placeholder="password must match" TextMode="Password" runat="server"></asp:TextBox>
    </div>         
  <div class="input-container">
                   <i class="fa fa-phone icon"></i>
                   <asp:TextBox ID="PhoneReg" class="input-field form-control" placeholder="Phone number here" runat="server"></asp:TextBox>           
           </div>
       <div class="input-container">
                   <i class="fa fa-list icon"></i>
                   <asp:DropDownList ID="RoleDropDownList" CssClass="form-control" runat="server">
                      
                       <asp:ListItem>Admin</asp:ListItem>
                       <asp:ListItem>Manager</asp:ListItem>
                       <asp:ListItem>User</asp:ListItem>
                   </asp:DropDownList>
           </div>
        <div><asp:Label runat="server" ID="ErrorLbl" ForeColor="Red" CssClass="font-italic "></asp:Label>
            <asp:Label runat="server" ID="SuccessLbl" ForeColor="Green" CssClass="font-italic "></asp:Label>
        </div>
               <p></p>
               
    <div style="text-align:center">
  <asp:Button ID="RegButton" class="btn btn-primary" runat="server" Text="Add User" OnClick="RegButton_Click" />
        
    <a><asp:Button ID="CancelRegButton" class="btn btn-danger" runat="server" Text="Cancel" PostBackUrl="~/User.aspx" />
        </a>
        </div><p></p>
        </div>
</asp:Content>
