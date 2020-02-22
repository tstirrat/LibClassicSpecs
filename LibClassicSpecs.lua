local MAJOR, MINOR = "LibClassicSpecs", "@project-version@"
local LibClassicSpecs = LibStub:NewLibrary(MAJOR, MINOR)

if (LibClassicSpecs) then
  LibClassicSpecs.MAX_TALENT_TIERS = 7
  LibClassicSpecs.NUM_TALENT_COLUMNS = 4

  -- TODO(#4): displayName param should be i18n
  local Warrior = {
    ID = 1,
    displayName = "Warrior",
    name = "WARRIOR",
    Arms = 71,
    Fury = 72,
    Prot = 73
  }
  local Paladin = {
    ID = 2,
    displayName = "Paladin",
    name = "PALADIN",
    Holy = 65,
    Prot = 66,
    Ret = 70
  }
  local Hunter = {ID = 3, displayName = "Hunter", name = "HUNTER", BM = 253, MM = 254, SV = 255}
  local Rogue = {
    ID = 4,
    displayName = "Rogue",
    name = "ROGUE",
    Assasin = 259,
    Combat = 260,
    Sub = 261
  }
  local Priest = {
    ID = 5,
    displayName = "Priest",
    name = "PRIEST",
    Disc = 256,
    Holy = 257,
    Shadow = 258
  }
  local DK = {
    ID = 6,
    displayName = "Death knight",
    name = "DEATHKNIGHT",
    Blood = 250,
    Frost = 251,
    Unholy = 252
  }
  local Shaman = {
    ID = 7,
    displayName = "Shaman",
    name = "SHAMAN",
    Ele = 262,
    Enh = 263,
    Resto = 264
  }
  local Mage = {ID = 8, displayName = "Mage", name = "MAGE", Arcane = 62, Fire = 63, Frost = 64}
  local Warlock = {
    ID = 9,
    displayName = "Warlock",
    name = "WARLOCK",
    Affl = 265,
    Demo = 266,
    Destro = 267
  }
  local Monk = {ID = 10, displayName = "Monk", name = "MONK", BRM = 268, WW = 269, MW = 270}
  local Druid = {
    ID = 11,
    displayName = "Druid",
    name = "DRUID",
    Balance = 102,
    Feral = 103,
    Guardian = 104,
    Resto = 105
  }
  local DH = {ID = 12, displayName = "Demon hunter", name = "DEMONHUNTER", Havoc = 577, Veng = 581}

  LibClassicSpecs.Class = {
    Warrior = Warrior,
    Paladin = Paladin,
    Hunter = Hunter,
    Rogue = Rogue,
    Priest = Priest,
    DK = DK,
    Shaman = Shaman,
    Mage = Mage,
    Warlock = Warlock,
    Monk = Monk,
    Druid = Druid,
    DH = DH,
  }

  local ClassByID = {
    Warrior,
    Paladin,
    Hunter,
    Rogue,
    Priest,
    DK,
    Shaman,
    Mage,
    Warlock,
    Monk,
    Druid,
    DH
  }

  local Stat = {
    Strength = 1,
    Agility = 2,
    Stamina = 3,
    Intellect = 4,
    Spirit = 5
  }

  LibClassicSpecs.Stat = Stat

  local Role = {
    Damager = "DAMAGER",
    Tank = "TANK",
    Healer = "HEALER"
  }

  LibClassicSpecs.Role = Role

  -- Map of spec (tab) index to spec id
  local NAME_TO_SPEC_MAP = {
    [Warrior.name] = {Warrior.Arms, Warrior.Fury, Warrior.Prot},
    [Paladin.name] = {Paladin.Holy, Paladin.Prot, Paladin.Ret},
    [Hunter.name] = {Hunter.BM, Hunter.MM, Hunter.SV},
    [Rogue.name] = {Rogue.Assasin, Rogue.Combat, Rogue.Sub},
    [Priest.name] = {Priest.Disc, Priest.Holy, Priest.Shadow},
    [DK.name] = {DK.Blood, DK.Frost, DK.Unholy},
    [Shaman.name] = {Shaman.Ele, Shaman.Enh, Shaman.Resto},
    [Mage.name] = {Mage.Arcane, Mage.Fire, Mage.Frost},
    [Warlock.name] = {Warlock.Affl, Warlock.Demo, Warlock.Destro},
    [Monk.name] = {Monk.BRM, Monk.WW, Monk.MW},
    [Druid.name] = {Druid.Balance, Druid.Feral, Druid.Resto},
    [DH.name] = {DH.Havoc, DH.Veng}
  }

  -- Detailed info for each spec
  local SpecInfo = {
    [Warrior.Arms] = {
      ID = Warrior.Arms,
      name = "Arms",
      description = "",
      icon = "",
      background = "",
      role = Role.Damager,
      isRecommended = false,
      primaryStat = Stat.Strength
    },
    [Warrior.Fury] = {
      ID = Warrior.Fury,
      name = "Fury",
      description = "",
      icon = "",
      background = "",
      role = Role.Damager,
      isRecommended = true,
      primaryStat = Stat.Strength
    },
    [Warrior.Prot] = {
      ID = Warrior.Prot,
      name = "Protection",
      description = "",
      icon = "",
      background = "",
      role = Role.Tank,
      isRecommended = false,
      primaryStat = Stat.Strength
    },
    [Paladin.Holy] = {
      ID = Paladin.Holy,
      name = "Holy",
      description = "",
      icon = "",
      background = "",
      role = Role.Healer,
      isRecommended = false,
      primaryStat = Stat.Intellect
    },
    [Paladin.Prot] = {
      ID = Paladin.Prot,
      name = "Protection",
      description = "",
      icon = "",
      background = "",
      role = Role.Tank,
      isRecommended = false,
      primaryStat = Stat.Strength
    },
    [Paladin.Ret] = {
      ID = Paladin.Ret,
      name = "Retribution",
      description = "",
      icon = "",
      background = "",
      role = Role.Damager,
      isRecommended = true,
      primaryStat = Stat.Strength
    },
    [Hunter.BM] = {
      ID = Hunter.BM,
      name = "Beast Mastery",
      description = "",
      icon = "",
      background = "",
      role = Role.Damager,
      isRecommended = true,
      primaryStat = Stat.Agility
    },
    [Hunter.MM] = {
      ID = Hunter.MM,
      name = "Marksman",
      description = "",
      icon = "",
      background = "",
      role = Role.Damager,
      isRecommended = true,
      primaryStat = Stat.Agility
    },
    [Hunter.SV] = {
      ID = Hunter.SV,
      name = "Survival",
      description = "",
      icon = "",
      background = "",
      role = Role.Damager,
      isRecommended = false,
      primaryStat = Stat.Agility
    },
    [Rogue.Assasin] = {
      ID = Rogue.Assasin,
      name = "Assasination",
      description = "",
      icon = "",
      background = "",
      role = Role.Damager,
      isRecommended = true,
      primaryStat = Stat.Agility
    },
    [Rogue.Combat] = {
      ID = Rogue.Combat,
      name = "Combat",
      description = "",
      icon = "",
      background = "",
      role = Role.Damager,
      isRecommended = true,
      primaryStat = Stat.Agility
    },
    [Rogue.Sub] = {
      ID = Rogue.Sub,
      name = "Subtlety",
      description = "",
      icon = "",
      background = "",
      role = Role.Damager,
      isRecommended = false,
      primaryStat = Stat.Agility
    },
    [Priest.Disc] = {
      ID = Priest.Disc,
      name = "Discipline",
      description = "",
      icon = "",
      background = "",
      role = Role.Healer,
      isRecommended = true,
      primaryStat = Stat.Intellect
    },
    [Priest.Holy] = {
      ID = Priest.Holy,
      name = "Holy",
      description = "",
      icon = "",
      background = "",
      role = Role.Healer,
      isRecommended = true,
      primaryStat = Stat.Intellect
    },
    [Priest.Shadow] = {
      ID = Priest.Shadow,
      name = "Shadow",
      description = "",
      icon = "",
      background = "",
      role = Role.Damager,
      isRecommended = false,
      primaryStat = Stat.Intellect
    },
    [Shaman.Ele] = {
      ID = Shaman.Ele,
      name = "Elemental",
      description = "",
      icon = "",
      background = "",
      role = Role.Damager,
      isRecommended = true,
      primaryStat = Stat.Intellect
    },
    [Shaman.Enh] = {
      ID = Shaman.Enh,
      name = "Enhancement",
      description = "",
      icon = "",
      background = "",
      role = Role.Damager,
      isRecommended = true,
      primaryStat = Stat.Strength
    },
    [Shaman.Resto] = {
      ID = Shaman.Resto,
      name = "Restoration",
      description = "",
      icon = "",
      background = "",
      role = Role.Healer,
      isRecommended = true,
      primaryStat = Stat.Intellect
    },
    [Mage.Arcane] = {
      ID = Mage.Arcane,
      name = "Arcane",
      description = "",
      icon = "",
      background = "",
      role = Role.Damager,
      isRecommended = false,
      primaryStat = Stat.Intellect
    },
    [Mage.Fire] = {
      ID = Mage.Fire,
      name = "Fire",
      description = "",
      icon = "",
      background = "",
      role = Role.Damager,
      isRecommended = true,
      primaryStat = Stat.Intellect
    },
    [Mage.Frost] = {
      ID = Mage.Frost,
      name = "Frost",
      description = "",
      icon = "",
      background = "",
      role = Role.Damager,
      isRecommended = true,
      primaryStat = Stat.Intellect
    },
    [Warlock.Affl] = {
      ID = Warlock.Affl,
      name = "Affliction",
      description = "",
      icon = "",
      background = "",
      role = Role.Damager,
      isRecommended = false,
      primaryStat = Stat.Intellect
    },
    [Warlock.Demo] = {
      ID = Warlock.Demo,
      name = "Demonology",
      description = "",
      icon = "",
      background = "",
      role = Role.Damager,
      isRecommended = true,
      primaryStat = Stat.Intellect
    },
    [Warlock.Destro] = {
      ID = Warlock.Destro,
      name = "Destruction",
      description = "",
      icon = "",
      background = "",
      role = Role.Damager,
      isRecommended = false,
      primaryStat = Stat.Intellect
    },
    [Druid.Balance] = {
      ID = Druid.Balance,
      name = "Balance",
      description = "",
      icon = "",
      background = "",
      role = Role.Damager,
      isRecommended = true,
      primaryStat = Stat.Intellect
    },
    [Druid.Feral] = {
      ID = Druid.Feral,
      name = "Feral",
      description = "",
      icon = "",
      background = "",
      role = Role.Tank,
      isRecommended = true,
      primaryStat = Stat.Strength
    },
    [Druid.Resto] = {
      ID = Druid.Resto,
      name = "Restoration",
      description = "",
      icon = "",
      background = "",
      role = Role.Healer,
      isRecommended = true,
      primaryStat = Stat.Intellect
    },
    [DK.Frost] = {
      ID = DK.Frost,
      name = "Frost",
      description = "",
      icon = "",
      background = "",
      role = Role.Tank,
      isRecommended = true,
      primaryStat = Stat.Intellect
    },
    [DK.Blood] = {
      ID = DK.Blood,
      name = "Blood",
      description = "",
      icon = "",
      background = "",
      role = Role.Damager,
      isRecommended = true,
      primaryStat = Stat.Intellect
    },
    [DK.Unholy] = {
      ID = DK.Unholy,
      name = "Unholy",
      description = "",
      icon = "",
      background = "",
      role = Role.Damager,
      isRecommended = true,
      primaryStat = Stat.Intellect
    },
    [DH.Havoc] = {
      ID = DH.Havoc,
      name = "Havoc",
      description = "",
      icon = "",
      background = "",
      role = Role.Damager,
      isRecommended = true,
      primaryStat = Stat.Intellect
    },
    [DH.Veng] = {
      ID = DH.Veng,
      name = "Vengeance",
      description = "",
      icon = "",
      background = "",
      role = Role.Tank,
      isRecommended = true,
      primaryStat = Stat.Intellect
    },
    [Monk.BRM] = {
      ID = Monk.BRM,
      name = "Brewmaster",
      description = "",
      icon = "",
      background = "",
      role = Role.Tank,
      isRecommended = true,
      primaryStat = Stat.Agility
    },
    [Monk.MW] = {
      ID = Monk.MW,
      name = "Mistweaver",
      description = "",
      icon = "",
      background = "",
      role = Role.Healer,
      isRecommended = true,
      primaryStat = Stat.Intellect
    },
    [Monk.WW] = {
      ID = Monk.WW,
      name = "Windwalker",
      description = "",
      icon = "",
      background = "",
      role = Role.Damager,
      isRecommended = true,
      primaryStat = Stat.Agility
    }
  }

  LibClassicSpecs.SpecInfo = SpecInfo

  local ROLE_MAP = {}
  for specId, v in pairs(SpecInfo) do
    ROLE_MAP[specId] = v.role
  end

  LibClassicSpecs.GetClassInfo = function(classId)
    local info = ClassByID[classId]
    return info.displayName, info.name, info.ID
  end

  LibClassicSpecs.GetNumSpecializationsForClassID = function(classId)
    local class = ClassByID[classId]
    local specs = NAME_TO_SPEC_MAP[class.name]
    return #specs
  end

  LibClassicSpecs.GetInspectSpecialization = function()
    return nil
  end

  LibClassicSpecs.GetActiveSpecGroup = function()
    return 1 -- primary spec slot
  end

  LibClassicSpecs.GetSpecialization = function(isInspect, isPet, groupId)
    if (isInspect or isPet) then
      return nil
    end
    local specIndex
    local max = 0
    for tabIndex = 1, GetNumTalentTabs() do
      local spent = select(3, GetTalentTabInfo(tabIndex))
      if (spent > max) then
        specIndex = tabIndex
        max = spent
      end
    end
    return specIndex
  end

  LibClassicSpecs.GetSpecializationInfo = function(specIndex, isInspect, isPet, inspectTarget, sex)
    if (isInspect or isPet) then
      return nil
    end
    local _, className = UnitClass("player")
    local specId = NAME_TO_SPEC_MAP[className][specIndex]

    if not specId then
      return nil
    end

    --[===[@debug
    print("GetSpecializationInfo", specIndex, className, specId) --@end-debug]===]

    local spec = SpecInfo[specId]
    return spec.ID, spec.name, spec.description, spec.icon, spec.background, spec.role, spec.primaryStat
  end

  LibClassicSpecs.GetSpecializationInfoForClassID = function(classId, specIndex)
    local class = ClassByID[classId]
    if not class then
      return nil
    end

    --[===[@debug
    print("GetSpecializationInfoForClassID", classId, class.name, specIndex) --@end-debug]===]
    local specId = NAME_TO_SPEC_MAP[class.name][specIndex]
    local info = SpecInfo[specId]

    if not info then
      return nil
    end

    local isAllowed = classId == UnitClass("player")
    return info.ID, info.name, info.description, info.icon, info.role, info.isRecommended, isAllowed
  end

  LibClassicSpecs.GetSpecializationRoleByID = function(specId)
    return ROLE_MAP[specId]
  end

  LibClassicSpecs.GetSpecializationRole = function(specIndex, isInspect, isPet)
    if (isInspect or isPet) then
      return nil
    end
    local _, className = UnitClass("player")
    local specId = NAME_TO_SPEC_MAP[className][specIndex]
    return ROLE_MAP[specId]
  end

  LibClassicSpecs.GetNumClasses = function()
    return #ClassByID
  end
end
