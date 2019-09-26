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
    public partial class WebForm4 : System.Web.UI.Page
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
                SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM MedicineList", conn);
                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    ViewState["Paging"] = dt;
                    //MedicineGridView.DataSource = null;
                    MedicineGridView.DataSource = dt;
                    MedicineGridView.DataBind();
                    ViewState["dirState"] = dt;
                    ViewState["sortdr"] = "Asc";



                }
                else
                {
                    MedicineGridView.DataSource = dt;
                    MedicineGridView.DataBind();
                    ErrorLbl.Text = "No records found...!!!";
                }
             
                conn.Close();
            }
        }

        protected void BrandGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["PharmacyConnectionString"].ConnectionString);
            conn.Open();
            string query = "DELETE FROM MedicineList WHERE ID=@ID";
            SqlCommand command = new SqlCommand(query, conn);
        
            command.Parameters.AddWithValue("@ID", Convert.ToInt32(MedicineGridView.DataKeys[e.RowIndex].Value.ToString()));

            command.ExecuteNonQuery();
            successLbl.Text = "Record Deleted Successfully.....!!!";

            PopulateGridView();
        
            if (MedicineGridView.Rows.Count <= 0)
            {
             
                successLbl.Text = "";
            }
        }

        protected void MedicineGridView_Sorting(object sender, GridViewSortEventArgs e)
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
                MedicineGridView.DataSource = dt;
                MedicineGridView.DataBind();
            }


        }
    

        protected void MedicineGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            MedicineGridView.PageIndex = e.NewPageIndex;
            MedicineGridView.DataSource = ViewState["Paging"];
            MedicineGridView.DataBind();

        }

        protected void itemsearchTextBox_TextChanged(object sender, EventArgs e)
        {
            if(itemsearchTextBox.Text == "")
            {
                PopulateGridView();
            }
            else
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["PharmacyConnectionString"].ConnectionString);
                DataTable dt = new DataTable();
                conn.Open();
                SqlCommand command = new SqlCommand("search2", conn);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@name", itemsearchTextBox.Text);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                adapter.Fill(dt);
                MedicineGridView.DataSource = dt;
                MedicineGridView.DataBind();
            }
        }
    }
}