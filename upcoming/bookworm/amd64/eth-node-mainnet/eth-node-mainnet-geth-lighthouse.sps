name = "eth-node-geth-lighthouse-service-mainnet"
architecture = "any"
summary = "Simplified Ethereum node installation for {variant}, supporting clients: geth and lighthouse."
conflicts = ["eth-node-mainnet"]
recommends = []
provides = ["eth-node-mainnet"]
suggests = []
depends = ["eth-node-geth", "eth-node-lighthouse"]
add_files = []
add_manpages = []
long_doc = """eth-node-mainnet
By installing this package,
it will automatically set up a geth and lighthouse client pair (consensus and execution client) for connecting
to the Ethereum mainnet network.
"""
