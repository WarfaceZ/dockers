#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

read -p "Enter domain [your-domain].local: " domain
read -p "Enter template name (empty for default)": template

if [[ $template = "" ]]; then
  template='template'
fi

echo "Domain ${domain}.local will be create"
echo "Creating configuration to $SCRIPT_DIR/../conf/sites/custom/${domain}.conf"
cp $SCRIPT_DIR/../conf/sites/templates/${template}.conf $SCRIPT_DIR/../conf/sites/custom/${domain}.conf
sed -i "s/template/${domain}/" $SCRIPT_DIR/../conf/sites/custom/${domain}.conf
echo "Adding ${domain}.local to hosts"
echo "127.0.0.1       ${domain}.local" | sudo tee -a /etc/hosts