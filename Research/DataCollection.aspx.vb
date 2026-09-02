Public Class DataCollection
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs)

        Dim patientID As String = txtPatientID.Text
        Dim age As String = txtAge.Text
        Dim weight As String = txtWeight.Text

        Dim sex As String = If(rbMale.Checked, "Male", "Female")

        Dim asa As String = ""
        If asa1.Checked Then asa = "I"
        If asa2.Checked Then asa = "II"
        If asa3.Checked Then asa = "III"

        ' Example: Save to DB / Excel / API
        ' For now simple alert

        ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Data submitted successfully');", True)

    End Sub
End Class