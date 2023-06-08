-- This is the Sample Mod!

-- I would recommend keeping your mod_id in a variable to access with create() methods and stuff
-- there's a bunch of methods that prepend your mod_id to the name/oids so it comes in handy!
MOD_NAME = "mifeng"

-- store a ref to our book menu for later
MY_BOOK_MENU = nil
MY_BOOK_OBJ = nil
currentStyle = nil;

-- register is called first to register your mod with the game
-- https://wiki.apico.buzz/wiki/Modding_API#register()
function register()
    -- register our mod name, hooks, and local modules
    -- you can see a full list of hooks here:
    -- https://wiki.apico.buzz/wiki/Modding_API#Hooks
    return {
        name = MOD_NAME,
        hooks = {"ready", "pdraw", "tdraw"}, -- subscribe to hooks we want so they're called
        modules = {"define", "scripts"} -- load other modules we need, in this case "/modules/define.lua" and "/modules/scripts.lua"
    }
end

-- init is called once registered and gives you a chance to run any setup code
-- https://wiki.apico.buzz/wiki/Modding_API#init()
function init()

    -- turn on devmode
    api_set_devmode(true)

    -- log to the console
    api_log("init", "Hello World!")

    -- here you can define all your stuff!
    -- i recommend you comment all of these out and play with them one by one until you understand how each works
    -- all define scripts are in "/modules/define.lua"

    -- if you dont return success here your mod will not load
    -- this can be useful if your define fails as you can decide to NOT return "Success" to tell APICO
    -- that something went wrong and to ignore your mod
    return "Success"
end

function click()

    highlighted = api_get_highlighted("slot")
    if highlighted ~= nil then
        inst = api_get_inst(highlighted)
        if inst[MOD_NAME.."_space_buns"] == true then
            currentStyle = MOD_NAME_space_buns;
        elseif inst[MOD_NAME.."_top_bun"] == true then
                currentStyle = MOD_NAME_top_bun;
        elseif inst[MOD_NAME.."_pigtails"] == true then
            currentStyle = MOD_NAME_pigtails;
        elseif inst[MOD_NAME.."_side_part"] == true then
            currentStyle = MOD_NAME_side_part;
        elseif inst[MOD_NAME.."_double_braids"] == true then
            currentStyle = MOD_NAME_double_braids;
        elseif inst[MOD_NAME.."_long_hair"] == true then
            currentStyle = MOD_NAME_long_hair;
        elseif inst[MOD_NAME.."_veil"] == true then
            currentStyle = MOD_NAME_veil;
        end
    end
end

function tdraw()
    -- draw the backs to the player's clothes
    draw_player_clothes(false)
end

function pdraw()
    -- draw the fronts to the player's clothes
    draw_player_clothes(true)
end

function draw_player_clothes(is_front)
    -- get position
    player_pos = api_get_player_position()
    cam_pos = api_get_cam()
    px = player_pos["x"] - 9
    py = player_pos["y"]
    player_walking = (api_gp(api_get_player_instance(),"sprite_index") == 376.0)

    -- where to start picking frames from
    if is_front then
        draw_frame = 0
    else
        draw_frame = 2
        px = px - cam_pos["x"]
        py = py - cam_pos["y"]
    end


    for i=0,5,1 do
        if CLOTHING_IDS[i]~= nil then
            if player_walking then
                if api_gp(api_get_player_instance(),"dir") == "left" then
                    api_draw_sprite_ext(currentStyle, api_gp(api_get_player_instance(),"image_index"), px + 18, py, -1, 1, 0, nil, 1)
                else
                    api_draw_sprite_ext(currentStyle, api_gp(api_get_player_instance(),"image_index"), px, py, 1, 1, 0, nil, 1)
                end
            else
                if api_gp(api_get_player_instance(),"dir") == "left" then
                    api_draw_sprite_ext(currentStyle, api_gp(api_get_player_instance(),"image_index"), px + 18, py, -1, 1, 0, nil, 1)

                else
                    api_draw_sprite_ext(currentStyle, api_gp(api_get_player_instance(),"image_index"), px, py, 1, 1, 0, nil, 1)
                end
            end
        end
    end
end

-- ready is called once all mods are ready and once the world has loaded any undefined instances from mods in the save
-- https://wiki.apico.buzz/wiki/Modding_API#ready()
function ready()

    -- if we haven't already spawned our new npc, spawn them
    friend = api_get_menu_objects(nil, "npc69")
    if #friend == 0 then
        player = api_get_player_position()
        api_create_obj("npc69", player["x"] + 16, player["y"] - 32)
    end

    -- play a sound to celebrate our mod loading! :D
    api_play_sound("confetti")

end
