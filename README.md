# ohai-scaleway Cookbook

This recipe installs an ohai plugin on your machine to use the
metadata of your Scaleway server in your recipes.  It that will
populate `node[scw]` with the content of `scw-metadata`.

## Requirements

### Platforms

- Scaleway hardware, Linux

### Chef

- Chef 12.0 or later
- The plugin is installed in the `ohai/plugins` folder of your chef conf folder (usually /etc/chef). The plugin folder must be your `ohai.plugin_path` (Can bet set in chef-client.config).

On standard setup, you can just add `ohai.plugin_path << '/etc/chef/ohai/plugins'` to `/etc/chef/chef-client.rb`

### Cookbooks

- `ohai` - ohai-scaleway needs the `ohai` cookbook to install the plugin

## Attributes

This cookbook can't be configured with any attribute, but the ohai
plugin exports many automatic attributes. It exports any item returned
by the `scw-metadata` util, with the key in lowercase. Useful
attributes include:

- `name`: The name of the server
- `public_ip_address`: The public IP of your server
- `private_ip`: The private IP address of your server
- `ssh_public_keys`: The public keys defined in your account
- `commercial_type`: 'C1' or 'VC1M' for example
- `ipv6_address`
- `ipv6_netmask`
- `ipv6_gateway`

## Usage

### ohai-scaleway::default

Just include `ohai-scaleway` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[ohai-scaleway]"
  ]
}
```

## Contributing

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

## License and Authors

This code is provided with ABSOLUTELY NO WARRANTY under the 'Do What the Fuck You Want to Public License (WTFPL)'

Authors:
  - Julien `Lta` BALLET <contact 'AT' lta.io>
