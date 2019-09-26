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
    public partial class WebForm12 : System.Web.UI.Page
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
                SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM PurchaseList", conn);
                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    ViewState["Paging"] = dt;
                    //MedicineGridView.DataSource = null;
                    PurchaseGridView.DataSource = dt;
                    PurchaseGridView.DataBind();
                    ViewState["dirState"] = dt;
                    ViewState["sortdr"] = "Asc";



                }
                else
                {
                    PurchaseGridView.DataSource = dt;
                    PurchaseGridView.DataBind();
               
                }

                conn.Close();
            }
        }

     

        protected void PurchaseGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            SqlConnection conn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["PharmacyConnectionString"].ConnectionString);
            conn1.Open();
            SqlCommand command1 = new SqlCommand("delete from PurchaseList  where PurchaseID= @PurchaseID", conn1);
            command1.Parameters.AddWithValue("@PurchaseID", Convert.ToInt32(PurchaseGridView.DataKeys[e.RowIndex].Value.ToString()));
            command1.ExecuteNonQuery();
            PopulateGridView();
            successLbl.Text = "Record Deleted Successfully.....!!!";

            if (PurchaseGridView.Rows.Count <= 0)
            {
                PopulateGridView();
                successLbl.Text = "";

            }
            conn1.Close();
        }

        protected void PurchaseGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            PurchaseGridView.PageIndex = e.NewPageIndex;
            PurchaseGridView.DataSource = ViewState["Paging"];
            PurchaseGridView.DataBind();
        }
    }
}