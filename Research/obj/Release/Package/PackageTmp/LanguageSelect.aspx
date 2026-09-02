<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="LanguageSelect.aspx.vb" Inherits="Research.LanguageSelect" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Select Language</title>

    <style>

body{
    margin:0;
    font-family:'Segoe UI',Arial;
    background:#f4f6f9;
}

.container{
    width:500px;
    margin:80px auto;
    background:#fff;
    border-radius:10px;
    box-shadow:0 5px 15px rgba(0,0,0,.15);
    text-align:center;
    padding:40px;
}

.logo img{
    width:110px;
    margin-bottom:15px;
}

h2{
    color:#6f2c91;
    margin-bottom:10px;
}

p{
    color:#666;
    margin-bottom:30px;
}

.languageBox{
    width:280px;
    margin:0 auto 30px auto;
}

.languageOption{
    display:flex;
    align-items:center;
    margin:18px 0;
    font-size:18px;
}

.languageOption input[type=radio]{
    margin-right:12px;
    width:18px;
    height:18px;
}

.languageOption label{
    cursor:pointer;
    color:#333;
}

.btnNext{
    background:#6f2c91;
    color:white;
    border:none;
    padding:12px 40px;
    font-size:16px;
    border-radius:5px;
    cursor:pointer;
}

.btnNext:hover{
    background:#58237a;
}

.message{
    color:red;
    margin-top:15px;
}
    </style>

</head>
<body>

<form id="form1" runat="server">

<div class="container">

    <div class="logo">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfiu9kO6Ck2wtVQI3WxxNPl8Nf4OnL21BK2DXv-TfxJ5FfVmA2Dq4M8D1v&s=10" alt="UiTM Logo" />
    </div>

    <h2>Select Language</h2>

    <p>Please choose your preferred language.</p>

    <div class="languageBox">

    <div class="languageOption">
        <asp:RadioButton
            ID="rbEnglish"
            runat="server"
            GroupName="Language"
            Checked="True" />

        <label for="<%= rbEnglish.ClientID %>">🇬🇧 English</label>
    </div>

    <div class="languageOption">
        <asp:RadioButton
            ID="rbBM"
            runat="server"
            GroupName="Language" />

        <label for="<%= rbBM.ClientID %>">🇲🇾 Bahasa Malaysia</label>
    </div>

</div>

    <asp:Button
        ID="btnNext"
        runat="server"
        Text="Next"
        CssClass="btnNext"
        OnClick="btnNext_Click" />

    <br /><br />

    <asp:Label
        ID="lblMessage"
        runat="server"
        CssClass="message" />

</div>

</form>

</body>
</html>