name = "eth-node-geth-lodestar-service-mainnet"
architecture = "any"
summary = "Simplified Ethereum node installation for {variant}, supporting clients: geth and lodestar."
conflicts = ["eth-node-mainnet"]
recommends = []
provides = ["eth-node-mainnet"]
suggests = []
depends = ["eth-node-geth", "eth-node-lodestar"]
add_files = []
add_manpages = []
long_doc = """eth-node-mainnet
By installing this package,
it will automatically set up a geth and lodestar client pair (consensus and execution client) for connecting
to the Ethereum mainnet network.
"""
