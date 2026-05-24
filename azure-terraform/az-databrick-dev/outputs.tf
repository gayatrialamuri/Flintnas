output "cluster_id" {
  value = databricks_cluster.single_node_dev.id
}

output "cluster_url" {
  value = databricks_cluster.single_node_dev.url
}