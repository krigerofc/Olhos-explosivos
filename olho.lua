hook.Add("Think", "olho", function()

    --local olhotraco = Player():GetEyeTrace()
    local olhotraco = player.GetAll()
    for i, ply in ipairs(olhotraco) do
        local olho = ply:GetEyeTrace()
        if olho.Entity:IsNPC() then
            olho.Entity:SetVelocity(Vector(0,0,5))
            olho.Entity:Ignite(60, 1)
            local explosion = ents.Create("env_explosion") -- cria uma entidade de explosão
            explosion:SetPos(olho.Entity:GetPos()) -- posiciona a explosão no NPC
            explosion:Spawn() -- cria a explosão
            explosion:SetKeyValue("iMagnitude", "5") -- define a magnitude da explosão
            explosion:Fire("Explode", 0, 0) -- faz a explosão explodir imediatamente
        end
    end
    --chat.AddText(olhotraco.Entity)
    
end)

hook.Add("EntityTakeDamage", "patria", function(target, dmginfo)
    if target:IsNPC() and target:IsOnFire() then
        local original_damage = dmginfo:GetDamage()
        local novo_dano = original_damage * 3
        dmginfo:SetDamage(novo_dano)
    end
end)

hook.Add("OnNPCKilled", "npcmorto", function(npc, attacker, inflictor)
    npc:SetModel("models/player/corpse1.mdl")
    
end)