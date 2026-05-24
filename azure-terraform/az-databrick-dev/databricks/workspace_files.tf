resource "databricks_workspace_file" "test_sparkjob" {
  source = "${path.module}/../../../notebooks/test-sparkjob.py"
  path   = "/Shared/test-sparkjob.py"
}