name = "eth-node-mainnet-service-prysm"
bin_package = "eth-node-config-prysm"
binary = "/usr/bin/run-prysm.sh"
conf_param = "--conf-file"
user = { group = true, create = { home = false } }
runtime_dir = { mode = "750" }
extra_service_config = """
"""
## hack to actually use system.d but let debcrafter manage the user creation
add_files = ["debian/lib/systemd /lib"]
provides = ["eth-node-mainnet-cl-service"]
conflicts = ["eth-node-mainnet-cl-service"]
depends=["eth-node-config-prysm", "eth-node-mainnet-config"]
summary = "systemd service files for eth-node-prysm using eth-node-config-prysm and eth-node-mainnet-config"