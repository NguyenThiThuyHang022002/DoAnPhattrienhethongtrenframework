<%@ Page Title="" Language="C#" MasterPageFile="~/MainAdmin.Master" AutoEventWireup="true" CodeBehind="DonHangKH.aspx.cs" Inherits="TanVietMy.Admin.DonHangKH" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="pb-3 border-bottom">Đơn hàng Khách Hàng</h2>
        
    <asp:GridView ID="gvDHKH" CssClass="justify-content-center " runat="server" AllowPaging="True" Width="100%" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataSourceID="SqlDataSource1" GridLines="Horizontal" DataKeyNames="MaDDH">
        <Columns>
            <asp:BoundField DataField="MaDDH" HeaderText="Mã đơn hàng" SortExpression="MaDDH" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="MaKH" HeaderText="Mã khách hàng" SortExpression="MaKH" />
            <asp:BoundField DataField="TenKH" HeaderText="Tên khách hàng" SortExpression="TenKH" />
            <asp:BoundField DataField="SDT" HeaderText="Số điện thoại" SortExpression="SDT" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="DiaChi" HeaderText="Địa chỉ" SortExpression="DiaChi" />
            <asp:BoundField DataField="NgayDatHang" HeaderText="Ngày đặt" SortExpression="NgayDatHang" />
            <asp:BoundField DataField="TongTien" HeaderText="Tổng hóa đơn" SortExpression="TongTien" DataFormatString="{0:0,000 vnđ}" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#333333" HorizontalAlign="Center"/>
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" CssClass="text-center" VerticalAlign="Middle" HorizontalAlign="Center" />
        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="White" HorizontalAlign="Center" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#487575" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#275353" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BHNT %>" SelectCommand="SELECT DonDatHang.MaDDH, DonDatHang.MaKH, DonDatHang.SDT, DonDatHang.Email, DonDatHang.DiaChi, DonDatHang.NgayDatHang, DonDatHang.TongTien, KhachHang.TenKH FROM DonDatHang INNER JOIN KhachHang ON DonDatHang.MaKH = KhachHang.MaKH"></asp:SqlDataSource>
</asp:Content>
