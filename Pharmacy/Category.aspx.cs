using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Pharmacy
{
    public partial class WebForm3 : System.Web.UI.Page
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
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["PharmacyConnectionString"].ConnectionString);
            DataTable dt = new DataTable();
            conn.Open();
            SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM CategoryList", conn);
            adapter.Fill(dt);
            
            if (dt.Rows.Count >0)
            {
                ViewState["Paging"] = dt;
                CategoryGridView.DataSource = dt;
                CategoryGridView.DataBind();
                CategoryTextBox.Text = "";
                ViewState["dirState"] = dt;
                ViewState["sortdr"] = "Asc";

            }

            else
            {
          
                CategoryGridView.DataSource = dt;
                CategoryGridView.DataBind();
              
                LblSuccess.Text = "";
                LblError.Text = "No record found.....!!!!";
            }


        }
        protected void Categorybutton_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["PharmacyConnectionString"].ConnectionString);
            conn.Open();
            {
                if(CategoryTextBox.Text=="")
                {
                    Errorlbl.Text = "Field required";
                }
                else
                {
                    SqlCommand command = new SqlCommand("INSERT INTO CategoryList values (@Name)", conn);
                    command.Parameters.AddWithValue("@Name", CategoryTextBox.Text);
                    command.ExecuteNonQuery();
                    PopulateGridView();
                    LblSuccess.Text = "Record added successfully....!";
                    LblError.Text = "";
                }
            

            }
        }

        protected void CategoryGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            CategoryGridView.EditIndex = e.NewEditIndex;
            PopulateGridView();
        }

        protected void CategoryGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            CategoryGridView.EditIndex = -1;
            PopulateGridView();
        }

        protected void CategoryGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["PharmacyConnectionString"].ConnectionString);
            conn.Open();
            
                SqlCommand command = new SqlCommand("Update CategoryList SET Name=@Name WHERE ID=@ID",conn);
                command.Parameters.AddWithValue("@Name", (CategoryGridView.Rows[e.RowIndex].FindControl("CategoryTextBox") as TextBox).Text.Trim());
                //command.Parameters.AddWithValue("@ID", (BrandGridView.Rows[e.RowIndex].FindControl("IDTextBox") as TextBox).Text.Trim());
                command.Parameters.AddWithValue("@ID", Convert.ToInt32(CategoryGridView.DataKeys[e.RowIndex].Value.ToString()));
                command.ExecuteNonQuery();
                CategoryGridView.EditIndex = -1;
                PopulateGridView();
                LblSuccess.Text = "Record Updated Successfully....!!!";
            LblError.Text = "";
            }

        protected void CategoryGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["PharmacyConnectionString"].ConnectionString);
            conn.Open();

            SqlCommand command = new SqlCommand("DELETE FROM CategoryList WHERE ID=@ID", conn);
           
            command.Parameters.AddWithValue("@ID", Convert.ToInt32(CategoryGridView.DataKeys[e.RowIndex].Value.ToString()));
            command.ExecuteNonQuery();
            PopulateGridView();
            LblSuccess.Text = "Record Deleted Successfully....!!!";
            LblError.Text = "";
            if(CategoryGridView.Rows.Count<=0)
            {
                LblError.Text="No record found...!!!";
                LblSuccess.Text = "";
                CategoryTextBox.Text = "";
            }
        }

        protected void CategoryGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            CategoryGridView.PageIndex = e.NewPageIndex;
            CategoryGridView.DataSource = ViewState["Paging"];
            CategoryGridView.DataBind();
                }

        protected void CategoryGridView_Sorting(object sender, GridViewSortEventArgs e)
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
                    CategoryGridView.DataSource = dt;
                    CategoryGridView.DataBind();
            }

           
        }
    }
    }
