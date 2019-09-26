using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Pharmacy
{
    public partial class WebForm11 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SetFocus(nameReg);
        }

        protected void RegButton_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["PharmacyConnectionString"].ConnectionString);
            conn.Open();
            {
           
                    if (nameReg.Text == "" || EmailReg.Text == "" || passwordReg.Text == "" || passwordReg2.Text == "" || PhoneReg.Text == "" || passwordReg.Text!=passwordReg2.Text)
                    {
                        ErrorLbl.Text = "Fields cannot be empty or password does not match";
                    }
                
                else
                {
                    DataTable dt = new DataTable();
                    SqlCommand adapter = new SqlCommand("Insert into UsersList (Username,Email,Password, Confirm_Password,Phone,Role) values (@Username,@Email,@Password," +
                        "@Confirm_Password,@Phone,@Role)", conn);

                    adapter.Parameters.AddWithValue("@Username", nameReg.Text);
                    adapter.Parameters.AddWithValue("@Email", EmailReg.Text);
                    adapter.Parameters.AddWithValue("@Password", passwordReg.Text);
                    adapter.Parameters.AddWithValue("@Confirm_Password", passwordReg2.Text);
                    adapter.Parameters.AddWithValue("@Phone", PhoneReg.Text);
                    adapter.Parameters.AddWithValue("@Role", RoleDropDownList.SelectedItem.Value);


                    adapter.ExecuteNonQuery();
                    SuccessLbl.Text = "Record added successfully";
                    conn.Close();
                    
                }


            }
        }
    }
}