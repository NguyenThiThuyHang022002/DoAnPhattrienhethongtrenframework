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
    public partial class DangKi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDangKy_Click(object sender, EventArgs e)
        {
            string conStr = WebConfigurationManager.ConnectionStrings["BHNT"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            SqlDataAdapter adapt = new SqlDataAdapter();
            adapt.SelectCommand = new SqlCommand("SELECT * FROM KhachHang", con);
            DataTable dt = new DataTable();
            adapt.Fill(dt);
            
            adapt.InsertCommand = new SqlCommand("INSERT INTO KhachHang (TenKH, DiaChi, Email, SDT, MatKhau) VALUES (@TenKH, @DiaChi, @Email, @SDT, @MatKhau)", con);
            adapt.InsertCommand.Parameters.AddWithValue("@TenKH", inputName.Text);
            adapt.InsertCommand.Parameters.AddWithValue("@DiaChi", "");
            adapt.InsertCommand.Parameters.AddWithValue("@Email", inputEmail.Text);
            adapt.InsertCommand.Parameters.AddWithValue("@SDT", inputTel.Text);
            adapt.InsertCommand.Parameters.AddWithValue("@MatKhau", inputPass.Text);
            DataRow row = dt.NewRow();
            row["TenKH"] = inputName.Text;
            row["DiaChi"] = "";
            row["Email"] = inputEmail.Text;
            row["SDT"] = inputTel.Text;
            row["MatKhau"] = inputPass.Text;
            dt.Rows.Add(row);
            adapt.Update(dt);

            Response.Redirect("DangNhap.aspx");
        }
    }
}