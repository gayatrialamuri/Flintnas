# Optional: dynamically pick smallest node type & latest LTS
data "databricks_node_type" "smallest" {
  local_disk = true
}

data "databricks_spark_version" "latest_lts" {
  long_term_support = true
}

resource "databricks_cluster" "single_node_dev" {
  cluster_name            = var.cluster_name

  # You can either use the data sources above or the explicit vars
  spark_version           = data.databricks_spark_version.latest_lts.id
  node_type_id            = data.databricks_node_type.smallest.id

  autotermination_minutes = var.cluster_autotermination_minutes
  data_security_mode      = var.cluster_data_security_mode

  # Single node magic
  is_single_node = true
  num_workers    = 0

  # Optional but nice for dev
  spark_env_vars = {
    PYSPARK_PYTHON = "/databricks/python3/bin/python3"
  }

  custom_tags = {
    "Environment" = "dev"
    "ResourceClass" = "SingleNode"
  }
}

output "cluster_id" {
  value = databricks_cluster.single_node_dev.id
}

output "cluster_url" {
  value = databricks_cluster.single_node_dev.url
}