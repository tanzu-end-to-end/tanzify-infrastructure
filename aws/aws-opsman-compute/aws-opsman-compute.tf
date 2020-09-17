
data "aws_ami" "ami" {
  owners      = ["364390758643"]
  most_recent = true

  filter {
    name   = "name"
    values = ["pivotal-ops-manager-v${var.opsman_version}-build.${var.opsman_build}"]
  }
}

resource "aws_instance" "ops_manager" {
  ami                    = data.aws_ami.ami.id
  instance_type          = var.ops_manager_instance_type
  key_name               =  "${var.environment_name}-ops-manager-key"
  vpc_security_group_ids = [var.ops_manager_security_group_id]
  source_dest_check      = false
  subnet_id              = element(var.public_subnet_ids, 0)
  iam_instance_profile   = var.ops_manager_iam_instance_profile_name

  root_block_device {
    volume_type = "gp2"
    volume_size = 150
  }

  tags = merge(var.tags, map("Name", "${var.environment_name}-ops-manager"))
}

resource "aws_eip" "ops_manager" {
  vpc      = true
  instance = aws_instance.ops_manager.id

  tags = merge(
  var.tags,
  { "Name" = "${var.environment_name}-ops-manager-eip" },
  )

  connection {
    host        = self.public_ip
    user        = "ubuntu"
    private_key = var.ops_manager_ssh_private_key
  }

  // Use this to make sure OpsManager is given time to boot before subsequent modules proceed
  provisioner "remote-exec" {
    inline = [
      "date",
    ]
  }
}