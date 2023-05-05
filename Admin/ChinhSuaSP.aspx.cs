using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TanVietMy.Admin
{
    public partial class ChinhSuaSP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string masp = "";
                if (Request.QueryString["MaSP"] != null)
                    masp = Request.QueryString["MaSP"];
                Session["MaSP"] = masp;
                LoadSP(masp);
            }
        }

        protected void LoadSP(string masp)
        {
            string conStr = WebConfigurationManager.ConnectionStrings["BHNT"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            SqlDataAdapter adapt = new SqlDataAdapter("SELECT TenSP, Gia, SoLuong, MaDanhMuc, MoTa, HinhAnh " +
                                                      "FROM SanPham  WHERE MaSP=" + "'" + masp + "'", con);
            DataTable dt = new DataTable();
            adapt.Fill(dt);
            if (dt.Rows.Count == 0)
                return;
            updateTenSP.Text = dt.Rows[0]["TenSP"].ToString();
            updateDG.Text = dt.Rows[0]["Gia"].ToString();
            updateSoLuong.Text = dt.Rows[0]["SoLuong"].ToString();
            updateMoTa.Text = dt.Rows[0]["Mota"].ToString();
            updateDanhMuc.SelectedValue = dt.Rows[0]["MaDanhMuc"].ToString();
            preview.ImageUrl = dt.Rows[0]["HinhAnh"].ToString();

            ViewState["SanPham"] = dt;
        }
        public static int TimSP(string masp, DataTable dt)
        {
            int pos = -1;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i]["MaSP"].ToString().ToLower() == masp.ToLower())
                {
                    pos = i;
                    break;
                }
            }
            return pos;
        }

        protected void BtnCapnhat_Click(object sender, EventArgs e)
        {
            string currentImagePath = "";
            string masp = "";
            if (Request.QueryString["MaSP"] != null)
                masp = Request.QueryString["MaSP"];
            Session["MaSP"] = masp;
            string conStr = WebConfigurationManager.ConnectionStrings["BHNT"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            SqlDataAdapter adapt = new SqlDataAdapter();
            string strFileUpload = "";
            if (updateHinhAnh.HasFile)
            {
                strFileUpload = "~/Images/" + updateHinhAnh.FileName;
                string path = MapPath("/Images/") + updateHinhAnh.FileName;
                updateHinhAnh.PostedFile.SaveAs(path);

                adapt.SelectCommand = new SqlCommand("UPDATE SanPham SET TenSP = '" + updateTenSP.Text + "', Gia = '" + Convert.ToDouble(updateDG.Text) + "', HinhAnh ='" + strFileUpload + "', MoTa = '" + updateMoTa.Text + "', MaDanhMuc = '" + updateDanhMuc.SelectedValue + "', SoLuong = '" + Convert.ToInt32(updateSoLuong.Text) + "' WHERE MaSP ='" + masp + "';", con);
            }
            else
            {
                DataTable dti = (DataTable)ViewState["SanPham"];
                currentImagePath = dti.Rows[0]["HinhAnh"].ToString();
                adapt.SelectCommand = new SqlCommand("UPDATE SanPham SET TenSP = '" + updateTenSP.Text + "', Gia = '" + Convert.ToDouble(updateDG.Text) + "', HinhAnh ='" + currentImagePath + "', MoTa = '" + updateMoTa.Text + "', MaDanhMuc = '" + updateDanhMuc.SelectedValue + "', SoLuong = '" + Convert.ToInt32(updateSoLuong.Text) + "' WHERE MaSP ='" + masp + "';", con);
                
            }
            DataTable dt = new DataTable();
            adapt.Fill(dt);
            adapt.Update(dt);
        }
    }
}