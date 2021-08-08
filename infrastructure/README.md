# Temperature in Tallinn (Infrastructure)


### Pre-requisites
 - Terraform 1.x (`tfenv` is a recommended tool to manage tf binaries)
 - Azure account [register](https://azure.microsoft.com/en-us/free/)
 - The Azure CLI Tool [download](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)

### How to

Tarroform state must be stored remotely! \
three resources should be created manually to implement it(can be autamated later)

 - resource group  "production-resources" in "West Europe" location [docs](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/manage-resource-groups-portal)
 - storage account "terraformstatesd00001" [docs](https://docs.microsoft.com/en-us/azure/storage/common/storage-account-overview)
 - storage account container "tfstate" [docs](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-blobs-introduction)

### Infrastructure creation

 - Authorize in Azure cloud using the Azure CLI 
    ```bash
    az login
    ```
 - Generate rsa key pare to be able to ssh into instance "~/.ssh/id_rsa_cloudmore"
    ```bash
    ssh-keygen
    ```
 - Apply terraform 
   ```bash
    cd infrastructure
    terraform apply -auto-approve
    ```

### Todo

- [ ] Use TF workspaces (at least tfvars)
- [ ] Do not expose virtual machines directly into internet (Implement internet gateway or at least bastion server)
- [ ] Move hardcoded variables into variables file
- [ ] Automate bootstrap process
- [ ] Improve rsa key delivery (store the key inside the cloud)
- [ ] Add proper domain name (Cloud DNS + freenom.com)
