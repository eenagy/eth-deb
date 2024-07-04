name = "eth-node-nethermind-lighthouse-service-holesky"
architecture = "any"
summary = "Simplified Ethereum node installation for {variant}, supporting clients: nethermind and lighthouse."
conflicts = ["eth-node-holesky"]
recommends = []
provides = ["eth-node-holesky"]
suggests = []
depends = ["eth-node-nethermind", "eth-node-lighthouse"]
add_files = []
add_manpages = []
long_doc = """eth-node-holesky
By installing this package,
it will automatically set up a nethermind and lighthouse client pair (consensus and execution client) for connecting
to the Ethereum holesky network.
"""
