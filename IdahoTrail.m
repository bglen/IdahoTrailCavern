clear
clc
warning('off','all'); % turns off all warning messages


load Adventure

running = 1;
posX = 1;
posY = 1;

imshow([World{1,:};World{2,:};World{3,:};World{4,:};World{5,:};World{6,:};World{7,:};World{8,:};World{9,:};World{10,:};]);



while running == 1
    h = figure(1);
    waitforbuttonpress;
    
    %W or up arrow
    if get(h, 'CurrentKey') == 'downarrow'
        World{posY, posX} = Blank;
        posY = posY + 1;
        World{posY, posX} = Player;
    end
    %A or left arraw
    if get(h, 'CurrentKey') == 'downarrow'
        World{posY, posX} = Blank;
        posY = posY + 1;
        World{posY, posX} = Player;
    end
    %D or right awwaor
    if get(h, 'CurrentKey') == 'downarrow'
        World{posY, posX} = Blank;
        posY = posY + 1;
        World{posY, posX} = Player;
    end
    %S or down arow
    if get(h, 'CurrentKey') == 'downarrow'
        World{posY, posX} = Blank;
        posY = posY + 1;
        World{posY, posX} = Player;
    end 
    %SPACE to attac
    %ESCAPE to end game/return to home menu
    
    
    %move enemies
    imshow([World{1,:};World{2,:};World{3,:};World{4,:};World{5,:};World{6,:};World{7,:};World{8,:};World{9,:};World{10,:};]);

end
