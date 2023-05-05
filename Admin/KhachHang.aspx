<%@ Page Title="" Language="C#" MasterPageFile="~/MainAdmin.Master" AutoEventWireup="true" CodeBehind="KhachHang.aspx.cs" Inherits="TanVietMy.Admin.KhachHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="pb-3 border-bottom">Thông tin Khách Hàng</h2>
    <asp:GridView ID="gvkhachhang" runat="server" Width="100%" CssClass="justify-content-center" AutoGenerateColumns="False" DataKeyNames="MaKH" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="MaKH" HeaderText="Mã khách hàng" InsertVisible="False" ReadOnly="True" SortExpression="MaKH" >
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="TenKH" HeaderText="Tên khách hàng" SortExpression="TenKH" />
            <asp:BoundField DataField="DiaChi" HeaderText="Địa chỉ" SortExpression="DiaChi" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="SDT" HeaderText="Số điện thoại" SortExpression="SDT" />
            <asp:BoundField DataField="MatKhau" HeaderText="Mật khẩu" SortExpression="MatKhau" />
            <asp:CommandField DeleteText="Xóa" ShowDeleteButton="True" ButtonType="Button" />
            <asp:CommandField CancelText="Hủy" EditText="Chỉnh sửa" ShowEditButton="True" UpdateText="Cập nhật" ButtonType="Button" />
        </Columns>
        <RowStyle BackColor="White" HorizontalAlign="Center" ForeColor="#333333" />
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" CssClass="text-center" VerticalAlign="Middle" HorizontalAlign="Center" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BHNT %>" SelectCommand="SELECT * FROM [KhachHang]" DeleteCommand="DELETE FROM KhachHang WHERE MaKH = @MaKH" 
        UpdateCommand="UPDATE KhachHang SET TenKH = @TenKH, DiaChi = @DiaChi, Email = @Email, SDT = @SDT, MatKhau = @MatKhau WHERE MaKH = @MaKH">
        <DeleteParameters>
            <asp:Parameter Name="MaKH" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="TenKH" />
            <asp:Parameter Name="DiaChi" />
            <asp:Parameter Name="Email" />
            <asp:Parameter Name="SDT" />
            <asp:Parameter Name="MatKhau" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
