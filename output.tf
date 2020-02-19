output "chart" {
  description = "The name of the chart"
  value       = helm_release.this.metadata[0].chart
}

output "name" {
  description = "Name is the name of the release"
  value       = helm_release.this.metadata[0].name
}

output "namespace" {
  description = "Namespace is the kubernetes namespace of the release"
  value       = helm_release.this.metadata[0].namespace
}

output "revision" {
  description = "Version is an int32 which represents the version of the release"
  value       = helm_release.this.metadata[0].revision
}

output "status" {
  description = "Status of the release"
  value       = helm_release.this.metadata[0].status
}

output "version" {
  description = "A SemVer 2 conformant version string of the chart"
  value       = helm_release.this.metadata[0].version
}
