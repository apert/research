Public Class LanguageSelect
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub btnNext_Click(sender As Object, e As EventArgs)


        Dim language As String = ""

        If rbEnglish.Checked Then
            language = "en"
        ElseIf rbBM.Checked Then
            language = "bm"
        End If

        If language = "" Then
            lblMessage.Text = "Please select language."
            Exit Sub
        End If

        Response.Redirect("PatientConsent.aspx?lang=" & language)


    End Sub
End Class