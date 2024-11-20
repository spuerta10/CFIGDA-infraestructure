resource "local_file" "file" {
    filename = var.filepath
    content = var.file_content
    file_permission = var.file_permission
}