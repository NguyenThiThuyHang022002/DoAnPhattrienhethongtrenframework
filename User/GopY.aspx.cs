using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TanVietMy.User
{
    public partial class GopY : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnGopY_Click(object sender, EventArgs e)
        {
            string conStr = WebConfigurationManager.ConnectionStrings["BHNT"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            SqlDataAdapter adapt = new SqlDataAdapter();
            adapt.SelectCommand = new SqlCommand("SELECT * FROM GopY", con);
            DataTable dt = new DataTable();
            adapt.Fill(dt);

            adapt.InsertCommand = new SqlCommand("INSERT INTO GopY VALUES (@TenKH, @SDT, @Email, @LoaiGY, @NoiDung)", con);
            adapt.InsertCommand.Parameters.AddWithValue("@TenKH", inputTenKH.Text);
            adapt.InsertCommand.Parameters.AddWithValue("@SDT", inputSDT.Text);
            adapt.InsertCommand.Parameters.AddWithValue("@Email", inputEmail.Text);
            adapt.InsertCommand.Parameters.AddWithValue("@LoaiGY", inputLoai.SelectedItem.Text);
            adapt.InsertCommand.Parameters.AddWithValue("@NoiDung", TextArea1.Value);
            DataRow row = dt.NewRow();
            row["TenKH"] = "@TenKH";
            row["SDT"] = "@SDT";
            row["Email"] = "@Email";
            row["LoaiGY"] = inputLoai.SelectedItem.Text;
            row["NoiDung"] = "@NoiDung";
            dt.Rows.Add(row);
            adapt.Update(dt);
        }
    }
}