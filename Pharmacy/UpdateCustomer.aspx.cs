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
  
    public partial class WebForm9 : System.Web.UI.Page
    {
        int id = 0;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            id = Convert.ToInt32(Request.QueryString["ID"].ToString());
            if (!IsPostBack)
            {
                BindTextBoxes();
            }
        }
        private void BindTextBoxes()
        {
          DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["PharmacyConnectionString"].ConnectionString);
            conn.Open();
            SqlDataAdapter adapter = new SqlDataAdapter("Select * from CustomersList where ID="+id, conn);
            adapter.Fill(dt);
            EditIDTextBox.Text = dt.Rows[0][0].ToString();
            EditCustomerName.Text = dt.Rows[0][1].ToString();
            EditCustomerPhone.Text= dt.Rows[0][2].ToString();
            EditCustomerAddress.Text = dt.Rows[0][3].ToString();
            conn.Close();
                }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["PharmacyConnectionString"].ConnectionString);
            conn.Open();
            SqlCommand command = new SqlCommand("update CustomersList set Phone=@Phone,Name=@Name,Address=@Address where ID=" +id, conn);
            command.Parameters.AddWithValue("@ID", EditIDTextBox.Text.Trim());
            command.Parameters.AddWithValue("@Phone", EditCustomerPhone.Text.Trim());
            command.Parameters.AddWithValue("@Name", EditCustomerName.Text.Trim());
            command.Parameters.AddWithValue("@Address", EditCustomerAddress.Text.Trim());
            command.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("~/Customers.aspx");
        }
        
    }
}