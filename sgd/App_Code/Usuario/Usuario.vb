Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient

Public Class Usuario
    Public id_ As Integer
    Public senha_ As Integer

    Sub RedefinirSenha()
        Dim sql As String = "UPDATE tbl_usuario SET txt_senha = '" & Trim(Me.senha_) & "' WHERE id_usuario = " & Me.id_
        Ikc.Executar(sql)
    End Sub

    Function DetalheUsuario() As DataTable
        Dim dt As DataTable = Ikc.RetornaDatatable("SELECT * FROM tbl_usuario WHERE id_usuario = " & Me.id_)

        Return dt
    End Function
End Class
