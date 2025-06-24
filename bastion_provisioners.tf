
resource "null_resource" "bastion_provider" {
    depends_on = [module.ec2_public]
    connection {
        type        = "ssh"
        host        = aws_eip.bastion_eip.public_ip
        user        = "ec2_user"
        password    = ""
        private_key = file("private-key/hangar18.pem")
    }

    provisioner "file" {
        source = "private-key/hangar18.pem"
        destination = "/tmp/hangar18.pem"
    }

    provisioner "remote-exec" {
        inline = [
            "sudo chmod 400 /tmp/hangar18.pem",
        ]
    }

    provisioner "local-exec" {
        command = "echo 'vpc created on `date` and VPC ID: ${module.vpc.vpc_id}' >> creation-time-vpc-d.txt"
        working_dir = 'local-exec-output-file'
    }
}