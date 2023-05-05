<%@ Page Title="" Language="C#" MasterPageFile="~/MainAdmin.Master" AutoEventWireup="true" CodeBehind="ThemSP.aspx.cs" Inherits="TanVietMy.Admin.ThemSP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container my-5">
        <h1 class="text-center">Thêm sản phẩm</h1>
  <div class="row">
    <div class="col-12 col-md-8 text-center">
      <div class="row mb-3">
        <div class="col-md-6 text-end"><label for="inputTenSP" class="form-control-label">Tên sản phẩm:</label></div>
        <div class="col-md-6"><asp:TextBox ID="inputTenSP" type="text" runat="server" CssClass="form-control" placeholder="Tên sản phẩm" aria-labelledby="Tên sản phẩm"></asp:TextBox></div>
      </div>
      <div class="row mb-3">
        <div class="col-md-6 text-end"><label for="inputDG" class="col-form-label">Đơn giá:</label></div>
        <div class="col-md-6"><asp:TextBox ID="inputDG" type="number" min="0" step="any" placeholder="Đơn giá" aria-labelledby="Đơn giá" runat="server" CssClass="form-control" ></asp:TextBox></div>
      </div>
      <div class="row mb-3">
        <div class="col-md-6 text-end"><label for="inputSoLuong"  class="col-form-label">Số lượng:</label></div>
        <div class="col-md-6"><asp:TextBox ID="inputSoLuong" type="number" min="0" step="1" placeholder="Số lượng" aria-labelledby="Số lượng" runat="server" CssClass="form-control"></asp:TextBox></div>
      </div>
      <div class="row mb-3">
        <div class="col-md-6 text-end"><label for="inputDanhMuc" class="col-form-label">Danh mục:</label></div>
        <div class="col-md-6"><asp:DropDownList ID="inputDanhMuc" CssClass="form-select form-control" aria-label="Danh mục" runat="server" DataSourceID="SqlDataSource1" DataTextField="TenDanhMuc" DataValueField="MaDanhMuc"></asp:DropDownList>
                  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BHNT %>" SelectCommand="SELECT * FROM [DanhMucSanPham]"></asp:SqlDataSource></div>
      </div>
      <div class="row mb-3">
        <div class="col-md-6 text-end"><label for="inputMoTa" class="col-form-label">Mô tả:</label></div>
        <div class="col-md-6"><asp:TextBox ID="inputMoTa" rows="3" runat="server" CssClass="form-control"></asp:TextBox></div>
      </div>
      <div class="row mb-3">
        <div class="col-md-6 text-end"><label for="inputHinhAnh" class="col-form-label">Hình ảnh:</label></div>
        <div class="col-md-6"><asp:FileUpload ID="inputHinhAnh" runat="server" CssClass="form-control" type="file" onchange="previewImage()"  /></div>
      </div>
      <div class="row mb-3">
        <div class="col-md-8 offset-md-4">
            <asp:Button ID="BtnThem" runat="server" OnClick="BtnThem_Click" CssClass="btn btn-dark me-2"  Text="Thêm sản phẩm" />
          <a href="SanPhamAdmin.aspx" runat="server" class="btn btn-dark" role="button">Quay lại</a>
        </div>
      </div>
    </div>
      <div class="col-12 col-md-4 text-center">
       <img id="preview" style="max-width:300px; max-height:300px;">
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
        function clearTextBoxes() {
            document.getElementById('inputTenSP').value = '';
            document.getElementById('inputDG').value = '';
            document.getElementById('inputSoLuong').value = '';
            document.getElementById('inputMoTa').value = '';
        }
    </script>
</asp:Content>
