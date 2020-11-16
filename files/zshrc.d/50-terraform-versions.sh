# shellcheck shell=bash

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
    TF_DIR="${TF_BASE}/${TF_VERSION}"
    TF_BINARY="${TF_DIR}/terraform"

    if [[ ! -a ${TF_BINARY} ]]; then
      echo "Terraform ${TF_VERSION} is not installed. Hang tight..."
      sudo mkdir -p "${TF_DIR}"
      pushd "${TF_DIR}" || { echo "Failed to pushd to ${TF_DIR}" ; exit 1; }
      sudo wget "https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_darwin_amd64.zip"
      sudo unzip "terraform_${TF_VERSION}_darwin_amd64.zip"
      sudo rm -f "terraform_${TF_VERSION}_darwin_amd64.zip"
      popd || { echo "Failed to popd" ; exit 1; }
    fi

    sudo ln -sf "${TF_BINARY}" /usr/local/bin/terraform
    /usr/local/bin/terraform -version
  fi

}
