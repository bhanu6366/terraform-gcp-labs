locals {
  resource_prefix = var.resource_prefix != "" ? var.resource_prefix : "${var.environment}-devops"

  common_labels = merge(
    var.common_labels,
    {
      environment = var.environment
      project     = "devops-labs"
    }
  )
}
