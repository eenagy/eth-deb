name = "eth-node-nethermind-nimbus-eth2-service-mainnet"
architecture = "any"
summary = "Simplified Ethereum node installation for {variant}, supporting clients: nethermind and nimbus-eth2."
conflicts = ["eth-node-mainnet"]
recommends = []
provides = ["eth-node-mainnet"]
suggests = []
depends = ["eth-node-nethermind", "eth-node-nimbus-eth2"]
add_files = []
add_manpages = []
long_doc = """eth-node-mainnet
By installing this package,
it will automatically set up a nethermind and nimbus-eth2 client pair (consensus and execution client) for connecting
to the Ethereum mainnet network.
"""
