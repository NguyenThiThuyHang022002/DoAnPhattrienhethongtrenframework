<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DangNhapAd.aspx.cs" Inherits="TanVietMy.Admin.DangNhapAd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <link href="StyleSheet.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <section class="h-100 gradient-form" style="background-color: #eee;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-xl-10">
        <div class="card rounded-3 text-black">
          <div class="row g-0">
            <div class="col-lg-6">
              <div class="card-body p-md-5 mx-md-4">

                <div class="text-center">
                  <img src="../Images/logo.png"
                    style="width: 185px;" alt="logo"/>
                  <h4 class="mt-1 mb-5 pb-1">Chào Mừng Đến Với Tân Việt Mỹ</h4>
                  <h6 class="mt-1 mb-1 pb-1">Lưu ý đây là trang đăng nhập của quản lý trang</h6>
                  <h6 class="mt-1 mb-1 pb-1">Nếu không phải quản lý trang vui lòng rời khỏi đây</h6>
                </div>

                
                  <p>Hãy đăng nhập tài khoản của bạn</p>

                  <div class="form-outline mb-4">
                    <label class="form-label" for="form2Example11">Tài Khoản</label>
                    <asp:TextBox type="text" ID="User" runat="server" CssClass="form-control" placeholder="Tên đăng nhập" />
                  </div>

                  <div class="form-outline mb-4">
                    <label class="form-label" for="form2Example22">Mật Khẩu</label>
                      <asp:TextBox type="password" ID="Password" runat="server" CssClass="form-control" placeholder="Mật khẩu" />
                  </div>

                  <div class="text-center pt-1 mb-5 pb-1">
                      <asp:Button ID="Button1" CssClass="btn btn-dark btn-block fa-lg mb-3" runat="server" Text="Đăng nhập" OnClick="Button1_Click" />
                  </div>

                

              </div>
            </div>
            <div class="col-lg-6 d-flex align-items-center">
                <img alt="HinhAnh" src="../Images/Dangnhap2.png" class="img-fluid" />
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
    </form>
</body>
</html>
