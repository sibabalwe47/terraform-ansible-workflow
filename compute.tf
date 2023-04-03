data "aws_ami" "server_ami" {
  most_recent = true

  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

resource "random_id" "mtc_node_id" {
  byte_length = 2
}

resource "aws_key_pair" "mtc_auth" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

resource "aws_instance" "mtc_main" {
  count                  = var.instance_count
  instance_type          = var.instance_type
  ami                    = data.aws_ami.server_ami.id
  key_name               = aws_key_pair.mtc_auth.key_name
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

  # provisioner "local-exec" {
  #   command = "aws ec2 wait instance-status-ok --instance-ids ${self.id}"
  # }

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
