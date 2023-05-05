using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TanVietMy.User
{
    public partial class DangNhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Remove("MaKH");
            Session.Remove("TenKH");

        }

        protected void btnDangNhap_Click(object sender, EventArgs e)
        {
            string conStr = WebConfigurationManager.ConnectionStrings["BHNT"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            SqlDataAdapter adapt = new SqlDataAdapter();
            adapt.SelectCommand = new SqlCommand("SELECT * FROM KhachHang WHERE (SDT=@username OR Email=@username) AND MatKhau=@password", con);
            adapt.SelectCommand.Parameters.AddWithValue("@username", User.Text);
            adapt.SelectCommand.Parameters.AddWithValue("@password", Password.Text);
            DataTable dt = new DataTable();
            adapt.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                Session["TenKH"] = dt.Rows[0]["TenKH"].ToString();
                int maKH = Convert.ToInt32(dt.Rows[0]["MaKH"]);
                Session["MaKH"] = maKH;
                Response.Redirect("~/User/TrangChu.aspx");
            }
            else
            {
                Response.Write("<script>alert('Tài khoản hoặc mật khẩu không đúng.');</script>");
            }

        }
    }
}
      