<%@ Page Title="" Language="C#" MasterPageFile="~/MainChinh.Master" AutoEventWireup="true" CodeBehind="DangKy.aspx.cs" Inherits="TanVietMy.User.DangKi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="vh-100 bg-image"
  style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">
  <div class="mask d-flex align-items-center h-100 gradient-custom-3">
    <div class="container h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
          <div class="card" style="border-radius: 15px;">
            <div class="card-body p-5">
              <h2 class="text-uppercase text-center mb-5">Đăng ký tài khoản</h2>

              

                <div class="form-outline mb-4">
    <label class="form-label" for="inputName">Họ tên khách hàng</label>
    <asp:TextBox ID="inputName"  CssClass="form-control form-control-lg" type="text"  runat="server" ></asp:TextBox>          
</div>

<div class="form-outline mb-4">
    <label class="form-label" for="inputTel">Số điện thoại</label>
    <asp:TextBox ID="inputTel" CssClass="form-control form-control-lg" type="number"  runat="server" ></asp:TextBox>       
</div>

<div class="form-outline mb-4">
    <label class="form-label" for="inputEmail">Email</label>
    <asp:TextBox ID="inputEmail" CssClass="form-control form-control-lg" type="email"  runat="server" ></asp:TextBox>       
</div>

<div class="form-outline mb-4">
    <label class="form-label" for="inputPass">Mật khẩu</label>
    <asp:TextBox ID="inputPass" CssClass="form-control form-control-lg" type="password"  runat="server" ></asp:TextBox>       
</div>

<div class="form-outline mb-4">
    <label class="form-label" for="inputCPass">Nhập lại mật khẩu</label>
    <asp:TextBox ID="inputCPass" CssClass="form-control form-control-lg" type="password"  runat="server" ></asp:TextBox>       
</div>

<div class="d-flex justify-content-center">
    <asp:Button ID="btnDangKy" runat="server" Text="Đăng ký" OnClick="btnDangKy_Click" CssClass="btn btn-success btn-block btn-lg gradient-custom-4 text-body" />
</div>

                <p class="text-center text-muted mt-5 mb-0">Đã có tài khoản?
                    <a href="../User/DangNhap.aspx" class="fw-bold text-body"><u>Đăng nhập ngay</u></a></p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
    
</asp:Content>
