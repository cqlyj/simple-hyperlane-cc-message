# Simple Hyperlane Cross Chain Message Passing

This is a simple example of how to pass general messages between **Sepolia** and **PolygonAmoy** chains with the help of **Hyperlane**.

# Getting Started

## Requirements

- [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
  - You'll know you did it right if you can run `git --version` and you see a response like `git version x.x.x`
- [foundry](https://getfoundry.sh/)
  - You'll know you did it right if you can run `forge --version` and you see a response like `forge 0.3.0 (5a8bd89 2024-12-19T17:17:10.245193696Z)`

## Quickstart

```
git clone https://github.com/cqlyj/simple-hyperlane-cc-message
cd simple-hyperlane-cc-message
make
```

# Usage

1. Set up your environment variables:

```bash
cp .env.example .env
```

2. Deploy the contracts:

```bash
make deploy-sender
make deploy-receiver
```

3. Send a message from **Sepolia** to **PolygonAmoy**:

```bash
make send-message
```

And you can grab the transaction to [**Hyperlane Explorer**](https://explorer.hyperlane.xyz/) to check the message status.

4. After the message is sent, you can check the message status on the receiver chain:

```bash
make get-last-message
```

You would find the message `Hello, world` on the receiver chain!

## Contact

Luo Yingjie - [luoyingjie0721@gmail.com](luoyingjie0721@gmail.com)
