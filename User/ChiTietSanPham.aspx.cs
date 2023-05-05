using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace TanVietMy.User
{
    public partial class ChiTietSanPham : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string masp = "";
            if (Request.QueryString["MaSP"] != null)
                masp = Request.QueryString["MaSP"];
            Session["MaSP"] = masp;
            LoadSP(masp);
        }

        protected void LoadSP(string masp)
        {
            string conStr = WebConfigurationManager.ConnectionStrings["BHNT"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            SqlDataAdapter adapt = new SqlDataAdapter("SELECT SP.MaSP, SP.TenSP, SP.Gia, DM.TenDanhMuc, SP.HinhAnh, SP.MoTa " +
                                                      "FROM SanPham SP JOIN DanhMucSanPham DM ON SP.MaDanhMuc=DM.MaDanhMuc WHERE SP.MaSP=" + "'" + masp + "'", con);
            DataTable dt = new DataTable();
            adapt.Fill(dt);
            if (dt.Rows.Count == 0)
                return;
            lblTenSP.Text = dt.Rows[0]["TenSP"].ToString();
            lblDanhMuc.Text = dt.Rows[0]["TenDanhMuc"].ToString();
            lblDG.Text = string.Format("{0:0,000} vnđ", dt.Rows[0]["Gia"]);
            lblMota.Text = dt.Rows[0]["MoTa"].ToString();
            imgHinh.Src = dt.Rows[0]["HinhAnh"].ToString();
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

        protected void btnThemGH_Click(object sender, EventArgs e)
        {
            DataTable dtSP = (DataTable)ViewState["SanPham"];
            DataTable dtGH;
            int Soluong = 0;
            if (Session["GioHang"] == null)
            {
                dtGH = new DataTable();
                dtGH.Columns.Add("MaSP");
                dtGH.Columns.Add("TenSP");
                dtGH.Columns.Add("Gia");
                dtGH.Columns.Add("SoLuong");
                dtGH.Columns.Add("ThanhTien");
            }
            else
                dtGH = (DataTable)Session["GioHang"];
            string masp = (string)Session["MaSP"];
            int pos = TimSP(masp, dtGH);
            if (pos != -1)
            {
                Soluong = Convert.ToInt32(dtGH.Rows[pos]["SoLuong"]) + int.Parse(inputSoLuong.Text);
                dtGH.Rows[pos]["SoLuong"] = Soluong;
                dtGH.Rows[pos]["ThanhTien"] = Convert.ToDouble(dtSP.Rows[0]["Gia"]) * Soluong;
            }
            else
            {
                Soluong = int.Parse(inputSoLuong.Text);
                DataRow dr = dtGH.NewRow();
                dr["MaSP"] = dtSP.Rows[0]["MaSP"];
                dr["TenSP"] = dtSP.Rows[0]["TenSP"];
                dr["Gia"] = dtSP.Rows[0]["Gia"];
                dr["SoLuong"] = int.Parse(inputSoLuong.Text);
                dr["ThanhTien"] = Convert.ToDouble(dtSP.Rows[0]["Gia"]) * Soluong;


                dtGH.Rows.Add(dr);
            }

            Session["GioHang"] = dtGH;
            Response.Redirect("GioHang.aspx");
        }
    }
}