<%@ Page Title="" Language="C#" MasterPageFile="~/MainChinh.Master" AutoEventWireup="true" CodeBehind="GopY.aspx.cs" Inherits="TanVietMy.User.GopY" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
      <div class="row">
        <div class="col-md-12 ">
            <div class="d-flex align-items-center justify-content-center">
                <h2>Góp Ý</h2>
            </div>
        </div>
          </div>
            <div class="row g-3 offset-md-3 align-items-center">
              <div class="col-md-2">
                <label for="inputTenKH" class="col-form-label">Tên khách hàng:</label>
              </div>
              <div class="col-md-4">
                <asp:TextBox ID="inputTenKH" type="text" runat="server" CssClass="form-control" placeholder="Tên khách hàng" aria-labelledby="Tên khách hàng"></asp:TextBox>
              </div>
            </div>
            <div class="row g-3 offset-md-3 align-items-center">
              <div class="col-md-2">
                <label for="inputSDT" class="col-form-label">Số điện thoại:</label>
              </div>
              <div class="col-md-4">
                  <asp:TextBox ID="inputSDT" type="tel" placeholder="Số điện thoại" aria-labelledby="Số điện thoại" runat="server" CssClass="form-control" ></asp:TextBox>
              </div>
            </div>
            <div class="row g-3 offset-md-3 align-items-center">
              <div class="col-md-2">
                <label for="inputEmail"  class="col-form-label">Email:</label>
              </div>
              <div class="col-md-4">
                <asp:TextBox ID="inputEmail" type="email" placeholder="Email" aria-labelledby="Email" runat="server" CssClass="form-control"></asp:TextBox>
              </div>
            </div>
            <div class="row g-3 offset-md-3 align-items-center">
              <div class="col-md-2">
                <label for="inputLoai" class="col-form-label">Loại góp ý:</label>
              </div>
              <div class="col-md-4">
                  <asp:DropDownList ID="inputLoai" CssClass="form-select form-control" aria-label="Loại góp ý" runat="server">
                      <asp:ListItem Selected="True">Chất lượng sản phẩm</asp:ListItem>
                      <asp:ListItem>Góp ý về chất lượng dịch vụ</asp:ListItem>
                      <asp:ListItem>Đề xuất sản phẩm mới</asp:ListItem>
                      <asp:ListItem>Góp ý về trang web</asp:ListItem>
                  </asp:DropDownList>
              </div>
            </div>
            <div class="row g-3 offset-md-3 align-items-center">
              <div class="col-md-2">
                <label for="inputNoiDung" class="col-form-label">Nội dung:</label>
              </div>
              <div class="col-md-4">
                <textarea id="TextArea1" cols="20" rows="10" runat="server" class="form-control" ></textarea>
              </div>    
            </div>
              <div class="row g-3 offset-md-3 align-items-center mt-2">
              <div class="col-md-12">
                <asp:Button ID="BtnGopY" OnClick="BtnGopY_Click" CssClass="btn btn-dark" runat="server" Text="Góp Ý" />
              </div>
            
        </div>
    </div>
</asp:Content>
