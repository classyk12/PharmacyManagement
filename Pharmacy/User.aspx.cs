using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Pharmacy
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateGridView();
            }


        }


        public void PopulateGridView()
        {
            DataTable dt = new DataTable();
            //using (SqlConnection conn = new SqlConnection(ConnectionString))

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["PharmacyConnectionString"].ConnectionString);
            {
                conn.Open();
                SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM UsersList", conn);
                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    ViewState["Paging"] = dt;
                    //MedicineGridView.DataSource = null;
                    UsersGridView.DataSource = dt;
                    UsersGridView.DataBind();
                    ViewState["dirState"] = dt;
                    ViewState["sortdr"] = "Asc";



                }

                if (dt.Rows.Count <= 0)
                {

                    //ErrorLbl.Text = "No Records Found....!!";
                    //successLbl.Visible = false;
                    UsersGridView.DataBind();
                    ErrorLbl.Text = "No Records Found....!!";
                }

                conn.Close();
            }
        }


        protected void UsersGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["PharmacyConnectionString"].ConnectionString);


            if (UsersGridView.Rows.Count <= 0)
            {
                ErrorLbl.Text = "No records found....!!!";
                SuccessLbl.Text = "";
            }
            else
            {
                conn.Open();
                string query = "DELETE FROM UsersList WHERE ID=@ID";
                SqlCommand command = new SqlCommand(query, conn);

                command.Parameters.AddWithValue("@ID", Convert.ToInt32(UsersGridView.DataKeys[e.RowIndex].Value.ToString()));

                command.ExecuteNonQuery();
                UsersGridView.EditIndex = -1;




                SuccessLbl.Text = "Record Deleted Successfully.....!!!";

                PopulateGridView();
            }
        }

        protected void UsersGridView_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dt = (DataTable)ViewState["dirState"];
            if (dt.Rows.Count > 0)
            {
                if (Convert.ToString(ViewState["sortdr"]) == "Asc")
                {
                    dt.DefaultView.Sort = e.SortExpression;
                    ViewState["sortdr"] = "Desc";

                }
                else
                {
                    dt.DefaultView.Sort = e.SortExpression;
                    ViewState["sortdr"] = "Asc";
                }
                UsersGridView.DataSource = dt;
                UsersGridView.DataBind();
            }


        }


        protected void UsersGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            UsersGridView.PageIndex = e.NewPageIndex;
            UsersGridView.DataSource = ViewState["Paging"];
            UsersGridView.DataBind();

        }

        protected void AddUserButton_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["PharmacyConnectionString"].ConnectionString);
            conn.Open();
            {

                if (AddUserEmailTextBox.Text == "" || AddUserPhoneTextBox.Text == "" || AddUserTextBox.Text == "" || PasswordReg1.Text == "" || PasswordReg2.Text == "" || PasswordReg1.Text != PasswordReg2.Text)
                {
                    EmptyLbl.Text = "Fields cannot be empty or password does not match";
                }

                else
                {
                    DataTable dt = new DataTable();
                    SqlCommand adapter = new SqlCommand("Insert into UsersList (Username,Email,Password, Confirm_Password,Phone,Role) values (@Username,@Email,@Password," +
                        "@Confirm_Password,@Phone,@Role)", conn);

                    adapter.Parameters.AddWithValue("@Username", AddUserTextBox.Text);
                    adapter.Parameters.AddWithValue("@Email", AddUserEmailTextBox.Text);
                    adapter.Parameters.AddWithValue("@Password", PasswordReg1.Text);
                    adapter.Parameters.AddWithValue("@Confirm_Password", PasswordReg2.Text);
                    adapter.Parameters.AddWithValue("@Phone", AddUserPhoneTextBox.Text);
                    adapter.Parameters.AddWithValue("@Role", RoleDropDownList.SelectedItem.Value);


                    adapter.ExecuteNonQuery();
                    PopulateGridView();
                    SuccessLbl.Text = "Record added successfully....!!!";
                    conn.Close();

                    AddUserEmailTextBox.Text = "";
                    AddUserPhoneTextBox.Text = "";
                    AddUserTextBox.Text = "";
                    PasswordReg1.Text = "";
                    PasswordReg2.Text = "";
                    ErrorLbl.Text = "";

                }


            }
        }

        protected void UsersearchTextBox_TextChanged(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["PharmacyConnectionString"].ConnectionString);
            conn.Open();
            {
                if (UsersearchTextBox.Text == " ")
                {
                    PopulateGridView();

                }
                else
                {
                    SqlCommand command = new SqlCommand("searchusers", conn);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@name", UsersearchTextBox.Text);
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    adapter.Fill(dt);
                    UsersGridView.DataSource = dt;
                    UsersGridView.DataBind();
                }


            }
        }
    }
}
        