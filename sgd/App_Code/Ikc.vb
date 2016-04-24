Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient

Public Class Ikc
    Public Shared Sub Executar(ByVal sql As String)
        Dim conexao As New Conexao
        Dim cmd As New SqlCommand

        cmd.Connection = conexao.ObterConexaoAberta()
        cmd.CommandText = sql.ToString()
        cmd.CommandType = CommandType.Text
        cmd.ExecuteNonQuery()

        conexao.FecharConexaoAberta(cmd.Connection)
    End Sub

    Public Shared Function RetornaDatatable(ByVal sql As String) As DataTable
        Dim conexao As New Conexao
        Dim cmd As New SqlCommand

        cmd.Connection = conexao.ObterConexaoAberta()
        Dim da As New SqlDataAdapter(sql, cmd.Connection)

        Dim dt As New DataTable("registros")
        da.Fill(dt)

        Call conexao.FecharConexaoAberta(cmd.Connection)

        Return dt
    End Function
End Class
