function use_terraform {

  TF_BASE=/opt/terraform

  if [ -z "$1" ]
  then
    echo "Usage: use_terraform X.Y.Z"
    echo
    echo "This Terraform versions are available in the system:"
    ls -1 ${TF_BASE}
  else
    TF_VERSION=$1

    if [[ ! -a ${TF_BASE}/${TF_VERSION}/terraform ]]; then
      echo "Terraform ${TF_VERSION} is not installed. Hang tight..."
      sudo mkdir -p ${TF_BASE}/${TF_VERSION}
      pushd ${TF_BASE}/${TF_VERSION}
      sudo wget "https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_darwin_amd64.zip"
      sudo unzip terraform_${TF_VERSION}_darwin_amd64.zip
      sudo rm -f terraform_0.7.9_darwin_amd64.zip
      popd
    fi

    sudo ln -sf ${TF_BASE}/${TF_VERSION}/terraform /usr/local/bin/terraform
    /usr/local/bin/terraform -version
  fi

}