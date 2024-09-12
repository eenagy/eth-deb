name = "eth-node-reth-testnet"
bin_package = "eth-node-reth"
binary = "/usr/lib/eth-node-reth-testnet/run-reth-service.sh"
user = { name = "eth-node-reth-testnet", group = true, create = { home = false } }
runtime_dir = { mode = "750" }
# Service Fields
after = "multi-user.target"
service_type = "simple"
extra_service_config = """
# no need to specify, these come from debcrafter
# User=eth-node-reth-testnet
# NoNewPrivileges=true
# ProtectHome=true
# PrivateTmp=true
# PrivateDevices=true

# additional flags not specified by debcrafter
CapabilityBoundingSet=
IPAddressDeny=
LockPersonality=true
PrivateIPC=true
PrivateUsers=true
ProtectClock=true
ProtectControlGroups=true
ProtectHostname=true
ProtectKernelLogs=true
ProtectKernelModules=true
ProtectKernelTunables=true
ProtectProc=invisible
ReadWritePaths=/var/lib/eth-node-testnet/reth
ReadOnlyPaths=/var/lib/eth-node-testnet
RemoveIPC=true
RestrictAddressFamilies=AF_INET AF_INET6 AF_UNIX AF_NETLINK 

RestrictNamespaces=true
RestrictRealtime=true
RestrictSUIDSGID=true
SystemCallArchitectures=native
# SystemCallFilter=@system-service
UMask=0077
WorkingDirectory=/var/lib/eth-node-testnet/reth
"""
## hack to actually use system.d but let debcrafter manage the user creation
add_files = [
    "debian/scripts/run-reth-service.sh /usr/lib/eth-node-reth-testnet/", 
    "debian/scripts/run-reth.sh /usr/lib/eth-node-reth-testnet/bin/",
    "debian/tmp/eth-node-reth-testnet.service /lib/systemd/system/",
    "debian/scripts/postprocess.sh /usr/lib/eth-node-reth-testnet",
]
provides = ["eth-node-testnet-el-service"]
conflicts = ["eth-node-testnet-el-service"]
depends=["eth-node-testnet-config", "eth-node-testnet"]
summary = "service file for eth-node-reth for network: testnet"

[config."reth-testnet.conf".postprocess]
command = ["bash", "/usr/lib/eth-node-reth-testnet/postprocess.sh"]

[config."reth-testnet.conf"]
format = "plain"

[config."reth-testnet.conf".ivars."RETH_CLI_NODE_CHAIN"]
type = "string"
default = "$BASE_CONFIG_CUSTOM_NETWORK_GENESIS_FILE"
priority = "low"
summary = "Path to the custom network genesis file"

[config."reth-testnet.conf".ivars."RETH_CLI_NODE_DATADIR"]
type = "string"
default = "$BASE_CONFIG_DATA_DIR/reth"
priority = "low"
summary = "Data directory for the RETH node"

[config."reth-testnet.conf".ivars."RETH_CLI_NODE_AUTHRPC_JWTSECRET"]
type = "string"
default = "$BASE_CONFIG_SECRETS_FILE"
priority = "low"
summary = "JWT secret file for authentication"

[config."reth-testnet.conf".ivars."RETH_CLI_NODE_AUTHRPC_ADDR"]
type = "string"
default = "$BASE_CONFIG_ENGINE_IP"
priority = "low"
summary = "IP address for the authentication RPC"

[config."reth-testnet.conf".ivars."RETH_CLI_NODE_AUTHRPC_PORT"]
type = "string"
default = "$BASE_CONFIG_ENGINE_API_PORT"
priority = "low"
summary = "Port for the authentication RPC"

[config."reth-testnet.conf".ivars."RETH_CLI_NODE_HTTP"]
type = "string"
default = "true"
priority = "low"
summary = "Enable the HTTP-RPC server"

[config."reth-testnet.conf".ivars."RETH_CLI_NODE_HTTP_ADDR"]
type = "string"
default = ""
priority = "low"
summary = "HTTP server address to listen on"

[config."reth-testnet.conf".ivars."RETH_CLI_NODE_HTTP_PORT"]
type = "string"
default = "$BASE_CONFIG_EL_RPC_PORT"
priority = "low"
summary = "HTTP server port to listen on"

[config."reth-testnet.conf".ivars."RETH_CLI_NODE_HTTP_API"]
type = "string"
default = "eth"
priority = "low"
summary = "RPC modules for the HTTP server"

[config."reth-testnet.conf".ivars."RETH_CLI_NODE_HTTP_CORSDOMAIN"]
type = "string"
default = "localhost"
priority = "low"
summary = "CORS domain to allow requests from"

[config."reth-testnet.conf".ivars."RETH_CLI_NODE_LOG_FILE_DIRECTORY"]
type = "string"
default = "$BASE_CONFIG_DATA_DIR/reth/logs"
priority = "low"
summary = "Directory to store log files"