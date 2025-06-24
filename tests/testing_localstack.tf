


# resource "aws_instance" "web-server" {
#   ami           = "ami-0c55b159cbfafe1f0" # Example AMI, replace with a valid one
#   instance_type = "t2.micro"
#   count         = 100
#   tags = {
#     Name = "web-server-${count.index + 1}"
#   }
# }