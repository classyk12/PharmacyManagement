<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Pharmacy.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>

</head>
<body class="bg-light">
  
    <form id="form1" runat="server">
        <div class="row">
            <div class="col-lg-12"></div>
        </div><p></p><p></p><p></p>
     <div class="row" id="background-login">
         <div class="col-lg-4"></div>
         <div class="col-lg-4 col-lg-offset-6" style="padding-top:10em">
             <div class="card">
                 <div class="card-header text-center text-white" style="font-weight:bold;font-size:larger;background-color:rebeccapurple">SIGN-in To RioPharm<p></p></div>
                 <p></p>
                 <div class="card-body">
                    <div> <asp:TextBox runat="server" ID="Username" CssClass=" form-control" placeholder="Enter Username"></asp:TextBox><p></p></div><p></p>
                     <p></p>
                   <div> <asp:TextBox runat="server" ID="password" TextMode="Password" CssClass="form-control" placeholder="Enter Password"></asp:TextBox><p></p></div> <p>
                        <span >
                        <asp:Label runat="server" ID="ErrorLbl" class="text-center text-danger" style="font-size:small;font-style:italic;font-weight:bold"></asp:Label>
                    </span>
                                                                                                                                                                 </p>
                     <asp:CheckBox runat="server" Text=" Remember Me " />
                         
                 </div>
                 <div class="card-footer text-center"><p></p>
                 <asp:LinkButton runat="server" Text="Login" CssClass="btn btn-primary form-control" OnClick="loginButton_Click"></asp:LinkButton><p></p>
                 </div>
             </div>
         </div><p></p>
</div>


    </form>

</body>
</html>