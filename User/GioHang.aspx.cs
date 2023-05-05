using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TanVietMy.User
{
    public partial class GioHang : System.Web.UI.Page
    {
        DataTable dt = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadData();
        }

        protected void LoadData()
        {
            dt = (DataTable)Session["GioHang"];
            gvgiohang.DataSource = dt;
            gvgiohang.DataBind();
            {
                double TongThanhTien = TinhTongTien(dt);
                Session["ThanhTien"] = TongThanhTien;
                lblThanhTien.Text = String.Format("{0:0,000}", TongThanhTien) + " vnđ";
                double Tongsl = TinhTongSoLuong(dt);
                Session["SoLuong"] = Tongsl;
                lblSoLuong.Text = Tongsl.ToString();
            }
        }

        protected void gvgiohang_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            dt = (DataTable)Session["GioHang"];
            GridViewRow row = gvgiohang.Rows[e.RowIndex];
            dt.Rows[row.DataItemIndex].Delete();
            gvgiohang.EditIndex = -1;
            Session["GioHang"] = dt;
            LoadData();
        }

        protected void gvgiohang_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvgiohang.EditIndex = e.NewEditIndex;
            LoadData();
        }

        protected void gvgiohang_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            dt = (DataTable)Session["GioHang"];
            GridViewRow row = gvgiohang.Rows[e.RowIndex];
            TextBox txtSoluong = (TextBox)(row.Cells[2].Controls[0]);
            int Soluong = Convert.ToInt32(txtSoluong.Text);
            dt.Rows[row.DataItemIndex]["SoLuong"] = txtSoluong.Text;
            dt.Rows[row.DataItemIndex]["ThanhTien"] = Convert.ToDouble(dt.Rows[row.DataItemIndex]["Gia"]) * Soluong;
            //Reset the edit index.
            gvgiohang.EditIndex = -1;
            Session["GioHang"] = dt;
            LoadData();
        }

        protected void gvgiohang_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvgiohang.EditIndex = -1;
            LoadData();
        }
        protected double TinhTongTien(DataTable dt)
        {
            if (dt == null)
                return 0;
            double sum = 0;
            foreach (DataRow row in dt.Rows)
                sum += Convert.ToDouble(row["ThanhTien"]);
            return sum;
        }
        protected double TinhTongSoLuong(DataTable dt)
        {
            if (dt == null)
                return 0;
            double sum = 0;
            foreach (DataRow row in dt.Rows)
                sum += Convert.ToDouble(row["SoLuong"]);
            return sum;
        }
        protected void btnDatHang_Click(object sender, EventArgs e)
        {
            if (Session["TenKH"] != null)
            {
                dt = (DataTable)Session["GioHang"];
                Response.Redirect("~/User/DonHang.aspx");
            }
            else
            {
                Response.Write("<script>alert('Vui lòng đăng nhập');</script>");
                Response.Redirect("~/User/DangNhap.aspx");
                dt = (DataTable)Session["GioHang"];
            }
        }

    }
}