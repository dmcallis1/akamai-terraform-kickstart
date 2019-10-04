/*

Reference the provider documentation below for more information:

https://www.terraform.io/docs/providers/akamai/

Note: attributes can be initialized via TF variables. This is helpful if using secrets management like Vault.

*/

provider "akamai" {
    
    # Path to edgerc file (ex: /home/ubuntu/.edgerc)
    edgerc = ""

    # Edgerc credentials section for Property Manager API authorization (ex: "default")
    papi_section = ""

    # Edgerc credentials section for FastDNS (ex: "default")
    dns_section = ""
}