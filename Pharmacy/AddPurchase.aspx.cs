using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace Pharmacy
{
    public partial class WebForm13 : System.Web.UI.Page
    {
        DataTable dt = new DataTable();

        double total = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DateTextBox.Enabled = false;
                DateTextBox.Text = DateTime.Now.ToShortDateString();
            }
        }


        protected void DiscountCheckBox_CheckedChanged(object sender, EventArgs e)
        {
            if (DiscountCheckBox.Checked == true)
            {
                DiscountTextBox.Enabled = true;
                SetFocus(DiscountTextBox);
            }
            else
            {
                DiscountTextBox.Enabled = false;
                TotalResultTxtBox.Text = "";
                DiscountTextBox.Text = "";

            }
        }

        protected void QuantityTextBox_TextChanged(object sender, EventArgs e)
        {
            TotalResultTxtBox1.Text = Convert.ToString(Convert.ToInt32(QuantityTextBox.Text) * Convert.ToInt32(PurchasePriceTextBox.Text));


        }


        protected void PurchasePriceTextBox_TextChanged(object sender, EventArgs e)
        {

            TotalResultTxtBox1.Text = Convert.ToString(Convert.ToInt32(QuantityTextBox.Text) * Convert.ToInt32(PurchasePriceTextBox.Text));

        }

        protected void DiscountTextBox_TextChanged(object sender, EventArgs e)
        {
            double discount;
            discount = (Convert.ToDouble(DiscountTextBox.Text) / 100 * Convert.ToDouble(TotalLbl.Text));
            TotalResultTxtBox.Text = Convert.ToString(Convert.ToDouble(TotalLbl.Text) - Convert.ToDouble(discount));
        }

        protected void AddPurchase1_Click(object sender, EventArgs e)
        {
            if (PurchasePriceTextBox.Text == "" || QuantityTextBox.Text == "" || TotalResultTxtBox1.Text == "")
            {
                ErrorLbl.Text = "Fields cannot be empty";
            }
            else
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("SupplierName");
                dt.Columns.Add("MedicineName");
                dt.Columns.Add("Price");
                dt.Columns.Add("Quantity");
                dt.Columns.Add("Amount");

                for (int row = 0; row < DetailsGridView.Rows.Count; row++)
                {
                    DataRow dr = dt.NewRow();
                    dr[0] = DetailsGridView.Rows[row].Cells[0].Text;
                    dr[1] = DetailsGridView.Rows[row].Cells[1].Text;
                    dr[2] = DetailsGridView.Rows[row].Cells[2].Text;
                    dr[3] = DetailsGridView.Rows[row].Cells[3].Text;
                    dr[4] = DetailsGridView.Rows[row].Cells[4].Text;                 
                    dt.Rows.Add(dr);
                }
                dt.Rows.Add(SupplierDDL.SelectedItem.Value, MedicineNameDDL.SelectedItem.Value, QuantityTextBox.Text, PurchasePriceTextBox.Text, TotalResultTxtBox1.Text);
                ViewState["dt"] = dt;
                DetailsGridView.DataSource = ViewState["dt"] as DataTable;
                DetailsGridView.DataBind();

                PurchasePriceTextBox.Text = ""; QuantityTextBox.Text = ""; TotalResultTxtBox1.Text = "";

            }



        }


        protected void DetailsGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                total += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "Amount"));
                TotalLbl.Text = Convert.ToString(total);
            }




        }


        protected void DetailsGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = Convert.ToInt32(e.RowIndex);
            DataTable dt = ViewState["dt"] as DataTable;
            dt.Rows[index].Delete();
            ViewState["dt"] = dt;
            DetailsGridView.DataSource = ViewState["dt"] = dt;
            DetailsGridView.DataBind();



        }



        protected void SavePurchaseButton_Click(object sender, EventArgs e)
        {
           
            for (int i = 0; i < DetailsGridView.Rows.Count; i++)
            {
                SqlConnection conn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["PharmacyConnectionString"].ConnectionString);
                conn1.Open();
                SqlCommand command1 = new SqlCommand("insert into ProductList(SupplierName,MedicineName,Price,Quantity,Amount) values (@SupplierName,@MedicineName,@Price,@Quantity,@Amount)", conn1);
              
                command1.Parameters.AddWithValue("@SupplierName", DetailsGridView.Rows[i].Cells[0].Text);
                command1.Parameters.AddWithValue("@MedicineName", DetailsGridView.Rows[i].Cells[1].Text);
                command1.Parameters.AddWithValue("@Price", DetailsGridView.Rows[i].Cells[2].Text);
                command1.Parameters.AddWithValue("@Quantity", DetailsGridView.Rows[i].Cells[3].Text);
                command1.Parameters.AddWithValue("@Amount", DetailsGridView.Rows[i].Cells[4].Text);           
                command1.ExecuteNonQuery();
                conn1.Close();
            }
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["PharmacyConnectionString"].ConnectionString);
            SqlCommand command = new SqlCommand("insertpurchases", conn);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@GrandTotal", TotalResultTxtBox.Text);
                command.Parameters.AddWithValue("@Status", StatusDDL.SelectedValue);
                command.Parameters.AddWithValue("@Method", MethodDDL.SelectedValue);
                command.Parameters.AddWithValue("@Date", DateTextBox.Text);
                command.Parameters.AddWithValue("@Discount", DiscountTextBox.Text);
                conn.Open();
                command.ExecuteNonQuery();
                conn.Close();
            Response.Redirect("Purchases.aspx");
        }
    }
}

//}

