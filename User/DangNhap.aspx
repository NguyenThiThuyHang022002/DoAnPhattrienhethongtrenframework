<%@ Page Title="" Language="C#" MasterPageFile="~/MainChinh.Master" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="TanVietMy.User.DangNhap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                    style="width: 185px;" alt="logo">
                  <h4 class="mt-1 mb-5 pb-1">Chào Mừng Đến Với Tân Việt Mỹ</h4>
                </div>

                  <p>Hãy đăng nhập tài khoản của bạn</p>

                  <div class="form-outline mb-4">
                    <label class="form-label" for="form2Example11">Tài Khoản</label>
                      <asp:TextBox type="text" ID="User" runat="server" CssClass="form-control" placeholder="Số điện thoại hoặc email" />
                  </div>

                  <div class="form-outline mb-4">
                    <label class="form-label" for="form2Example22">Mật Khẩu</label>
                    <asp:TextBox type="password" ID="Password" runat="server" CssClass="form-control" placeholder="Mật khẩu" />
                  </div>

                  <div class="text-center pt-1 mb-5 pb-1">
                    <asp:Button ID="btnDangNhap" CssClass="btn btn-dark" runat="server" Text="Đăng nhập" OnClick="btnDangNhap_Click" />
                    <a class="text-muted d-block" href="#!">Quên mật khẩu?</a>
                  </div>

                  <div class="d-flex align-items-center justify-content-center pb-4">
                    <p class="mb-0 me-2">Chưa có tài khoản?</p>
                    <a href="../User/DangKy.aspx" class="btn btn-outline-danger" role="button">Tạo ngay</a>
                  </div>

                

              </div>
            </div>
            <div class="col-lg-6 d-flex align-items-center">
                <img alt="HinhAnh" src="../Images/Dangnhap.png" class="img-fluid" />
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</asp:Content>
