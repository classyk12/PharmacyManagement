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
    public partial class WebForm8 : System.Web.UI.Page
    {
        int id=0;
        protected void Page_Load(object sender, EventArgs e)
        {
            id = Convert.ToInt32(Request.QueryString["ID"].ToString());
            if (!this.IsPostBack)
            {
                BindTextBox();
            }
        }

        public void BindTextBox()
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["PharmacyConnectionString"].ConnectionString);        
            SqlCommand command = new SqlCommand("select Name,Quantity,Purchase$,Retail$,Wholesale$,ID from MedicineList where ID=" +id,conn);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            adapter.Fill(dt);
            EditNameTextBox.Text= dt.Rows[0][0].ToString();
          EditQuantityTextBox.Text = dt.Rows[0][1].ToString();
           EditPurchaseTextBox.Text= dt.Rows[0][2].ToString();
         EditRetailTextBox.Text = dt.Rows[0][3].ToString();
            EditWholesaleTextBox.Text = dt.Rows[0][4].ToString();
             EditTextBox.Text = dt.Rows[0][5].ToString();

        }
               
            
           
            //EditBrandDDL.SelectedItem.Value = dt.Rows[0][5].ToString();
            //EditCategoryDDL.SelectedItem.Value = dt.Rows[0][6].ToString();

        

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["PharmacyConnectionString"].ConnectionString);
            conn.Open();
          
            SqlCommand command = new SqlCommand("Update MedicineList set Name=@Name,Quantity=@Quantity,Purchase$=@Purchase$,Retail$=@Retail$,Wholesale$=@Wholesale$,Brand=@Brand,Category=@Category where ID=@ID", conn);
            command.Parameters.AddWithValue("@Name", EditNameTextBox.Text);
            command.Parameters.AddWithValue("@Brand", EditBrandDDL.SelectedItem.Value);
            command.Parameters.AddWithValue("@Quantity",EditQuantityTextBox.Text);
            command.Parameters.AddWithValue("@Category", EditCategoryDDL.SelectedItem.Value);
            command.Parameters.AddWithValue("@Purchase$", EditPurchaseTextBox.Text);
            command.Parameters.AddWithValue("@Retail$", EditRetailTextBox.Text);
            command.Parameters.AddWithValue("@Wholesale$", EditWholesaleTextBox.Text);
            command.Parameters.AddWithValue("@ID", EditTextBox.Text);
            command.ExecuteNonQuery();
            Response.Redirect("~/List.aspx");
            conn.Close();
        }
    }
}