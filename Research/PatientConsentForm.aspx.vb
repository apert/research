Imports System.Data.SqlClient

Public Class PatientConsentForm
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Dim lang As String = Request.QueryString("lang")

            If String.IsNullOrEmpty(lang) Then
                lang = "en"
            End If

            Session("Language") = lang.ToLower()

            If lang.ToLower() = "bm" Then
                LoadMalay()
            Else
                LoadEnglish()
            End If

        End If

    End Sub
    Private Sub LoadEnglish()

        lblTitle.Text = "Consent Signature Form"

        lblParticipantTitle.Text = "Participant / Legal Guardian"
        lblParticipantName.Text = "Name"
        lblParticipantIC.Text = "I.C Number"
        lblParticipantDate.Text = "Date"
        lblParticipantSignature.Text = "Signature"

        lblWitnessTitle.Text = "Witness"
        lblWitnessName.Text = "Name"
        lblWitnessIC.Text = "I.C Number"
        lblWitnessDate.Text = "Date"
        lblWitnessSignature.Text = "Signature"

        lblResearcherTitle.Text = "Researcher / Consent Taker"
        lblResearcherName.Text = "Name"
        lblResearcherIC.Text = "I.C Number"
        lblResearcherDate.Text = "Date"
        lblResearcherSignature.Text = "Signature"

        btnSubmit.Text = "Submit"

    End Sub
    Private Sub LoadMalay()

        lblTitle.Text = "Borang Tandatangan Persetujuan"

        lblParticipantTitle.Text = "Peserta / Wakil Sah"
        lblParticipantName.Text = "Nama"
        lblParticipantIC.Text = "No. Kad Pengenalan"
        lblParticipantDate.Text = "Tarikh"
        lblParticipantSignature.Text = "Tandatangan"

        lblWitnessTitle.Text = "Saksi"
        lblWitnessName.Text = "Nama"
        lblWitnessIC.Text = "No. Kad Pengenalan"
        lblWitnessDate.Text = "Tarikh"
        lblWitnessSignature.Text = "Tandatangan"

        lblResearcherTitle.Text = "Penyelidik / Pengambil Izin"
        lblResearcherName.Text = "Nama"
        lblResearcherIC.Text = "No. Kad Pengenalan"
        lblResearcherDate.Text = "Tarikh"
        lblResearcherSignature.Text = "Tandatangan"

        btnSubmit.Text = "Hantar"

    End Sub
    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs)

        'Dim connStr As String = "YOUR_CONNECTION_STRING"

        'Using con As New SqlConnection(connStr)
        '    con.Open()

        '    Dim query As String = "
        '    INSERT INTO ConsentForm
        '    (ParticipantName, ParticipantIC, ParticipantDate, ParticipantSign,
        '     WitnessName, WitnessIC, WitnessDate, WitnessSign,
        '     ResearcherName, ResearcherIC, ResearcherDate, ResearcherSign)
        '    VALUES
        '    (@pName,@pIC,@pDate,@pSign,
        '     @wName,@wIC,@wDate,@wSign,
        '     @rName,@rIC,@rDate,@rSign)"

        '    Using cmd As New SqlCommand(query, con)

        '        cmd.Parameters.AddWithValue("@pName", txtParticipantName.Text)
        '        cmd.Parameters.AddWithValue("@pIC", txtParticipantIC.Text)
        '        cmd.Parameters.AddWithValue("@pDate", txtParticipantDate.Text)
        '        cmd.Parameters.AddWithValue("@pSign", txtParticipantSign.Text)

        '        cmd.Parameters.AddWithValue("@wName", txtWitnessName.Text)
        '        cmd.Parameters.AddWithValue("@wIC", txtWitnessIC.Text)
        '        cmd.Parameters.AddWithValue("@wDate", txtWitnessDate.Text)
        '        cmd.Parameters.AddWithValue("@wSign", txtWitnessSign.Text)

        '        cmd.Parameters.AddWithValue("@rName", txtResearcherName.Text)
        '        cmd.Parameters.AddWithValue("@rIC", txtResearcherIC.Text)
        '        cmd.Parameters.AddWithValue("@rDate", txtResearcherDate.Text)
        '        cmd.Parameters.AddWithValue("@rSign", txtResearcherSign.Text)

        '        cmd.ExecuteNonQuery()

        '    End Using
        'End Using

        ' Redirect after submit
        Response.Redirect("DataCollection.aspx")

    End Sub
End Class