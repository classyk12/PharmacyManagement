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
    public partial class WebForm6 : System.Web.UI.Page
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
                SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM CustomersList", conn);
                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    ViewState["Paging"] = dt;
                    CustomersGridView.DataSource = dt;
                    CustomersGridView.DataBind();
                    ViewState["dirState"] = dt;
                    ViewState["sortdr"] = "Asc";



                }

                if (dt.Rows.Count <= 0)
                {
                    
                    CustomersGridView.DataBind();
                    SuccessLbl.Text = " ";
                    ErrorLbl.Text = "No Records Found....!!";
                    
                }

                conn.Close();
            }
        }




   

        protected void CustomersGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["PharmacyConnectionString"].ConnectionString);
            conn.Open();
            string query = "DELETE FROM CustomersList WHERE ID=@ID";
            SqlCommand command = new SqlCommand(query, conn);

            command.Parameters.AddWithValue("@ID", Convert.ToInt32(CustomersGridView.DataKeys[e.RowIndex].Value.ToString()));

            command.ExecuteNonQuery();
            //CustomersGridView.EditIndex = -1;




            SuccessLbl.Text = "Record Deleted Successfully.....!!!";
            ErrorLbl.Text = "";
            PopulateGridView();
        }

        //protected void CustomersGridView_Sorting(object sender, GridViewSortEventArgs e)
        //{
        //    //DataTable dt = (DataTable)ViewState["dirState"];
        //    //if (dt.Rows.Count > 0)
        //    //{
        //    //    if (Convert.ToString(ViewState["sortdr"]) == "Asc")
        //    //    {
        //    //        dt.DefaultView.Sort = e.SortExpression;
        //    //        ViewState["sortdr"] = "Desc";

        //    //    }
        //    //    else
        //    //    {
        //    //        dt.DefaultView.Sort = e.SortExpression;
        //    //        ViewState["sortdr"] = "Asc";
        //    //    }
        //    //    CustomersGridView.DataSource = dt;
        //    //    CustomersGridView.DataBind();
        //    //}


        //}


        protected void CustomersGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            CustomersGridView.PageIndex = e.NewPageIndex;
            CustomersGridView.DataSource = ViewState["Paging"];
            CustomersGridView.DataBind();

        }

        protected void AddCustomerSubmitButton_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["PharmacyConnectionString"].ConnectionString);
            conn.Open();
            {

                if (CustomerNameTextBox.Text == "" || CustomerPhoneTextBox.Text == "" || CustomerAddressTextBox.Text == "")
                {
                    EmptyLbl.Text = "Fields cannot be empty";
                }

                else
                {
                    DataTable dt = new DataTable();
                    SqlCommand adapter = new SqlCommand("Insert into CustomersList (Name,Phone,Address) values (@Name,@Phone,@Address)", conn);

                    adapter.Parameters.AddWithValue("@Name", CustomerNameTextBox.Text);
                    adapter.Parameters.AddWithValue("@Phone", CustomerPhoneTextBox.Text);
                    adapter.Parameters.AddWithValue("@Address", CustomerAddressTextBox.Text);


                    adapter.ExecuteNonQuery();
                  
                    conn.Close();
                    PopulateGridView();
                    SuccessLbl.Text = "Record added successfully...!!!";
                    CustomerAddressTextBox.Text = "";
                    CustomerNameTextBox.Text = "";
                    CustomerPhoneTextBox.Text = "";
                    ErrorLbl.Text = " ";
                }


            }
        }

        protected void CustomersearchTextBox_TextChanged(object sender, EventArgs e)
        {
            if (CustomersearchTextBox.Text == "")
            {
                PopulateGridView();
            }
            else
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["PharmacyConnectionString"].ConnectionString);
                DataTable dt = new DataTable();
                conn.Open();
                SqlCommand command = new SqlCommand("searchcustomers", conn);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@name", CustomersearchTextBox.Text);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                adapter.Fill(dt);
             CustomersGridView.DataSource = dt;
              CustomersGridView.DataBind();
            }
        }
    }
}
       