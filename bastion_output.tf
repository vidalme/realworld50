output "linux_bastion_ami" {
  value = data.aws_ami.linux_bastion_ami.name
}
