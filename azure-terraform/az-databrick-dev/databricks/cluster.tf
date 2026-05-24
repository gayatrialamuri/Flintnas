# Pick smallest node type with local disk
data "databricks_node_type" "smallest" {
  local_disk = true
}

# Pick latest LTS Spark version
data "databricks_spark_version" "latest_lts" {
  long_term_support = true
}

resource "databricks_cluster" "single_node_dev" {
  cluster_name  = var.cluster_name
  spark_version = data.databricks_spark_version.latest_lts.id
  node_type_id  = data.databricks_node_type.smallest.id

  # MUST come before is_single_node
  kind = "SINGLE_NODE"

  # Single-node cluster
  is_single_node = true
  num_workers    = 0

  # UC-compliant shared mode
  data_security_mode = "USER_ISOLATION"

  autotermination_minutes = var.cluster_autotermination_minutes

  spark_env_vars = {
    PYSPARK_PYTHON = "/databricks/python3/bin/python3"
  }

  custom_tags = {
    Environment = "dev"
    Owner       = "newsun"
  }
}