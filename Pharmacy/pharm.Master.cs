﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



namespace Pharmacy
{
    public partial class pharm : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
         
        }

        protected void Logoutbutton_Click(object sender, EventArgs e)
        {
        
            Session.Abandon();
            Session.Clear();
            Response.Redirect("Index.aspx");
          
        }
    }
}