{-# LANGUAGE DataKinds #-}
{-# LANGUAGE LambdaCase #-}

module Cardano.CLI.Legacy.Commands.Genesis
  ( LegacyGenesisCmds (..)
  , renderLegacyGenesisCmds
  ) where

import           Cardano.Api.Shelley

import           Cardano.Chain.Common (BlockCount)
import           Cardano.CLI.Types.Common

import           Data.Text (Text)

data LegacyGenesisCmds
  = GenesisCreate
      KeyOutputFormat
      GenesisDir
      Word
      Word
      (Maybe SystemStart)
      (Maybe Lovelace)
      NetworkId
  | GenesisCreateCardano
      GenesisDir
      Word
      Word
      (Maybe SystemStart)
      (Maybe Lovelace)
      BlockCount
      Word
      Rational
      NetworkId
      FilePath
      FilePath
      FilePath
      FilePath
      (Maybe FilePath)
  | GenesisCreateStaked
      KeyOutputFormat
      GenesisDir
      Word
      Word
      Word
      Word
      (Maybe SystemStart)
      (Maybe Lovelace)
      Lovelace
      NetworkId
      Word
      Word
      Word
      (Maybe FilePath) -- ^ Relay specification filepath
  | GenesisKeyGenGenesis
      (VerificationKeyFile Out)
      (SigningKeyFile Out)
  | GenesisKeyGenDelegate
      (VerificationKeyFile Out)
      (SigningKeyFile Out)
      (OpCertCounterFile Out)
  | GenesisKeyGenUTxO
      (VerificationKeyFile Out)
      (SigningKeyFile Out)
  | GenesisCmdKeyHash
      (VerificationKeyFile In)
  | GenesisVerKey
      (VerificationKeyFile Out)
      (SigningKeyFile In)
  | GenesisTxIn
      (VerificationKeyFile In)
      NetworkId
      (Maybe (File () Out))
  | GenesisAddr
      (VerificationKeyFile In)
      NetworkId
      (Maybe (File () Out))
  | GenesisHashFile
      GenesisFile
  deriving Show

renderLegacyGenesisCmds :: LegacyGenesisCmds -> Text
renderLegacyGenesisCmds = \case
  GenesisCreate {} -> "genesis create"
  GenesisCreateCardano {} -> "genesis create-cardano"
  GenesisCreateStaked {} -> "genesis create-staked"
  GenesisKeyGenGenesis {} -> "genesis key-gen-genesis"
  GenesisKeyGenDelegate {} -> "genesis key-gen-delegate"
  GenesisKeyGenUTxO {} -> "genesis key-gen-utxo"
  GenesisCmdKeyHash {} -> "genesis key-hash"
  GenesisVerKey {} -> "genesis get-ver-key"
  GenesisTxIn {} -> "genesis initial-txin"
  GenesisAddr {} -> "genesis initial-addr"
  GenesisHashFile {} -> "genesis hash"
