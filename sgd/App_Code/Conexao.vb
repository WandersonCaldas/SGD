Imports System.Data
Imports System.Data.SqlClient

Public Class Conexao
    Inherits System.Web.UI.Page

    Public Function ObterConexaoAberta() As SqlConnection
        Dim OleConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Try
            If OleConn.State = ConnectionState.Closed Then
                OleConn.Open()
            End If
        Catch ex As Exception
            ClientScript.RegisterStartupScript(Me.GetType, "erro", "<script language='javascript'>alert('" & ex.Message & "');</script>")
        End Try

        Return OleConn
    End Function

    Public Sub FecharConexaoAberta(conexao As SqlConnection)
        Try
            conexao.Close()
        Catch ex As Exception
            ClientScript.RegisterStartupScript(Me.GetType, "erro", "<script language='javascript'>alert('" & ex.Message & "');</script>")
        End Try
    End Sub

End Class
