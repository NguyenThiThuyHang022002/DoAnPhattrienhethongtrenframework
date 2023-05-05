using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace TanVietMy.Admin
{
    public partial class ThemSP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void BtnThem_Click(object sender, EventArgs e)
        {
            string conStr = WebConfigurationManager.ConnectionStrings["BHNT"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            SqlDataAdapter adapt = new SqlDataAdapter();
            adapt.SelectCommand = new SqlCommand("SELECT * FROM SanPham", con);
            DataTable dt = new DataTable();
            adapt.Fill(dt);
            string strFileUpload = "";

            if (inputHinhAnh.HasFile)
            {
                strFileUpload = "~/Images/" + inputHinhAnh.FileName;
                string path = MapPath("/Images/") + inputHinhAnh.FileName;
                inputHinhAnh.PostedFile.SaveAs(path);
            }
            adapt.InsertCommand = new SqlCommand("INSERT INTO SanPham VALUES (@TenSP, @TenDG, @SoLuong, @DanhMuc, @HinhAnh, @MoTa)", con);
            adapt.InsertCommand.Parameters.AddWithValue("@TenSP", inputTenSP.Text);
            adapt.InsertCommand.Parameters.AddWithValue("@TenDG", inputDG.Text);
            adapt.InsertCommand.Parameters.AddWithValue("@SoLuong", inputSoLuong.Text);
            adapt.InsertCommand.Parameters.AddWithValue("@DanhMuc", inputDanhMuc.SelectedValue);
            adapt.InsertCommand.Parameters.AddWithValue("@MoTa", inputMoTa.Text);
            adapt.InsertCommand.Parameters.AddWithValue("@HinhAnh", strFileUpload);
            DataRow row = dt.NewRow();
            row["TenSP"] = "@TenSP";
            row["Gia"] = Convert.ToDouble(inputDG.Text);
            row["SoLuong"] = Convert.ToInt32(inputSoLuong.Text);
            row["MaDanhMuc"] = Convert.ToInt32(inputDanhMuc.SelectedValue);
            row["MoTa"] = "@MoTa";
            row["HinhAnh"] = "@HinhAnh";
            dt.Rows.Add(row);
            adapt.Update(dt);

        }
    }
}
