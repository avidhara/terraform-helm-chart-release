resource "helm_release" "this" {
  name  = var.name
  chart = var.chart
  ### repository Details
  repository           = var.repository
  repository_key_file  = var.repository_key_file
  repository_cert_file = var.repository_cert_file
  repository_ca_file   = var.repository_ca_file
  repository_username  = var.repository_username
  repository_password  = var.repository_password

  version               = var.chart_version
  namespace             = var.namespace
  verify                = var.verify
  keyring               = var.keyring
  timeout               = var.timeout
  disable_webhooks      = var.disable_webhooks
  reuse_values          = var.reuse_values
  reset_values          = var.reset_values
  force_update          = var.force_update
  recreate_pods         = var.recreate_pods
  cleanup_on_fail       = var.cleanup_on_fail
  max_history           = var.max_history
  atomic                = var.atomic
  skip_crds             = var.skip_crds
  render_subchart_notes = var.render_subchart_notes
  wait                  = var.wait
  dependency_update     = var.dependency_update
  replace               = var.replace

  values = var.values

  dynamic "set" {
    for_each = var.set
    content {
      name  = set.value["name"]
      value = set.value["value"]
    }
  }

  dynamic "set_string" {
    for_each = var.set_string
    content {
      name  = set_string.value["name"]
      value = set_string.value["value"]
    }
  }

  dynamic "set_sensitive" {
    for_each = var.set_sensitive
    content {
      name  = set_sensitive.value["name"]
      value = set_sensitive.value["value"]
    }
  }
}
