<%@ Page Title="" Language="C#" MasterPageFile="~/pharm.Master" AutoEventWireup="true" CodeBehind="Addinvoice.aspx.cs" Inherits="Pharmacy.WebForm15" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="text-success" style="font-weight: bold;font-size: 40px;margin: 10px 10px" >New invoice</div>
    <div style="border: thin solid #33CC33; margin: 0px; padding: 55px;">
  <div class="row">
      <div class="col-lg-3"> 
          <div class="form-group">
          <asp:Label ID="Label1" runat="server" Text="Supplier:"></asp:Label>
              <asp:DropDownList ID="SupplierDropDownList" CssClass="form-control" runat="server"></asp:DropDownList>
      </div>
          </div>
      <div class="col-lg-3"> 
               <div class="form-group">
          <asp:Label ID="Label2" runat="server" Text="Reference:"></asp:Label>
              <asp:TextBox ID="ReferenceTextBox1" CssClass="form-control" runat="server"></asp:TextBox>
      </div>

      </div>
      <div class="col-lg-3">
                     <div class="form-group">
        <asp:Label ID="Label3" runat="server" Text="Date:"></asp:Label>
        <asp:TextBox ID="DateTextBox" CssClass="form-control" runat="server"></asp:TextBox>
      </div>
      </div>
  </div><p></p>

             <div class="col-lg-3">
                     <div class="form-group">
        <asp:Label ID="Label4" runat="server" Text="Sales Type"></asp:Label>
         <asp:DropDownList ID="SalesTypeDropDownList" runat="server">
             <asp:ListItem>Wholesale</asp:ListItem>
             <asp:ListItem>Retail</asp:ListItem>
                         </asp:DropDownList>
      </div>
      </div>
  <p></p>

        <div>
            <asp:TextBox ID="PurchaseTextbox" CssClass="form-control" runat="server" placeholder="Search"></asp:TextBox>
        </div><p></p>
        <div class="row" style="background-color: #C0C0C0">
            <div class="col-md-1" style="font-weight:bold">Name</div>
             <div class="col-md-1" style="font-weight:bold">Qty</div>
             <div class="col-md-2" style="font-weight:bold">Price</div>
             <div class="col-md-2" style="font-weight:bold">Unit</div>
             <div class="col-md-2" style="font-weight:bold">Tax(%)</div>
             <div class="col-md-1" style="font-weight:bold">Tax</div>
             <div class="col-md-2" style="font-weight:bold">Amount</div>
             <div class="col-md-1" style="font-weight:bold">Action</div>
        </div><p></p>
            <div class="row">
            <div class="col-md-1" style="font-weight:bold">
                <asp:Label ID="purchaseNameLabel" runat="server" Text=""></asp:Label>

            </div>
             <div class="col-md-1" style="font-weight:bold">
                 <asp:TextBox id="QtyTextbox" Text="" CssClass="form-control" runat="server"></asp:TextBox>  

             </div>
             <div class="col-md-2" style="font-weight:bold"> <asp:TextBox id="PriceTextBox" class="form-control" Text="" runat="server"></asp:TextBox>

             </div>
             <div class="col-md-2" style="font-weight:bold">
                 <asp:DropDownList ID="UnitDropDownList" CssClass="form-control" runat="server"></asp:DropDownList>
             </div>

             <div class="col-md-2" style="font-weight:bold"><asp:DropDownList ID="TaxDropDownList" CssClass="form-control" runat="server"></asp:DropDownList></div>

                <div class="col-md-1">
                 <asp:Label ID="Taxlabel" CssClass="" runat="server" Text=""></asp:Label>
             </div>

             <div class="col-md-2" style="font-weight:bold"><asp:TextBox id="AmountTextBox" class="form-control" Text="" runat="server"></asp:TextBox>
</div>
             <div class="col-md-1" style="font-weight:bold">
                 <asp:Button ID="DeleteButton" CssClass="btn btn-outline-danger" Text="Delete" runat="server" />
             </div><p></p>
        </div><p></p>
        <div class="row">
            <div class="col-md-7" style="text-align:right;font-weight:bold">Quantity</div>
            <div class="col-md-5" style="text-align:right;font-weight:bold">
                <asp:TextBox ID="QuantityTextBox" class="form-control" runat="server"></asp:TextBox></div>  
        </div><p></p>
           <div class="row">
            <div class="col-md-7" style="text-align:right;font-weight:bold">Sub Total</div>
            <div class="col-md-5" style="text-align:right;font-weight:bold">
                <asp:TextBox ID="SubTotalTextBox" class="form-control" runat="server"></asp:TextBox></div>  
        </div><p></p>

           <div class="row">
            <div class="col-md-7" style="text-align:right;font-weight:bold">Tax Total</div>
            <div class="col-md-5" style="text-align:right;font-weight:bold">
                <asp:TextBox ID="TaxTotalTextBox" class="form-control" runat="server"></asp:TextBox></div>  
        </div><p></p>

           <div class="row">
            <div class="col-md-7" style="text-align:right;font-weight:bold">Grand Total</div>
            <div class="col-md-5" style="text-align:right;font-weight:bold">
                <asp:TextBox ID="GrandTotalTextBox" class="form-control" runat="server" Text=""></asp:TextBox></div>  
               </div><p></p>
        <div class="row">
            <div class="col-md-7" style="text-align:right;font-weight:bold">Amount Paid</div>
            <div class="col-md-5" style="text-align:right;font-weight:bold">
                <asp:TextBox ID="PaidTextBox" CssClass="form-control" runat="server" Text=""></asp:TextBox>
            </div>
        </div><p></p>
        
        <div style="text-align:center;border-top-style:solid;border-top-color:black">    
            <p></p><asp:Button ID="submitinvoiceButton" Text="Submit" class="btn btn-success text-white" runat="server" /></div>
</div>
</asp:Content>
