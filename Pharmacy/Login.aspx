<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Pharmacy.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-color: #FFFFFF">
<head runat="server">
    <title></title>
         <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <style type="text/css">
        .auto-style1 {
            left: 16px;
            top: 354px;
        }
        .auto-style2 {
            left: 118px;
        }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
            <nav class="navbar navbar-expand-lg bg-dark">
                <h4 class="text-lg-center text-white"><b>RIO PHARM </b></h4>
             </nav>
            
            <div class="container bg-transparent">
                <p></p><p></p><p></p>
                <div class="form-group">
                    
                <asp:Label ID="nameLabel" runat="server" Text="Enter Username" ></asp:Label>
                    <asp:TextBox ID="UsernameTextBox" placeholder="Username" class="form-control" runat="server" OnTextChanged="UsernameTextBox_TextChanged" ></asp:TextBox>
               </div>
                   <div class="form-group">
                <asp:Label ID="passwordLabel" runat="server" Text="Enter Password"></asp:Label>
                    <asp:TextBox ID="PasswordTextBox" placeholder="Password" class="form-control" runat="server" ></asp:TextBox>
               </div>
                                     <div class="form-group"> 
                                         <asp:CheckBox ID="remembercheckbox" class="form-check-input" runat="server" CssClass="auto-style2" />
                <asp:Label ID="RememberLabel" class= "form-check-input" runat="server" Text="Remember Me" CssClass="auto-style1"></asp:Label>
            &nbsp;
            </div>
                <div class="form-group">
                    <asp:Button ID="SubmitButton" class="form-control btn btn-primary" runat="server" Text="Let me in" />
                </div> 
               </div>    
         <div class="media border p-3">
                <img src="images/doctor.jpg" class="mr-3 mt-3 rounded-circle" style="width:90px" />
                <div class="media-body">
                    <h4>CHELLIE PINGREE</h4>
                    <p>When I was in the Maine Senate and proposed Maine RX - a plan to lower prescription drug costs by forcing the pharmaceutical companies to negotiate - I was told by many people that it was too big an idea, and we couldn't overcome opposition from the drug companies.
</p>
                </div>
            </div>
                
        
    </form>
</body>
</html>
