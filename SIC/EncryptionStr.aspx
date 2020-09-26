<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EncryptionStr.aspx.cs" Inherits="SIC.SICSetup.EncryptionStr" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <asp:ScriptManager runat="server">
            <Services>
                <asp:ServiceReference Path="~/Models/WebService.asmx" />

            </Services>
        </asp:ScriptManager>
        <table>
            <tr>
                <td>Operation Type:</td>
                <td colspan="2">
                    <asp:DropDownList ID="DropDownList1" runat="server" Width="100px" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem>Production</asp:ListItem>
                        <asp:ListItem Value="Train">Trainning</asp:ListItem>
                        <asp:ListItem Selected="True">Test</asp:ListItem>
                        <asp:ListItem Value="FrankAzure">Azure</asp:ListItem>
                        <asp:ListItem>LDAP</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>

                    </asp:DropDownList>

                   Env IV: <asp:Label ID="LabelIV" runat="server" Text="Label" BackColor="WhiteSmoke" BorderStyle="Solid" BorderWidth="1px" ></asp:Label> Env Key:<asp:Label ID="LabelKey" runat="server" Text="Label" BackColor="WhiteSmoke" BorderWidth="1px"  BorderStyle="Solid"></asp:Label> <br />
                  Web Service : Env IV: <asp:Label ID="LabelIVWeb" runat="server" Text="Label" BackColor="WhiteSmoke" BorderStyle="Solid" BorderWidth="1px" ></asp:Label> Env Key:<asp:Label ID="LabelKeyWeb" runat="server" Text="Label" BackColor="WhiteSmoke" BorderWidth="1px"  BorderStyle="Solid"></asp:Label>
               </td>
                
            </tr>
            <tr>
                <td>Operation  String:</td>
                <td>
                    <asp:TextBox ID="TextObjStr" Width="600px" Height="80px" TextMode="MultiLine" runat="server"></asp:TextBox>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>Encryption String:</td>
                <td>
                    <asp:TextBox ID="TextEncrypStr" Width="600px" Height="80px" TextMode="MultiLine" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="ButtonEncryption" runat="server" Text="Encryption" OnClick="ButtonEncryption_Click" /></td>
            </tr>
            <tr>
                <td>Decryption String: </td>
                <td>
                    <asp:TextBox ID="TextDecrypStr" Width="600px" Height="80px" TextMode="MultiLine" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="ButtonDecryption" runat="server" Text="Decryption" OnClick="ButtonDecryption_Click" /></td>
            </tr>
        </table>

    </form>
</body>
</html>
  <script src="../Scripts/jquery-3.2.1.min.js"></script>
<script>

 function pageLoad(sender, args) {

        $(document).ready(function () {
            var env = SIC.Models.WebService.GetEnvironmentVariable("AppEncryptionIV", onSuccessIV, onFailure);
            var env = SIC.Models.WebService.GetEnvironmentVariable("AppEncryptionKey", onSuccessKey, onFailure);
        });


    }
    function onSuccessIV(result) {
        $("#LabelIVWeb").text(result);    
    }
    function onSuccessKey(result) {
        $("#LabelKeyWeb").text(result);   
    }

    function onFailure() {
        alert("Get Menu Failed!");
    }
</script>