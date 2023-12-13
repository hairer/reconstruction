import Lake
open Lake DSL

-- These are additional settings which do not affect the lake hash,
-- so they can be enabled in CI and disabled locally or vice versa.
-- Warning: Do not put any options here that actually change the olean files,
-- or inconsistent behavior may result
def weakLeanArgs : Array String :=
  if get_config? CI |>.isSome then
    #["-DwarningAsError=true"]
  else
    #[]

package Reconstruction where
  leanOptions := #[
    ⟨`relaxedAutoImplicit, true⟩, -- prevents typos to be interpreted as new free variables
    ⟨`pp.unicode.fun, true⟩, -- pretty-prints `fun a ↦ b`
    ⟨`pp.proofs.withType, false⟩]
  weakLeanArgs := weakLeanArgs

-- fix a mathlib version for formalization projects to prevent breakage from `lake update`
-- better bump it routinely in separate PRs and keep it matching lean-toolchain
-- in case new features and fixes landed into mathlib4 recently are needed
require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.4.0-rc1"

-- This is run only if we're in `dev` mode. This is so not everyone has to build doc-gen
meta if get_config? env = some "dev" then
require «doc-gen4» from git
  "https://github.com/leanprover/doc-gen4" @ "main"

@[default_target]
lean_lib Reconstruction
