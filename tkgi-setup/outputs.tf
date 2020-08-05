output "pks_yml" {
  value = data.template_file.pks_config.rendered
}