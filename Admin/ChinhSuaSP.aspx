<%@ Page Title="" Language="C#" MasterPageFile="~/MainAdmin.Master" AutoEventWireup="true" CodeBehind="ChinhSuaSP.aspx.cs" Inherits="TanVietMy.Admin.ChinhSuaSP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
      <div class="row">
        <div class="col-md-12 ">
            <div class="d-flex align-items-center justify-content-center">
                <h2>Cập nhật sản phẩm</h2>
            </div>
        </div>
        </div>
            <div class="row g-3 offset-md-3 align-items-center">
              <div class="col-md-2">
                <label for="updateTenSP" class="col-form-label">Tên sản phẩm:</label>
              </div>
              <div class="col-md-4">
                <asp:TextBox ID="updateTenSP" type="text" runat="server" CssClass="form-control" placeholder="Tên sản phẩm" aria-labelledby="Tên sản phẩm"></asp:TextBox>
              </div>
            </div>
            <div class="row g-3 offset-md-3 align-items-center">
              <div class="col-md-2">
                <label for="updateDG" class="col-form-label">Đơn giá:</label>
              </div>
              <div class="col-md-4">
                <asp:TextBox ID="updateDG" type="number" min="0" step="any" placeholder="Đơn giá" aria-labelledby="Đơn giá" runat="server" CssClass="form-control"></asp:TextBox>
              </div>
            </div>
            <div class="row g-3 offset-md-3 align-items-center">
              <div class="col-md-2">
                <label for="updateSoLuong"  class="col-form-label">Số lượng:</label>
              </div>
              <div class="col-md-4">
                <asp:TextBox ID="updateSoLuong" type="number" min="0" step="1" placeholder="Số lượng" aria-labelledby="Số lượng" runat="server" CssClass="form-control"></asp:TextBox>
              </div>
            </div>
            <div class="row g-3 offset-md-3 align-items-center">
              <div class="col-md-2">
                <label for="updateDanhMuc" class="col-form-label">Danh mục:</label>
              </div>
              <div class="col-md-4">
                  <asp:DropDownList ID="updateDanhMuc" CssClass="form-select form-control" aria-label="Danh mục" runat="server" DataSourceID="SqlDataSource1" DataTextField="TenDanhMuc" DataValueField="MaDanhMuc"></asp:DropDownList>
                  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BHNT %>" SelectCommand="SELECT * FROM [DanhMucSanPham]"></asp:SqlDataSource>
              </div>
            </div>
            <div class="row g-3 offset-md-3 align-items-center">
              <div class="col-md-2">
                <label for="updateMoTa" class="col-form-label">Mô tả:</label>
              </div>
              <div class="col-md-4">
                <asp:TextBox ID="updateMoTa" rows="3" runat="server" CssClass="form-control"></asp:TextBox>
              </div>
            </div>
            <div class="row g-3 offset-md-3 align-items-center">
              <div class="col-md-2">
                <label for="updateHinhAnh" class="col-form-label">Hình ảnh:</label>
              </div>
              <div class="col-md-4">
                <asp:FileUpload ID="updateHinhAnh" runat="server" CssClass="form-control" type="file" onchange="previewImage()"  />
              </div>
            </div>
            <div class="row g-3 offset-md-3 align-items-center">
              <div class="col-md-2">
                <asp:Button ID="BtnCapnhat" Onclick="BtnCapnhat_Click" PostBackUrl="~/Admin/SanPhamAdmin.aspx" runat="server" class="btn btn-dark" Text="Cập nhật" />
              </div>
              <div class="col-md-4">
                <asp:Image ID="preview" style="max-width:300px; max-height:300px;" runat="server" />
              </div>
            </div>
    </div>
    <script>
        function previewImage() {
            var preview = document.querySelector('#preview');
            var file = document.querySelector('input[type=file]').files[0];
            var reader = new FileReader();

            reader.onloadend = function () {
                preview.src = reader.result;
            }

            if (file) {
                reader.readAsDataURL(file);
            } else {
                preview.src = "";
            }
        }

    </script>
</asp:Content>
