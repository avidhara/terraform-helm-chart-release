# Terraform Module for Helm Release

## Prerequisites

- Terraform 0.12.x
- Helm 3.x(Latest plugin supports Helm 3 charts)

## Input variables

| Name                  | Description                                                                                                                                         | Type              | Default             |
| --------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------- | ------------------- |
| name                  | Release name                                                                                                                                        | String            | null                |
| chart                 | Chart name to be installed                                                                                                                          | string            | null                |
| repository            | Repository where to locate the requested chart. If is an URL the chart is installed without installing the repository                               | string            | null                |
| repository_key_file   | The repositories cert key file                                                                                                                      | string            | null                |
| repository_cert_file  | The repositories cert file                                                                                                                          | string            | null                |
| repository_ca_file    | The Repositories CA File                                                                                                                            | string            | null                |
| repository_username   | Username for HTTP basic authentication against the repository                                                                                       | string            | null                |
| repository_password   | Password for HTTP basic authentication against the reposotory                                                                                       | string            | null                |
| chart_version         | Specify the exact chart version to install. If this is not specified, the latest version is installed                                               | string            | null                |
| namespace             | The namespace to install the release into. Defaults to default                                                                                      | string            | default             |
| verify                | Verify the package before installing it. Defaults to false                                                                                          | bool              | false               |
| keyring               | Location of public keys used for verification. Used only if verify is true. Defaults to /.gnupg/pubring.gpg in the location set by home             | string            | /.gnupg/pubring.gpg |
| timeout               | Time in seconds to wait for any individual kubernetes operation. Defaults to 300 seconds.                                                           | number            | 300                 |
| disable_webhooks      | Prevent hooks from running. Defauts to false                                                                                                        | bool              | false               |
| reuse_values          | When upgrading, reuse the last release's values and merge in any overrides. If 'reset_values' is specified, this is ignored. Defaults to false      | bool              | false               |
| reset_values          | When upgrading, reset the values to the ones built into the chart. Defaults to false.                                                               | bool              | false               |
| force_update          | Force resource update through delete/recreate if needed. Defaults to false                                                                          | bool              | false               |
| recreate_pods         | Perform pods restart during upgrade/rollback. Defaults to false                                                                                     | bool              | false               |
| cleanup_on_fail       | Allow deletion of new resources created in this upgrade when upgrade fails. Defaults to false                                                       | bool              | true                |
| max_history           | Maximum number of release versions stored per release. Defaults to 0 (no limit).                                                                    | number            | 0                   |
| atomic                | If set, installation process purges chart on fail. The wait flag will be set automatically if atomic is used. Defaults to true                      | bool              | true                |
| skip_crds             | If set, no CRDs will be installed. By default, CRDs are installed if not already present. Defaults to false.                                        | bool              | false               |
| render_subchart_notes | If set, render subchart notes along with the parent. Defaults to true                                                                               | bool              | true                |
| wait                  | Will wait until all resources are in a ready state before marking the release as successful. It will wait for as long as timeout. Defaults to true. | bool              | true                |
| values                | List of values in raw yaml to pass to helm. Values will be merged, in order, as Helm does with multiple -f options                                  | list              | []                  |
| set                   | Value block with custom values to be merged with the values yaml.                                                                                   | list(map(string)) | []                  |
| set_string            | Value block with custom values to be merged with the values yaml.                                                                                   | list(map(string)) | []                  |
| set_sensitive         | Value block with custom sensitive values to be merged with the values yaml that won't be exposed in the plan's diff.                                | list(map(string)) | []                  |
| dependency_update     | Runs helm dependency update before installing the chart. Defaults to false.                                                                         | bool              | true                |
| replace               | Re-use the given name, even if that name is already used. This is unsafe in production. Defaults to false.                                          | bool              | false               |

**Note**: You can setup the variables using **.tfvars** or as env variables.

Link: https://www.terraform.io/docs/configuration/variables.html

### Use as a Module

```terrraform
module "helmredis" {
  source = "git::https://github.com/foss-cafe/terraform-helm-release.git/"
  name       = "my-redis-release"
  repository = data.helm_repository.stable.metadata[0].name
  chart      = "redis"
  chart_version    = "6.0.1"
  set = [{
    name  = "cluster.enabled"
    value = "true"
    },
    {
      name  = "metrics.enabled"
      value = "true"
    }
  ]
  set_string = [{
    name  = "service.annotations.prometheus\\.io/port"
    value = "9127"
    }
  ]
}
```

### Output variables

| Name      | Description                                                     |
| --------- | --------------------------------------------------------------- |
| chart     | The name of the chart                                           |
| name      | Name is the name of the release                                 |
| namespace | Namespace is the kubernetes namespace of the release            |
| revision  | Version is an int32 which represents the version of the release |
| status    | Status of the release                                           |
| version   | A SemVer 2 conformant version string of the chart               |
