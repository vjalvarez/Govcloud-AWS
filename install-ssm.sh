#!/bin/bash
mkdir tmp
cd tmp
wget https://s3.us-gov-west-1.amazonaws.com/amazon-ssm-us-gov-west-1/latest/linux_amd64/amazon-ssm-agent.rpm
cat > amazon-ssm-agent.gpg << EOF 
-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v2.0.22 (GNU/Linux)

mQENBF98p2YBCADgfK6NJS/1UFMEBq+DbHrLGCPR7uabN7KByIWJ6X0gGqxad0y7
kP+M2YhWVlteeytpJgEEzKFIXkv7vZdRIjCrgIiNISdvDyYOTNQ2n5Ck5XPnJTQg
n5HIRccvc+Lwdidl8auiCYteDCDCGM5EPb7vUrbrg+y4RkXeBNErzo7rbVnWW4QC
z8x6EVLb24w/AONHLxywwunagorWiVBP6snrBoz2d2wQYAfpPmPsoLRAURiMnubG
bDOM9hb5bGi2OY92L9fVChVRGJnxMNYPCQWFyUovRis9fKnmP1LopUmlNSmSqUj1
AD7WRDMGn2Ruf+HYEZuY+pDD/C2ejcJtjDJTABEBAAG0J1NTTSBBZ2VudCA8c3Nt
LWFnZW50LXNpZ25lckBhbWF6b24uY29tPokBPwQTAQIAKQUCX3ynZgIbLwUJAsaY
gAcLCQgHAwIBBhUIAgkKCwQWAgMBAh4BAheAAAoJEFT09W5pPsohHGQIALMvf8oq
wEU5gph5SlrjYTIqZqsvyV8RKsUEFin5EDkeLC5ALpsby6rAWnobCy2Ce1p4buS+
sA/PFKkraVWtpmqOOkCZoBJTWZyR3KtY7y2pTUWl7aaj20NEO/nPI1VH/E47iH7m
scYAOxbNOcEbRiip7AdXZXK7nKda51q/b6G92fM86pl8VPBAh6ijMNmEEZxIAWH2
AGY7Y9imwnp+UpUUwsJb3/L0asqMecPrYJLGWke6EYGPuDfxYb1+YOuZOY/mjDJJ
z6f7G2nCuDMniabydk3269eLRPuRHUq4P5Sv+I/zdJI4B8lOJfJRpy/mwGwAU74l
s7csneMjUO2zIzaJAhwEEAECAAYFAl98p2YACgkQfdCXo9rX9fzFHw//akOS57o3
lyQySKmbEpAhDrEcg4NGqidlp3NjqkxKmmK5GMwC+wJS+hmwuBiMH1knSaxc/0ie
XmtxHsmDn8JmREypkfUS+vAONlmsuFJUjXipa5cAP4YjPMTW7HNxC/WrLV6NSuQZ
5nweVeXAQPxjOoNaAOOk1hlUuGdypPxCNV6NYLm5W7jz1buDYOhNwPvVP63wy1BK
ME4HzE94ggCxnXdafJU2KR11Mj/9LRFeDJ8X8huSKOFNOy2IotuW5VmxlDvbkvDT
ceelqWJjh5CsWKmWActoxqtyiedQqxgsxFuwqVIWxP758C3NP1zpxvr8SXxdJBy3
8U4iHC3I89zlX4x4tPiMn3vQOq+RhnZEzEphrmPkQAaq6H160hHxQz44DoM8jDIn
f/EbWKPkw+p5679JUrXIZDOYP2OlbKoAY4axfCwvjIqAQ5KWFQyKmWyoRwTl4IrC
bAXqljtqzyF20g2puNpxpvxT8CF+YaKYPKqXAbZkBQoOoPBbEGGG19BX5rCBehTx
QwBAgmmk7FG162TY2uivbwjmguh4DM4PgEoHtsgg9UVM+A+M5tIuEeTC5jWgzEcf
VkwTY6N+3XNvAnYNobND8mvN+QAJG7NpryX1fNBaxGsze3QBL42v/zFmG6VSfINp
4H01UHp8Pmidk8axmi+w6hoqB+uDo3lgd6U=
=c8Y2
-----END PGP PUBLIC KEY BLOCK-----
EOF
echo Importing gpg key
gpg --import amazon-ssm-agent.gpg
gpg --list-keys
gpg --fingerprint
wget https://s3.us-gov-west-1.amazonaws.com/amazon-ssm-us-gov-west-1/latest/linux_amd64/amazon-ssm-agent.rpm.sig
gpg --verify amazon-ssm-agent.rpm.sig amazon-ssm-agent.rpm
sudo rpm --import amazon-ssm-agent.gpg
sudo yum install -y amazon-ssm-agent.rpm
sudo systemctl enable amazon-ssm-agent
