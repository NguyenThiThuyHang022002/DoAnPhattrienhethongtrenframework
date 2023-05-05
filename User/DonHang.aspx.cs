using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TanVietMy.User
{
    public partial class DonHang : System.Web.UI.Page
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
            gvDonHang.DataSource = dt;
            gvDonHang.DataBind();

            if (dt != null)
            {
                double TongThanhtien = (double)Session["ThanhTien"];
                lblTongThanhTien.Text = String.Format("{0:0,000}", TongThanhtien);
                double Tongsl = (double)Session["SoLuong"];
                lblTongSoLuong.Text = Tongsl.ToString();
            }
        }

        protected void btnDatHang_Click(object sender, EventArgs e)
        {
            double thanhTien = (double)Session["ThanhTien"];
            decimal TongTien = Convert.ToDecimal(thanhTien);
            int maKH = (int)Session["MaKH"];
            DateTime ngayDatHang = DateTime.Now;
            string conStr = WebConfigurationManager.ConnectionStrings["BHNT"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            SqlDataAdapter adapt = new SqlDataAdapter();
            adapt.SelectCommand = new SqlCommand("SELECT * FROM DonDatHang", con);
            DataTable dt = new DataTable();
            adapt.Fill(dt);

            adapt.InsertCommand = new SqlCommand("INSERT INTO DonDatHang VALUES (@MaKH, @SDT, @Email, @DiaChi, @NgayDatHang, @TongTien, @TrangThai)", con);
            adapt.InsertCommand.Parameters.AddWithValue("@MaKH", maKH);
            adapt.InsertCommand.Parameters.AddWithValue("@SDT", txtSDT.Text);
            adapt.InsertCommand.Parameters.AddWithValue("@Email", txtEmail.Text);
            adapt.InsertCommand.Parameters.AddWithValue("@DiaChi", txtDiaChi.Text);
            adapt.InsertCommand.Parameters.AddWithValue("@NgayDatHang", ngayDatHang);
            adapt.InsertCommand.Parameters.AddWithValue("@TongTien", TongTien);
            adapt.InsertCommand.Parameters.AddWithValue("@TrangThai", Convert.ToInt32("1"));

            DataRow row = dt.NewRow();
            row["MaKH"] = maKH;
            row["SDT"] = txtSDT.Text;
            row["Email"] = txtEmail.Text;
            row["DiaChi"] = txtDiaChi.Text;
            row["NgayDatHang"] = ngayDatHang;
            row["TongTien"] = TongTien;
            row["TrangThai"] = Convert.ToInt32("1");
            dt.Rows.Add(row);
            SqlCommandBuilder builder = new SqlCommandBuilder(adapt);
            adapt.Update(dt);

            MailMessage mail = new MailMessage();
            mail.To.Add(txtEmail.Text);
            mail.From = new MailAddress("ngh.phuong031102@gmail.com");
            mail.Subject = "Gửi từ Tân Việt Mỹ";
            mail.Body = "Quý khách vừa đặt đơn hàng có mã là: " + "DH112" + "<br/>";
            mail.Body += "Vui lòng kiểm tra đơn hàng của bạn: <br/>";
            mail.Body += "Họ tên của bạn: " + txtHoTen.Text + "<br/>";
            mail.Body += "Điện thoại: " + txtSDT.Text + "<br/>";
            mail.Body += GetGridviewData(gvDonHang) + "<br/>";
            mail.Body += "Tổng hóa đơn của bạn: " + lblTongThanhTien.Text + "<br/>";
            mail.Body += "Tổng số lượng sản phẩm của bạn: " + lblTongSoLuong.Text + "<br/>";
            mail.Body += "Địa chỉ giao hàng: " + txtDiaChi.Text;
            mail.IsBodyHtml = true;
            SmtpClient client = new SmtpClient();
            client.Host = "smtp.gmail.com";
            client.Port = 587;
            client.EnableSsl = true;
            client.Credentials = new NetworkCredential("ngh.phuong031102@gmail.com", "cnktfuezgtjvbxns");
            client.Send(mail);
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Đã xác nhận đơn hàng');", true);
            txtEmail.Text = null;
            txtSDT.Text = null;
            txtDiaChi.Text = null;
            gvDonHang.DataSource = null;
            gvDonHang.DataBind();

            Response.Redirect("~/User/TrangChu.aspx");
        }
        private string GetGridviewData(GridView gv)
        {
            StringBuilder strBuilder = new StringBuilder();
            StringWriter strWriter = new StringWriter(strBuilder);
            HtmlTextWriter htw = new HtmlTextWriter(strWriter);
            gv.RenderControl(htw);
            return strBuilder.ToString();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {

        }


    }
}