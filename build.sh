#!/bin/sh -e

cabal build
mkdir -p .aws-sam/build/HelloWorldFunction/
cp /home/kevin/src/haskell-aws-lambda-sam-nix/dist-newstyle/build/x86_64-linux/ghc-8.10.7/haskell-aws-lambda-sam-nix-0.1.0.0/x/haskell-aws-lambda-sam-nix/build/haskell-aws-lambda-sam-nix/haskell-aws-lambda-sam-nix .aws-sam/build/HelloWorldFunction/bootstrap
cp /home/kevin/src/haskell-aws-lambda-sam-nix/dist-newstyle/build/x86_64-linux/ghc-8.10.7/haskell-aws-lambda-sam-nix-0.1.0.0/x/haskell-aws-lambda-sam-nix/build/haskell-aws-lambda-sam-nix/haskell-aws-lambda-sam-nix HelloWorldFunction/bootstrap
cp template.yaml .aws-sam/build/
cp template.yaml HelloWorldFunction/