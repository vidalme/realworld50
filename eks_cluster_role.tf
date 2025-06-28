resource "aws_iam_role" "cluster_role" {
  name = "${local.name}-cluster-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "eks.amazonaws.com"
        }
      },
    ]
  })

  tags = local.tags
}

resource "aws_iam_role_policy_attachment" "cluster-attach-AmazonEKSClusterPolicy" {
  role       = aws_iam_role.cluster_role.name
  policy_arn = arn:aws:iam::aws:policy/AmazonEKSClusterPolicy
}

resource "aws_iam_role_policy_attachment" "cluster-attach-AmazonEKSVPCResourceController" {
  role       = aws_iam_role.cluster_role.name
  policy_arn = arn:aws:iam::aws:policy/AmazonEKSVPCResourceController
}