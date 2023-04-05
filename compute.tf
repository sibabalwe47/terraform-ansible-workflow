data "aws_ami" "server_ami" {
  owners      = ["amazon"]
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
}

resource "random_id" "mtc_node_id" {
  byte_length = 2
}

# resource "aws_key_pair" "mtc_auth" {
#   key_name   = "${var.key_name}-${random_id.mtc_node_id.hex}"
#   public_key = file(var.public_key_path)
# }

# resource "aws_instance" "mtc_main" {
#   count         = var.instance_count
#   subnet_id     = aws_subnet.mtc_public_subnet[count.index].id
#   ami           = "ami-00c39f71452c08778"
#   instance_type = var.instance_type
#   root_block_device {
#     volume_size = var.main_vol_size
#   }
#   user_data = <<-EOF
#     #!/bin/bash
#     sudo yum update -y
#     sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
#     sudo rpm — import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
#     sudo yum upgrade -y
#     sudo amazon-linux-extras install java-openjdk11 -y
#     sudo yum install jenkins -y
#     sudo systemctl enable jenkins
#     sudo systemctl start jenkins
#   EOF

#   lifecycle {
#     create_before_destroy = true
#   }

#   vpc_security_group_ids = [aws_security_group.mtc_sg.id]

#   tags = {
#     "Name" = "mtc_main-${random_id.mtc_node_id.dec}"
#   }



# }

resource "aws_instance" "mtc_main" {
  count         = var.instance_count
  instance_type = var.instance_type
  ami           = data.aws_ami.server_ami.id
  #key_name               = aws_key_pair.mtc_auth.key_name
  vpc_security_group_ids = [aws_security_group.mtc_sg.id]
  subnet_id              = aws_subnet.mtc_public_subnet[count.index].id
  user_data = templatefile("./main-userdata.tpl", {
    new_hostname = "mtc_main-${random_id.mtc_node_id.dec}"
  })
  root_block_device {
    volume_size = var.main_vol_size
  }


  lifecycle {
    create_before_destroy = true
  }

  provisioner "local-exec" {
    when    = destroy
    command = "sed -i '/^[0-9]/d' aws_hosts"
  }

  tags = {
    "Name" = "mtc_main-${random_id.mtc_node_id.dec}"
  }
}

# resource "null_resource" "main_nodes_bootstrap" {
#   depends_on = [
#     aws_instance.mtc_main
#   ]

#   provisioner "local-exec" {
#     command = "ansible-playbook  ~/playbooks/main.yml"
#   }
# }
