# Optional: dynamically pick smallest node type & latest LTS
data "databricks_node_type" "smallest" {
  local_disk = true
}

data "databricks_spark_version" "latest_lts" {
  long_term_support = true
}

resource "databricks_cluster" "single_node_dev" {
  cluster_name  = var.cluster_name
  spark_version = data.databricks_spark_version.latest_lts.id
  node_type_id  = data.databricks_node_type.smallest.id
  kind          = "CLASSIC_PREVIEW"

  # Configures Dedicated Mode for a Single User to bypass NO_ISOLATION
  data_security_mode = "SINGLE_USER"
  single_user_name   = "newsun_a@yahoo.com" # Required for SINGLE_USER mode

  # Enforces a true Single-Node configuration (1 physical machine)
  is_single_node = true
  num_workers    = 0

  autotermination_minutes = var.cluster_autotermination_minutes

  spark_env_vars = {
    PYSPARK_PYTHON = "/databricks/python3/bin/python3"
  }

  custom_tags = {
    Environment = "dev"
    Owner       = "Surya"
  }
}