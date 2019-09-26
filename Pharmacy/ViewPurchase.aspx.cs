using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Pharmacy
{

    public partial class WebForm22 : System.Web.UI.Page
    {
        int PurchaseID = 0;
           double total;
        protected void Page_Load(object sender, EventArgs e)
        {
            PurchaseID = Convert.ToInt32(Request.QueryString["PurchaseID"]);
            if (!IsPostBack)
            {
                BindTextBoxes();
                BindGrid();
            }
        }
        private void BindTextBoxes()
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["PharmacyConnectionString"].ConnectionString);
            conn.Open();
            SqlCommand command = new SqlCommand("select GrandTotal,PurchaseDate,Discount from PurchaseList where PurchaseID=" +PurchaseID,conn);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            adapter.Fill(dt);
            TotalResultTxtBox.Text = dt.Rows[0][0].ToString();
            DateTextBox.Text = dt.Rows[0][1].ToString();
            DiscountTextBox.Text = dt.Rows[0][2].ToString();
            conn.Close();
        }
        private void BindGrid()
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["PharmacyConnectionString"].ConnectionString);
            conn.Open();
            SqlCommand command = new SqlCommand("select a.SupplierName, a.MedicineName,a.Quantity,a.Price,a.Amount from DetailsList b left outer join ProductList a on a.ProductID=b.ProductID where PurchaseID =" + PurchaseID, conn);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            adapter.Fill(dt);
            ViewState["dt"] = dt;
            DetailsGridView.DataSource = dt;
            DetailsGridView.DataBind();


        }

        protected void DetailsGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            int index = Convert.ToInt32(e.RowIndex);
            DataTable dt = ViewState["dt"] as DataTable;
            dt.Rows[index].Delete();
            ViewState["dt"] = dt;
            DetailsGridView.DataSource = ViewState["dt"] = dt;
            DetailsGridView.DataBind();

        }

        protected void DetailsGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                total += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "Amount"));
                TotalLbl.Text = Convert.ToString(total);
            }
        }
    }
}