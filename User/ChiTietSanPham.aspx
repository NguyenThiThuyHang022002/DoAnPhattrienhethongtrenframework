<%@ Page Title="" Language="C#" MasterPageFile="~/MainChinh.Master" AutoEventWireup="true" CodeBehind="ChiTietSanPham.aspx.cs" Inherits="TanVietMy.User.ChiTietSanPham" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container my-5">
        <h1 class="text-center">Thông tin sản phẩm</h1>
  <div class="row">
    <div class="col-12 col-md-4 text-center">
      <img id="imgHinh" runat="server" class="img-fluid" />
    </div>
    <div class="col-12 col-md-8">
      <asp:Label ID="lblTenSP" CssClass="text-center text-md-start mb-4 fs-3" runat="server"></asp:Label>
      <div class="row mb-3">
        <div class="col-md-4 text-end"><label id="Label4" runat="server">Đơn giá: </label></div>
        <div class="col-md-8 text-start"><asp:Label ID="lblDG" runat="server"></asp:Label></div>
      </div>
      <div class="row mb-3">
        <div class="col-md-4 text-end"><label id="Label5" runat="server">Loại:</label></div>
        <div class="col-md-8 text-start"><asp:Label ID="lblDanhMuc" runat="server"></asp:Label></div>
      </div>
      <div class="row mb-3">
        <div class="col-md-4 text-end"><label id="Label8" runat="server">Mô tả:</label></div>
        <div class="col-md-8 text-start"><asp:Label ID="lblMota" runat="server"></asp:Label></div>
      </div>
      <div class="row mb-3">
        <div class="col-md-4 text-end"><label id="Label7" runat="server">Số lượng:</label></div>
        <div class="col-md-8 text-start"><asp:TextBox ID="inputSoLuong" type="number" min="1" step="1" placeholder="Số lượng" aria-labelledby="Số lượng" runat="server" value="1" CssClass="form-control w-auto"></asp:TextBox></div>
      </div>
      <div class="row mb-3">
        <div class="col-md-8 offset-md-4">
            <asp:Button ID="btnThemGH" runat="server" CssClass="btn btn-secondary me-2" OnClick="btnThemGH_Click" Text="Thêm sản phẩm" />
          <a href="SanPham.aspx" runat="server" class="btn btn-secondary" role="button">Quay lại</a>
        </div>
      </div>
    </div>
  </div>
</div>
</asp:Content>
