name = "eth-node-geth-teku-service-sepolia"
architecture = "any"
summary = "Simplified Ethereum node installation for {variant}, supporting clients: geth and teku."
conflicts = ["eth-node-service-sepolia"]
recommends = []
provides = ["eth-node-service-sepolia"]
suggests = []
depends = []
add_files = []
add_manpages = []
long_doc = """eth-node-service-sepolia
By installing this package,
it will automatically set up a geth and teku client pair (consensus and execution client) for connecting
to the Ethereum sepolia network.
"""
