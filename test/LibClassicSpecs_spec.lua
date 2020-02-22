_G.strmatch = string.match
require("Lib/LibStub/LibStub")

require("LibClassicSpecs")

insulate("LibClassicSpecs", function()
  local LCS
  local Role
  local Class

  before_each(function()
    LCS = LibStub("LibClassicSpecs")
    Role = LCS.Role
    Class = LCS.Class
  end)

  describe("GetActiveSpecGroup", function()
    it("always returns 1", function()
      assert.are.equal(1, LCS.GetActiveSpecGroup())
    end)
  end)  -- GetActiveSpecGroup

  describe("GetNumClasses", function()
    it("always returns 12", function()
      assert.are.equal(12, LCS.GetNumClasses())
    end)
  end)  -- GetNumClasses

  describe("GetSpecialization", function()
    local TALENTS_17_34_0 = {17, 34, 0}
    before_each(function()
      _G.GetNumTalentTabs = function() return 3 end

      _G.GetNumTalents = function() return 17 end

      _G.GetTalentTabInfo = function(tabIndex, talentIndex)
        local spent = TALENTS_17_34_0[tabIndex] or 0
        return nil, nil, spent, nil
      end
    end)

    it("returns the tabIndex for the tab with most spent talent points", function()
      assert.are.equal(2, LCS.GetSpecialization())
    end)

    it("returns nil for isInspect", function()
      assert.is_nil(LCS.GetSpecialization(true))
    end)

    it("returns nil for isPet", function()
      assert.is_nil(LCS.GetSpecialization(nil, true))
    end)
  end)  -- GetSpecialization

  describe("GetSpecializationRole", function()
    before_each(function()
      _G.UnitClass = function()
        return Class.Warrior.ID, Class.Warrior.name
      end
    end)

    it("returns a role for each specIndex for the current class", function()
      assert.are.equal(Role.Damager, LCS.GetSpecializationRole(1))  -- Warrior.Arms
      assert.are.equal(Role.Damager, LCS.GetSpecializationRole(2))  -- Warrior.Fury
      assert.are.equal(Role.Tank, LCS.GetSpecializationRole(3))  -- Warrior.Prot
    end)

    it("returns nil for isInspect", function()
      assert.is_nil(LCS.GetSpecializationRole(1, true))
    end)

    it("returns nil for isPet", function()
      assert.is_nil(LCS.GetSpecializationRole(1, false, true))
    end)
  end)  -- GetSpecializationRole

  describe("GetSpecializationInfoForClassID", function()
    before_each(function()
      _G.UnitClass = function()
        return Class.Warrior.ID, Class.Warrior.name
      end
    end)

    it("returns nil on invalid classId", function()
      assert.is_nil(LCS.GetSpecializationInfoForClassID(0))
    end)

    it("returns nil on invalid specIndex", function()
      assert.is_nil(LCS.GetSpecializationInfoForClassID(Class.Warrior.ID, 5))
    end)

    it("returns spec info for a valid class/spec", function()
      local ID, name, description, icon, role, isRecommended, isAllowed = LCS.GetSpecializationInfoForClassID(Class.Warrior.ID, 1)
      assert.are.equal(Class.Warrior.Arms, ID)
      assert.are.equal("Arms", name)
      assert.are.equal(Role.Damager, role)

      ID, name, description, icon, role, isRecommended, isAllowed = LCS.GetSpecializationInfoForClassID(Class.Priest.ID, 1)
      assert.are.equal(Class.Priest.Disc, ID)
      assert.are.equal("Discipline", name)
      assert.are.equal(Role.Healer, role)
    end)

    it("returns isAllowed == true for the current class", function()
      local isAllowed = select(7, LCS.GetSpecializationInfoForClassID(Class.Warrior.ID, 1))
      assert.True(isAllowed)
    end)

    it("returns isAllowed == false for the any other class", function()
      local isAllowed = select(7, LCS.GetSpecializationInfoForClassID(Class.Priest.ID, 1))
      assert.False(isAllowed)
    end)
  end)  -- GetSpecializationInfoForClassID

  describe("GetSpecializationInfo", function()
    before_each(function()
      _G.UnitClass = function()
        return Class.Warrior.ID, Class.Warrior.name
      end
    end)

    it("returns nil on isInspect", function()
      assert.is_nil(LCS.GetSpecializationInfo(1, true))
    end)

    it("returns nil on isPet", function()
      assert.is_nil(LCS.GetSpecializationInfo(1, false, true))
    end)

    it("returns nil on invalid specIndex", function()
      assert.is_nil(LCS.GetSpecializationInfo(5))
    end)

    it("returns spec info for the current class's specIndex", function()
      local ID, name, description, icon, bg, role, primaryStat = LCS.GetSpecializationInfo(1)
      assert.are.equal(Class.Warrior.Arms, ID)
      assert.are.equal("Arms", name)
      assert.are.equal(Role.Damager, role)
      assert.are.equal(LCS.Stat.Strength, primaryStat)

      ID, name, description, icon, bg, role, primaryStat = LCS.GetSpecializationInfo(3)
      assert.are.equal(Class.Warrior.Prot, ID)
      assert.are.equal("Protection", name)
      assert.are.equal(Role.Tank, role)
      assert.are.equal(LCS.Stat.Strength, primaryStat)
    end)
  end)  -- GetSpecializationInfo

  describe("GetSpecializationRoleByID", function()
    it("returns a role for each class spec", function()
      assert.are.equal(Role.Damager, LCS.GetSpecializationRoleByID(Class.Warrior.Arms))
      assert.are.equal(Role.Damager, LCS.GetSpecializationRoleByID(Class.Warrior.Fury))
      assert.are.equal(Role.Tank, LCS.GetSpecializationRoleByID(Class.Warrior.Prot))

      assert.are.equal(Role.Healer, LCS.GetSpecializationRoleByID(Class.Paladin.Holy))
      assert.are.equal(Role.Tank, LCS.GetSpecializationRoleByID(Class.Paladin.Prot))
      assert.are.equal(Role.Damager, LCS.GetSpecializationRoleByID(Class.Paladin.Ret))

      assert.are.equal(Role.Damager, LCS.GetSpecializationRoleByID(Class.Hunter.BM))
      assert.are.equal(Role.Damager, LCS.GetSpecializationRoleByID(Class.Hunter.MM))
      assert.are.equal(Role.Damager, LCS.GetSpecializationRoleByID(Class.Hunter.SV))

      assert.are.equal(Role.Damager, LCS.GetSpecializationRoleByID(Class.Rogue.Combat))
      assert.are.equal(Role.Damager, LCS.GetSpecializationRoleByID(Class.Rogue.Assasin))
      assert.are.equal(Role.Damager, LCS.GetSpecializationRoleByID(Class.Rogue.Sub))

      assert.are.equal(Role.Healer, LCS.GetSpecializationRoleByID(Class.Priest.Disc))
      assert.are.equal(Role.Healer, LCS.GetSpecializationRoleByID(Class.Priest.Holy))
      assert.are.equal(Role.Damager, LCS.GetSpecializationRoleByID(Class.Priest.Shadow))

      assert.are.equal(Role.Damager, LCS.GetSpecializationRoleByID(Class.Shaman.Ele))
      assert.are.equal(Role.Damager, LCS.GetSpecializationRoleByID(Class.Shaman.Enh))
      assert.are.equal(Role.Healer, LCS.GetSpecializationRoleByID(Class.Shaman.Resto))

      assert.are.equal(Role.Damager, LCS.GetSpecializationRoleByID(Class.Mage.Arcane))
      assert.are.equal(Role.Damager, LCS.GetSpecializationRoleByID(Class.Mage.Fire))
      assert.are.equal(Role.Damager, LCS.GetSpecializationRoleByID(Class.Mage.Frost))

      assert.are.equal(Role.Damager, LCS.GetSpecializationRoleByID(Class.Warlock.Affl))
      assert.are.equal(Role.Damager, LCS.GetSpecializationRoleByID(Class.Warlock.Demo))
      assert.are.equal(Role.Damager, LCS.GetSpecializationRoleByID(Class.Warlock.Destro))

      assert.are.equal(Role.Damager, LCS.GetSpecializationRoleByID(Class.Druid.Balance))
      assert.are.equal(Role.Tank, LCS.GetSpecializationRoleByID(Class.Druid.Feral))
      assert.are.equal(Role.Healer, LCS.GetSpecializationRoleByID(Class.Druid.Resto))
    end)

    it("returns nil for an invalid specId", function()
      assert.are.equal(nil, LCS.GetSpecializationRoleByID(0))
      assert.are.equal(nil, LCS.GetSpecializationRoleByID(nil))
    end)
  end)  -- GetSpecializationRoleByID

end)
