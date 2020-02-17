# LibClassicSpecs

Restores the retail specialization methods in Classic

Where possible this uses the same global spec ids as in retail.

## Usage

```lua
local LibClassicSpecs = LibStub("LibClassicSpecs")

local MAX_TALENT_TIERS                = _G.MAX_TALENT_TIERS or LibClassicSpecs.MAX_TALENT_TIERS
local NUM_TALENT_COLUMNS              = _G.NUM_TALENT_COLUMNS or LibClassicSpecs.NUM_TALENT_COLUMNS

local GetNumClasses                   = _G.GetNumClasses or LibClassicSpecs.GetNumClasses
local GetClassInfo                    = _G.GetClassInfo or LibClassicSpecs.GetClassInfo
local GetNumSpecializationsForClassID = _G.GetNumSpecializationsForClassID or LibClassicSpecs.GetNumSpecializationsForClassID

local GetActiveSpecGroup              = _G.GetActiveSpecGroup or LibClassicSpecs.GetActiveSpecGroup

local GetSpecialization               = _G.GetSpecialization or LibClassicSpecs.GetSpecialization
local GetSpecializationInfo           = _G.GetSpecializationInfo or LibClassicSpecs.GetSpecializationInfo
local GetSpecializationInfoForClassID = _G.GetSpecializationInfoForClassID or LibClassicSpecs.GetSpecializationInfoForClassID

local GetSpecializationRole           = _G.GetSpecializationRole or LibClassicSpecs.GetSpecializationRole
local GetSpecializationRoleByID       = _G.GetSpecializationRoleByID or LibClassicSpecs.GetSpecializationRoleByID
```
