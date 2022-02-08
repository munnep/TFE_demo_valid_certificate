from diagrams import Cluster, Diagram, Edge
from diagrams.onprem.compute import Server
from diagrams.onprem.network import Internet
from diagrams.onprem.network import Nginx
from diagrams.aws.network    import Route53


# Variables
outformat = "png"
filename = "tfe_self_signed_certificate"
direction = "TB"


with Diagram(
    direction=direction,
    filename=filename,
    outformat=outformat,
) as diag:
    # Non Clustered
    user = Server("client")
    dns = Route53("Route53-DNS")
    tfe = Server("TFE server")
    internet = Internet("internet")
    terraform_io = Nginx("Terraform.io")
    
    # Diagram
    user >> internet >> dns
    user >> tfe >> internet >> terraform_io

diag
