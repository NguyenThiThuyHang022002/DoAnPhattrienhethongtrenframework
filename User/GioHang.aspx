<%@ Page Title="" Language="C#" MasterPageFile="~/MainChinh.Master" AutoEventWireup="true" CodeBehind="GioHang.aspx.cs" Inherits="TanVietMy.User.GioHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container py-5">
        <h2 class="pb-3 border-bottom">Giỏ hàng</h2>

        <div class="table-responsive">
            <asp:GridView ID="gvgiohang"  runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="gvgiohang_RowCancelingEdit" OnRowDeleting="gvgiohang_RowDeleting" OnRowEditing="gvgiohang_RowEditing" OnRowUpdating="gvgiohang_RowUpdating" CssClass="table table-bordered">
                <Columns>
                    <asp:BoundField DataField="TenSP" HeaderText="Tên sản phẩm" ReadOnly="True" />
                    <asp:BoundField DataField="Gia" HeaderText="Đơn giá" ReadOnly="True" DataFormatString="{0:0,000 vnđ}"/>
                    <asp:BoundField DataField="SoLuong" HeaderText="Số Lượng" />
                    <asp:BoundField DataField="ThanhTien" HeaderText="Thành tiền" ReadOnly="True"/>
                    <asp:CommandField DeleteText="Xóa" ShowDeleteButton="True" ButtonType="Button" />
                    <asp:CommandField CancelText="Hủy" EditText="Chỉnh sửa" ShowEditButton="True" UpdateText="Cập nhật" ButtonType="Button" />
                </Columns>
                <FooterStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <HeaderStyle BackColor="#212529" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            </asp:GridView>
        </div>

        <div class="row mt-3">
            <div class="col-md-6">
                <div class="row mb-2">
                    <div class="col-md-4 text-end"><strong>Số lượng:</strong></div>
                    <div class="col-md-8"><asp:Label ID="lblSoLuong" runat="server"></asp:Label></div>
                </div>
                <div class="row mb-2">
                    <div class="col-md-4 text-end"><strong>Tổng thành tiền:</strong></div>
                    <div class="col-md-8 text-start"><asp:Label ID="lblThanhTien" runat="server" ></asp:Label></div>
                    </div>
                
                    <div class="row">
                    <div class="col-md-12 text-center">
                    <asp:Button ID="btnDatHang" runat="server" Text="Đặt hàng" CssClass="btn btn-primary" OnClick="btnDatHang_Click" />
                    <asp:Button ID="btnBack" runat="server" Text="Tiếp tục mua hàng" CssClass="btn btn-secondary" PostBackUrl="~/User/SanPham.aspx"/>
                    </div>
                    </div>
                    </div>
            </div>
        </div>
</asp:Content>
