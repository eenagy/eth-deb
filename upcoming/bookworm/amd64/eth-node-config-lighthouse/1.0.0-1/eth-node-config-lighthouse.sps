name = "eth-node-config-lighthouse"
architecture = "any"
conflicts = []
recommends = []
provides = ["eth-node-mainnet-cl-config"]
suggests = []
depends=["eth-node-lighthouse"]
add_files = [
    "debian/scripts/run-lighthouse.sh /usr/lib/eth-node-config-lighthouse/bin/",
    "debian/conf.d/lighthouse-mainnet.conf /etc/eth-node-mainnet/lighthouse/conf.d/"
]
add_links = []
add_manpages = []
summary = "Simple config and run script to run lighthouse through standardized config files, based on eth-pkg/run-a-node"
long_doc = """eth-node-config-lighthouse
By installing this package,
it will automatically it will install run-lighthouse.sh script and 
lighthouse minimal configs for each supported network, which you can use in tandem
with eth-node-[network]-config to spin up lighthouse. 
See eth-node-[network]-service-lighthouse package for how that is working.
"""