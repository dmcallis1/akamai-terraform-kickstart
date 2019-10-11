/*

  Define the contract name as it exists in Luna control center.
  This can be found in Luna as the 'top level contract group' under:

  'Account Admin' -> 'Contracts' -> (select contract) -> 'Groups' tab
 
*/

data "akamai_contract" "default" {
  group = ""
}

/*

  The fully qualified name of the group you wish to associate with the provider, as it appears in luna

*/

data "akamai_group" "default" {
	name = ""
}

data "akamai_cp_code" "default" {
   /*

    Use this method for pulling details of existing CP Codes (not TF-managed)

    The name of the CP Code as it appears in Luna:

    'Account Admin' -> 'CP Codes' -> (Search for CP Code to use)

   */

   name = ""
   group = "${data.akamai_group.default.id}"
   contract = "${data.akamai_contract.default.id}"
}



/* Data source for rule tree tokenization */
data "template_file" "init" {

  # The below value assumes 'rules.json' is tokenized and lives in the same directory as the other .tf files
  template = "${file("${path.module}/rules.json")}"
  vars = {

    /*
  
      List variable replacement mapping, as defined in 'variables.tf'

    */
    origin = "${var.origin}"
    mpulse-api = "${var.mpulse-api}"
  }
}