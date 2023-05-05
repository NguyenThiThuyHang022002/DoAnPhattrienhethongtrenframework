using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TanVietMy.Admin
{
    public partial class DangNhapAd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string userName = User.Text.Trim();
            string password = Password.Text.Trim();
            if (userName.ToLower() == "admin" && password == "admin123")
            {
                Response.Redirect("SanPhamAdmin.aspx");
            }
            else
            {
                // Xuất cảnh báo
                Response.Write("<script>alert('Tài khoản hoặc mật khẩu không đúng.');</script>");
            }
        }
    }
}