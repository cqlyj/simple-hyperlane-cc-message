include .env

all: install build

build :; @forge build

install:
	@forge install hyperlane-xyz/hyperlane-monorepo@bdccf29ee387dc671c3b42383cb5cdf1bd6689f3 --no-commit

deploy-sender:
	@forge script script/DeploySender.s.sol:DeploySender --rpc-url $(SEPOLIA_RPC_URL) --account burner --sender 0xFB6a372F2F51a002b390D18693075157A459641F --broadcast --verify --etherscan-api-key ${ETHERSCAN_API_KEY} -vvvv

deploy-receiver:
	@forge script script/DeployReceiver.s.sol:DeployReceiver --rpc-url $(POLYGON_RPC_URL) --account burner --sender 0xFB6a372F2F51a002b390D18693075157A459641F --broadcast --verify --etherscan-api-key ${AMOY_ETHERSCAN_API_KEY} -vvvv