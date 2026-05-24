resource "databricks_job" "run_notebook" {
  name = "test-sparkjob"

  task {
    task_key = "sparkjob_task"

    spark_python_task {
      python_file = databricks_workspace_file.test_sparkjob.path
    }

    existing_cluster_id = databricks_cluster.single_node_dev.id
  }
}