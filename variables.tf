variable "name" {
  type = string
  description = "Release name"
  default     = null
}

variable "chart" {
  type = string
  description = "Chart name to be installed"
  default     = null
}

variable "repository" {
  type = string
  description = "Repository where to locate the requested chart. If is an URL the chart is installed without installing the repository"
  default     = null
}

variable "repository_key_file" {
  type = string
  description = "The repositories cert key file"
  default     = null
}

variable "repository_cert_file" {
  type = string
  description = "The repositories cert file"
  default     = null
}

variable "repository_ca_file" {
  type = string
  description = "The Repositories CA File"
  default     = null
}

variable "repository_username" {
  type = string
  description = "Username for HTTP basic authentication against the repository"
  default     = null
}

variable "repository_password" {
  type = string
  description = "Password for HTTP basic authentication against the reposotory"
  default     = null
}

variable "chart_version" {
  type = string
  description = "Specify the exact chart version to install. If this is not specified, the latest version is installed"
  default     = null
}

variable "namespace" {
  type = string
  description = "The namespace to install the release into. Defaults to default"
  default     = "default"
}

variable "verify" {
  type = bool
  description = "Verify the package before installing it. Defaults to false"
  default     = false
}

variable "keyring" {
  type = string
  description = "Location of public keys used for verification. Used only if verify is true. Defaults to /.gnupg/pubring.gpg in the location set by home"
  default     = "/.gnupg/pubring.gpg"
}

variable "timeout" {
  type = number
  description = "Time in seconds to wait for any individual kubernetes operation. Defaults to 300 seconds."
  default     = 300
}

variable "disable_webhooks" {
  type = bool
  description = "Prevent hooks from running. Defauts to false"
  default     = false
}

variable "reuse_values" {
  type = bool
  description = "When upgrading, reuse the last release's values and merge in any overrides. If 'reset_values' is specified, this is ignored. Defaults to false"
  default     = false
}

variable "reset_values" {
  type = bool
  description = "When upgrading, reset the values to the ones built into the chart. Defaults to false."
  default     = false
}

variable "force_update" {
  type = bool
  description = "Force resource update through delete/recreate if needed. Defaults to false"
  default     = false
}

variable "recreate_pods" {
  type = bool
  description = "Perform pods restart during upgrade/rollback. Defaults to false"
  default     = false
}

variable "cleanup_on_fail" {
  type = bool
  description = "Allow deletion of new resources created in this upgrade when upgrade fails. Defaults to false"
  default     = true
}

variable "max_history" {
  type = number
  description = "Maximum number of release versions stored per release. Defaults to 0 (no limit)."
  default     = 0
}

variable "atomic" {
  type = bool
  description = "If set, installation process purges chart on fail. The wait flag will be set automatically if atomic is used. Defaults to true"
  default     = true
}

variable "skip_crds" {
  type = bool
  description = " If set, no CRDs will be installed. By default, CRDs are installed if not already present. Defaults to false."
  default     = false
}

variable "render_subchart_notes" {
  type = bool
  description = "If set, render subchart notes along with the parent. Defaults to true"
  default     = true
}

variable "wait" {
  type = bool
  description = "Will wait until all resources are in a ready state before marking the release as successful. It will wait for as long as timeout. Defaults to true."
  default     = true
}

variable "values" {
  type = list
  description = "List of values in raw yaml to pass to helm. Values will be merged, in order, as Helm does with multiple -f options"
  default     = []
}

variable "set" {
  type = list(map(string))
  description = "Value block with custom values to be merged with the values yaml."
  default     = []
}

variable "set_sensitive" {
  type = list(map(string))
  description = "Value block with custom sensitive values to be merged with the values yaml that won't be exposed in the plan's diff."
  default     = []
}

variable "set_string" {
  type = list(map(string))
  description = "Value block with custom STRING values to be merged with the values yaml."
  default     = []
}

variable "dependency_update" {
  type = bool
  description = "Runs helm dependency update before installing the chart. Defaults to false."
  default     = false
}

variable "replace" {
  type = bool
  description = "Re-use the given name, even if that name is already used. This is unsafe in production. Defaults to false."
  default     = false
}
