<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GridviewTest.aspx.cs" Inherits="Pharmacy.GridviewTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server"

              DataSourceID=""

              AutoGenerateColumns="false"

              CellPadding="2" ForeColor="#333333"

              GridLines="Both"

              DataKeyNames="ID"

              OnRowDataBound="GridView1_RowDataBound" Height="439px" Width="891px">
</asp:GridView>

        </div>
    </form>
</body>
</html>
