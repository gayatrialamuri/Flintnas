resource "databricks_job" "run_notebook" {
  name = "flintnas-sparkjob"

  task {
    task_key = "sparkjob_task"

    notebook_task {
      notebook_path = "/Repos/newsun_a@yahoo.com/Flintnas/notebooks/test-sparkjob.py"
    }

    existing_cluster_id = databricks_cluster.single_node_dev.id
  }
}