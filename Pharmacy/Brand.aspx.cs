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
    public partial class WebForm2 : System.Web.UI.Page

    {
        //DataSet ds = new DataSet();
        string ConnectionString = @"Data Source=CLASSYK\SQLEXPRESS;Integrated security=true;Initial Catalog=Pharmacy";
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
            using (SqlConnection conn = new SqlConnection(ConnectionString))

            //SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["PharmacyConnectionString"].ConnectionString);
            {
                conn.Open();
                SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM BrandList", conn);
                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    ViewState["Paging"] = dt;
                    //BrandGridView.DataSource = null;
                    BrandGridView.DataSource = dt;
                    BrandGridView.DataBind();
                    ViewState["dirState"] = dt;
                    ViewState["sortdr"] = "Asc";

                   

                }
                else
                {
                    BrandGridView.DataSource = dt;
                    BrandGridView.DataBind();
                   
                    ErrorLbl.Text = "No records found...!!!";
                    successLbl.Text = "";
                }
              
                conn.Close();
            }
        }

        protected void Brandbutton_Click(object sender, EventArgs e)
        {

            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["PharmacyConnectionString"].ConnectionString);
                conn.Open();

                {
                    if (BrandTextBox.Text == "")
                    {
                        BrandTextBoxLbl.Text = "Field required";
                    }

                    else
                    {
                        SqlCommand m = new SqlCommand("insert into BrandList values (@Name)", conn);
                        m.Parameters.AddWithValue("@Name", BrandTextBox.Text);

                        m.ExecuteNonQuery();

                        PopulateGridView();
                   
                        successLbl.Text = "Record Added Successfully.....!!";
                        ErrorLbl.Text = "";
                        BrandTextBox.Text = "";
                    }


                }





                conn.Close();
            }

        }

        protected void BrandGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            BrandGridView.EditIndex = e.NewEditIndex;
            PopulateGridView();
        }

        protected void BrandGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            BrandGridView.EditIndex = -1;
            PopulateGridView();
        }

        protected void BrandGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["PharmacyConnectionString"].ConnectionString);
            //using (SqlConnection conn = new SqlConnection(ConnectionString))

            conn.Open();
            //SqlDataAdapter adapter = new SqlDataAdapter("UPDATE BrandList SET Name=@Name WHERE [Brand ", conn);
            string query = "UPDATE BrandList SET Name=@Name WHERE ID=@ID";
            SqlCommand command = new SqlCommand(query, conn);
            command.Parameters.AddWithValue("@Name", (BrandGridView.Rows[e.RowIndex].FindControl("NameTextBox") as TextBox).Text.Trim());
            //command.Parameters.AddWithValue("@ID", (BrandGridView.Rows[e.RowIndex].FindControl("IDTextBox") as TextBox).Text.Trim());
            command.Parameters.AddWithValue("@ID", Convert.ToInt32(BrandGridView.DataKeys[e.RowIndex].Value.ToString()));

            command.ExecuteNonQuery();
            BrandGridView.EditIndex = -1;
            PopulateGridView();
         
            successLbl.Text = "Record Updated Successfully....!!!!";


        }

        protected void BrandGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["PharmacyConnectionString"].ConnectionString);
            conn.Open();
            string query = "DELETE FROM BrandList WHERE ID=@ID";
            SqlCommand command = new SqlCommand(query, conn);
           
            command.Parameters.AddWithValue("@ID", Convert.ToInt32(BrandGridView.DataKeys[e.RowIndex].Value.ToString()));
            command.ExecuteNonQuery();
            PopulateGridView();
            successLbl.Text = "Record Deleted Successfully.....!!!";
            ErrorLbl.Text = "";
            if (BrandGridView.Rows.Count <= 0)
            {
                PopulateGridView();
            }

        }

        protected void BrandGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            BrandGridView.PageIndex = e.NewPageIndex;
            BrandGridView.DataSource = ViewState["Paging"];
            BrandGridView.DataBind();

        }

        protected void BrandGridView_Sorting(object sender, GridViewSortEventArgs e)
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
                BrandGridView.DataSource = dt;
                BrandGridView.DataBind();
            }

           
        }

    }
}


            
    