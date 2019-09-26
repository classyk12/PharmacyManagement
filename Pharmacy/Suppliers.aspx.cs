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
    public partial class WebForm7 : System.Web.UI.Page
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
                SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM SuppliersList", conn);
                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    ViewState["Paging"] = dt;
                    //MedicineGridView.DataSource = null;
                    SuppliersGridView.DataSource = dt;
                    SuppliersGridView.DataBind();
                    ViewState["dirState"] = dt;
                    ViewState["sortdr"] = "Asc";



                }

                if (dt.Rows.Count <= 0)
                {

                    //ErrorLbl.Text = "No Records Found....!!";
                    //successLbl.Visible = false;
                    SuppliersGridView.DataBind();
                    ErrorLbl.Text = "No Records Found....!!";
                }

                conn.Close();
            }
        }



        protected void SuppliersGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["PharmacyConnectionString"].ConnectionString);
            conn.Open();
            string query = "DELETE FROM SuppliersList WHERE ID=@ID";
            SqlCommand command = new SqlCommand(query, conn);

            command.Parameters.AddWithValue("@ID", Convert.ToInt32(SuppliersGridView.DataKeys[e.RowIndex].Value.ToString()));

            command.ExecuteNonQuery();
            SuppliersGridView.EditIndex = -1;




            successLbl.Text = "Record Deleted Successfully.....!!!";

            PopulateGridView();
            ErrorLbl.Text = "";
            if (SuppliersGridView.Rows.Count <= 0)
            {
                ErrorLbl.Text = "No records found....!!!";
                successLbl.Text = "";
            }
        }

        protected void SuppliersGridView_Sorting(object sender, GridViewSortEventArgs e)
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
                SuppliersGridView.DataSource = dt;
                SuppliersGridView.DataBind();
            }


        }


        protected void SuppliersGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            SuppliersGridView.PageIndex = e.NewPageIndex;
            SuppliersGridView.DataSource = ViewState["Paging"];
            SuppliersGridView.DataBind();

        }

        protected void SupplierAddBtn_Click(object sender, EventArgs e)
        {
            SetFocus(SupplierNameTextBox);
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["PharmacyConnectionString"].ConnectionString);
            conn.Open();
            {

                if (SupplierNameTextBox.Text == "" || SupplierAddressTextBox.Text == "" || SupplierPhoneTextBox.Text == "")
                {
                   EmptyLbl.Text = "Fields cannot be empty";
                }

                else
                {
                    DataTable dt = new DataTable();
                    SqlCommand adapter = new SqlCommand("Insert into SuppliersList (Name,Phone,Address) values (@Name,@Phone,@Address)", conn);

                    adapter.Parameters.AddWithValue("@Name", SupplierNameTextBox.Text);
                    adapter.Parameters.AddWithValue("@Phone", SupplierPhoneTextBox.Text);
                    adapter.Parameters.AddWithValue("@Address", SupplierAddressTextBox.Text);


                    adapter.ExecuteNonQuery();
                   
                    conn.Close();
                    PopulateGridView();
                    successLbl.Text = "Record added successfully...!!!";
                    SupplierAddressTextBox.Text = "";
                    SupplierNameTextBox.Text = "";
                    SupplierPhoneTextBox.Text = "";
                    ErrorLbl.Text = "";
                }


            }
        }

        protected void SuppliersearchTextBox_TextChanged(object sender, EventArgs e)
        {
            if (SuppliersearchTextBox.Text == "")
            {
                PopulateGridView();
            }
            else
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["PharmacyConnectionString"].ConnectionString);
                DataTable dt = new DataTable();
                conn.Open();
                SqlCommand command = new SqlCommand("searchsuppliers", conn);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@name", SuppliersearchTextBox.Text);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                adapter.Fill(dt);
               SuppliersGridView.DataSource = dt;
               SuppliersGridView.DataBind();
            }
        }
    }
}
        