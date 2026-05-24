resource "databricks_job" "run_notebook" {
  name = "flintnas-sparkjob"

  task {
    task_key = "sparkjob_task"

    spark_python_task {
      python_file = "/Repos/newsun_a@yahoo.com/dev-repo/notebooks/test-sparkjob.py"
    }

    existing_cluster_id = databricks_cluster.single_node_dev.id
  }
}