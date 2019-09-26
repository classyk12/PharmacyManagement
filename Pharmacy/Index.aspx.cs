using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Pharmacy
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //protected void RegButton_Click(object sender, EventArgs e)
        //{


        //    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PharmacyConnectionString"].ConnectionString);
        //    con.Open();
        //    SqlCommand m = new SqlCommand("insert into UsersList values (@Username,@Email,@Password,@Confirm_Password,@Phone,@Role)", con);
        //    m.Parameters.AddWithValue("@Username", nameReg.Text);
        //    m.Parameters.AddWithValue("@Email", EmailReg.Text);
        //    m.Parameters.AddWithValue("@Password", passwordReg.Text);
        //    m.Parameters.AddWithValue("@Confirm_Password", passwordReg2.Text);
        //    m.Parameters.AddWithValue("@Phone", PhoneReg.Text);
        //    m.Parameters.AddWithValue("@Role", RoleDropDownList.SelectedValue);
        //    m.ExecuteNonQuery();

        //    con.Close();
        //    Response.Redirect("Success.aspx");

        //}
        protected void loginButton_Click(object sender, EventArgs e)
        {
            string user = Username.Text;
            string pass = password.Text;

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["PharmacyConnectionString"].ConnectionString);
            conn.Open();
            SqlCommand m = new SqlCommand("select Username, Password from UsersList where Username=@user and Password=@pass", conn);
            m.Parameters.AddWithValue("user", @user);
            m.Parameters.AddWithValue("pass", @pass);

            SqlDataAdapter cmd = new SqlDataAdapter(m);
            DataTable dt = new DataTable();
            cmd.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                conn.Close();
                Session["Username"] = Username.Text;
                Response.Redirect("Dashboard.aspx");
            }
            else
            {
                ErrorLbl.Visible = true;
                ErrorLbl.Text = "Incorrect Details, Kindly Retry";
                conn.Close();


            }
        }
    }
}
        
    
//}