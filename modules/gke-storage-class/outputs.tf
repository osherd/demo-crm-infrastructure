output "storage_class_name" {
  value = kubernetes_storage_class.this.metadata[0].name
}
output "storage_class_id" {
  value = kubernetes_storage_class.this.id
}