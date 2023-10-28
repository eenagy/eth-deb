name = "eth-node-geth-service-@variant"
bin_package = "geth"
binary = "/usr/share/geth/geth"
conf_param = "-conf="
user = { group = true }
depends = ["eth-node-geth-config-{variant}", "eth-node-geth-cli"]
provides = ["eth-node-execution-client-service"]
summary = "Service package for geth"
runtime_dir = { mode = "0755" }


[map_variants.insert_header]
mainnet = ""