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
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

 
		        
		      protected void AddItemSubmitButton_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["PharmacyConnectionString"].ConnectionString);
            conn.Open();
            {
                if (medicineNameTextbox.Text == "" || PurchaseTextbox.Text == "" || RetailTextBox.Text == "" || WholesaleTexBox.Text == "" || QuantityTextBox.Text == "")
                {
                    ErrorLbl.Text = "Fields cannot be empty";
                }
                else
                {
                    DataTable dt = new DataTable();
                    SqlCommand adapter = new SqlCommand("Insert into MedicineList (Name,Brand,Purchase$,Retail$,Wholesale$,Quantity,Category) values (@Name,@Brand,@Purchase$," +
                        "@Retail$,@Wholesale$,@Quantity,@Category)", conn);

                    adapter.Parameters.AddWithValue("@Name", medicineNameTextbox.Text);
                    adapter.Parameters.AddWithValue("@Brand", BrandDropdown.SelectedItem.Value);
                    adapter.Parameters.AddWithValue("@Purchase$", PurchaseTextbox.Text);
                    adapter.Parameters.AddWithValue("@Retail$", RetailTextBox.Text);
                    adapter.Parameters.AddWithValue("@Wholesale$", WholesaleTexBox.Text);
                    adapter.Parameters.AddWithValue("@Quantity", QuantityTextBox.Text);
                    adapter.Parameters.AddWithValue("@Category", CategoryDropDownList.SelectedItem.Value);

                    adapter.ExecuteNonQuery();
                    Response.Redirect("List.aspx");                  
                    conn.Close();
                }


            }
        }
    }
}
	

	

