variable "environment" {
  type        = string
  description = "Environment for deployment (e.g. dev, int, prod)"
}

variable "deployment_version" {
  type        = string
  default     = "0.0.1"
  description = "Current version of the deployment (Semantic Versioning)"
}