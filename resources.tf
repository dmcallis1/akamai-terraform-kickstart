resource "akamai_edge_hostname" "myhostname" {
    edge_hostname = "www.example.com.edgekey.net"
    group = "${data.akamai_group.default.id}"
    contract = "${data.akamai_contract.default.id}"
    product = "${var.product_id}"

    # The CPS enrollment ID which can support the edge hostname, defined above
    certificate = "${var.enrollment_id}"
    ipv4 = true
    ipv6 = true
}

resource "akamai_cp_code" "myCPCode" {

    # Using a akamai_cp_code resource will result in a TF-managed CP Code

    contract = "${data.akamai_contract.default.id}"
    group    = "${data.akamai_group.default.id}"
    name = "myCPCodeName"
    product = "${var.product_id}"
}

resource "akamai_property" "myProperty" {

    # Replace with the intended property name
    name    = "MyProperty"
    contact = ["email@example.com"]

    # The product class - 'prd_SPM' = Ion Premier
    product  = "prd_SPM"
    contract = "${data.akamai_contract.default.id}"
    group    = "${data.akamai_group.default.id}"
    cp_code  = "${akamai_cp_code.myCPCode.id}"

    /*

        The desired rule tree format
        https://developer.akamai.com/api/core_features/property_manager/v1.html#understandingruleformats

    */

    rule_format = "v2018-09-12"
    
    # The rendered template_file, as defined in data.tf
    rules       = "${data.template_file.init.rendered}"

    /*

        Map hostname to edge hostname, defined above.

    */
    hostnames = {
        "www.example.com" = "${akamai_edge_hostname.myhostname.edge_hostname}"
    }
}

/* 
    The second 'resource' parameter is the property name

*/
resource "akamai_property_activation" "MyProperty" {

    # Note reference to the 'akamai_property' resource directly above
    property = "${akamai_property.myProperty.id}"
    version = "${akamai_property.myProperty.version}"
    # The activation network
    network = "PRODUCTION"
    contact = ["email@example.com"]
    activate = true 
}