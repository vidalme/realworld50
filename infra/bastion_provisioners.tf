
resource "null_resource" "bastion_provider" {
  depends_on = [module.ec2_public]
  connection {
    type        = "ssh"
    host        = aws_eip.bastion_eip.public_ip
    user        = "ec2-user"
    password    = ""
    private_key = file("private-key/realworld50.pem")
  }

  provisioner "file" {
    source      = "private-key/realworld50.pem"
    destination = "/tmp/realworld50.pem"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/realworld50.pem",
    ]
  }

  provisioner "local-exec" {
    command     = "echo 'vpc created on `date` and VPC ID: ${module.vpc.vpc_id}' >> creation-time-vpc-id.txt"
    working_dir = "local-exec-output-file"
  }
}
