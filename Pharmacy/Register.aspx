<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Pharmacy.Register" %>

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
     
    <style>
/* Style the input container */
.input-container {
  display: flex;
  width: 100%;
  margin-bottom: 15px;
}

/* Style the form icons */
.icon {
  padding: 10px;
  background: dodgerblue;
  color: white;
  min-width: 50px;
  text-align: center;
}

/* Style the input fields */
.input-field {
  width: 100%;
  padding: 10px;
  outline: none;
}

.input-field:focus {
  border: 2px solid white;
}

/* Set a style for the submit button */
.btn {
  background-color: dodgerblue;
  color: white;
  padding: 15px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.btn:hover {
  opacity: 3;
}
        </style>
</head>
<body>
   
         <nav class="navbar navbar-expand-lg bg-dark">
                <h4 class="text-lg-center text-white"><b>RIO PHARM </b></h4>
             </nav>
       <form id="form1" runat="server">
           <div class="container">
         <h2>Register Form</h2>
  <div class="input-container">
      <div style="text-align:center">
     
      </div>
    <i class="fa fa-user icon"></i>
      <asp:TextBox ID="nameReg" class="input-field" placeholder="username must contain at least a digit" runat="server"></asp:TextBox>
  </div>

  <div class="input-container">
    <i class="fa fa-envelope icon"></i>
     <asp:TextBox ID="EmailReg" class="input-field" placeholder="Email here" runat="server"></asp:TextBox>
  </div>

  <div class="input-container">
    <i class="fa fa-key icon"></i>
    <asp:TextBox ID="passwordReg" class="input-field" placeholder="Password must contain special characters or digits" runat="server"></asp:TextBox>
  </div>
               <div class="input-container">
                   <i class="fa fa-key icon"></i>
                   <asp:TextBox ID="passwordReg2" class="input-field" placeholder="password must match" runat="server"></asp:TextBox>
               </div>
               <div class="input-container">
                   <i class="fa fa-phone icon"></i>
                   <asp:TextBox ID="PhoneReg" class="input-field" placeholder="Phone number here" runat="server"></asp:TextBox>
                        
               </div>
               <div class="form-group">
                   <i class="fa fa-image icon"></i>
                   <asp:Label ID="PictureLabel" runat="server" Text=""></asp:Label>
                   <asp:FileUpload ID="pictureUpload" runat="server" />
               </div>
               <p></p>
               
  <asp:Button ID="RegButton" class="btn" runat="server" Text="Register Me"></asp:Button>
            

        



         <div class="media border p-3">
                <img src="images/doctor.jpg" class="mr-3 mt-3 rounded-circle" style="width:90px" />
                <div class="media-body">
                    <h4>JOHN DOOLITTLE</h4>
                    <p>Developments in medical technology have long been confined to procedural or pharmaceutical advances, while neglecting a most basic and essential component of medicine: patient information management.
</p>
                </div>
            </div>
               </div>
               </form> 
    
</body>
</html>
